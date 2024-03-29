﻿
/*
 AngularJS v1.2.0-rc.2
 (c) 2010-2012 Google, Inc. http://angularjs.org
 License: MIT
*/
(function (q, c, I) {
    'use strict'; function x(c, f) { return m(new (m(function () { }, { prototype: c })), f) } function t(c, f, a, p, n) {
        return {
            restrict: "ECA", terminal: !0, priority: 1E3, transclude: "element", compile: function (g, m, D) {
                return function (u, m, e) {
                    function g() { k && (k.$destroy(), k = null); l && (n.leave(l), l = null) } function s() {
                        var h = c.current && c.current.locals, y = h && h.$template; if (y) {
                            var z = u.$new(); D(z, function (d) {
                                g(); d.html(y); n.enter(d, null, m); var G = a(d.contents()), r = c.current; k = r.scope = z; l = d; if (r.controller) {
                                    h.$scope =
                                    k; var e = p(r.controller, h); r.controllerAs && (k[r.controllerAs] = e); d.data("$ngControllerController", e); d.contents().data("$ngControllerController", e)
                                } G(k); k.$emit("$viewContentLoaded"); k.$eval(b); f()
                            })
                        } else g()
                    } var k, l, b = e.onload || ""; u.$on("$routeChangeSuccess", s); s()
                }
            }
        }
    } var A = c.copy, H = c.equals, m = c.extend, w = c.forEach, v = c.isDefined, B = c.isFunction, C = c.isString; q = c.module("ngRoute", ["ng"]).provider("$route", function () {
        function c(a, p) {
            var f = p.caseInsensitiveMatch, g = { originalPath: a, regexp: a }, m = g.keys = [];
            a = a.replace(/([().])/g, "\\$1").replace(/(\/)?:(\w+)([\?|\*])?/g, function (a, c, p, e) { a = "?" === e ? e : null; e = "*" === e ? e : null; m.push({ name: p, optional: !!a }); c = c || ""; return "" + (a ? "" : c) + "(?:" + (a ? c : "") + (e && "(.+)?" || "([^/]+)?") + ")" + (a || "") }).replace(/([\/$\*])/g, "\\$1"); g.regexp = RegExp("^" + a + "$", f ? "i" : ""); return g
        } var f = {}; this.when = function (a, p) { f[a] = m({ reloadOnSearch: !0 }, p, a && c(a, p)); if (a) { var n = "/" == a[a.length - 1] ? a.substr(0, a.length - 1) : a + "/"; f[n] = m({ redirectTo: a }, c(n, p)) } return this }; this.otherwise = function (a) {
            this.when(null,
            a); return this
        }; this.$get = ["$rootScope", "$location", "$routeParams", "$q", "$injector", "$http", "$templateCache", "$sce", function (a, c, n, g, s, q, u, t) {
            function e() {
                var b = E(), h = l.current; if (b && h && b.$$route === h.$$route && H(b.pathParams, h.pathParams) && !b.reloadOnSearch && !k) h.params = b.params, A(h.params, n), a.$broadcast("$routeUpdate", h); else if (b || h) k = !1, a.$broadcast("$routeChangeStart", b, h), (l.current = b) && b.redirectTo && (C(b.redirectTo) ? c.path(F(b.redirectTo, b.params)).search(b.params).replace() : c.url(b.redirectTo(b.pathParams,
                c.path(), c.search())).replace()), g.when(b).then(function () { if (b) { var a = m({}, b.resolve), c, d; w(a, function (b, c) { a[c] = C(b) ? s.get(b) : s.invoke(b) }); v(c = b.template) ? B(c) && (c = c(b.params)) : v(d = b.templateUrl) && (B(d) && (d = d(b.params)), d = t.getTrustedResourceUrl(d), v(d) && (b.loadedTemplateUrl = d, c = q.get(d, { cache: u }).then(function (b) { return b.data }))); v(c) && (a.$template = c); return g.all(a) } }).then(function (c) { b == l.current && (b && (b.locals = c, A(b.params, n)), a.$broadcast("$routeChangeSuccess", b, h)) }, function (c) {
                    b == l.current &&
                    a.$broadcast("$routeChangeError", b, h, c)
                })
            } function E() { var b, a; w(f, function (e, k) { var d; if (d = !a) { var f = c.path(); d = e.keys; var r = {}; if (e.regexp) if (f = e.regexp.exec(f)) { for (var g = 1, l = f.length; g < l; ++g) { var n = d[g - 1], q = "string" == typeof f[g] ? decodeURIComponent(f[g]) : f[g]; n && q && (r[n.name] = q) } d = r } else d = null; else d = null; d = b = d } d && (a = x(e, { params: m({}, c.search(), b), pathParams: b }), a.$$route = e) }); return a || f[null] && x(f[null], { params: {}, pathParams: {} }) } function F(b, c) {
                var a = []; w((b || "").split(":"), function (b, d) {
                    if (0 ===
                    d) a.push(b); else { var e = b.match(/(\w+)(.*)/), f = e[1]; a.push(c[f]); a.push(e[2] || ""); delete c[f] }
                }); return a.join("")
            } var k = !1, l = { routes: f, reload: function () { k = !0; a.$evalAsync(e) } }; a.$on("$locationChangeSuccess", e); return l
        }]
    }); q.provider("$routeParams", function () { this.$get = function () { return {} } }); q.directive("ngView", t); t.$inject = ["$route", "$anchorScroll", "$compile", "$controller", "$animate"]
})(window, window.angular);
/*
//@ sourceMappingURL=angular-route.min.js.map
*/
