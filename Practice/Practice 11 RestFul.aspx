<%@ Page Language="C#" AutoEventWireup="true"  ClassName="Practice_1" Inherits="System.Web.UI.Page"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" data-ng-app="demoApp">
<head id="Head1" runat="server">
    <title> AngularJS </title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap-theme.css" rel="stylesheet" />
    <script src="Scripts/angular.js"></script>
    <script src="Scripts/angular-route-min.js"></script>
    <script src="Scripts/angular-animate.min.js"></script>
    <script src="Scripts/angular-resource.js"></script>

    <style type="text/css">
        .reveal-animation.ng-enter {
          -webkit-animation: enter_sequence 1s linear; /* Safari/Chrome */
          -moz-animation: enter_sequence 1s linear; /* Firefox */
          -o-animation: enter_sequence 1s linear; /* Opera */
          animation: enter_sequence 1s linear; /* IE10+ and Future Browsers */
        }
        @-webkit-keyframes enter_sequence {
          from { opacity:0; }
          to { opacity:1; }
        }
        @-moz-keyframes enter_sequence {
          from { opacity:0; }
          to { opacity:1; }
        }
        @-o-keyframes enter_sequence {
          from { opacity:0; }
          to { opacity:1; }
        }
        @keyframes enter_sequence {
          from { opacity:0; }
          to { opacity:1; }
        }
        </style>
</head>
<body>
    <div class="container">
      <div data-ng-controller="navbarController" class="header">
        <ul class="nav nav-pills pull-right">
          <li data-ng-class="{'active':highlight('/home')}"><a href="#/home">Home</a></li>
          <li data-ng-class="{'active':highlight('/search')}"><a href="#/search">Search</a></li>
          <li><a href="#">Contact</a></li>
        </ul>
        <h3 class="text-muted">Single Page Application</h3>
      </div>

      <div class="jumbotron">
        <h2>AngularJS SPA with RESTful backend</h2>
    </div>

        <div class="row marketing">
       
            <div class="reveal-animation" data-ng-view=""></div>
        </div>
</div>

    <script>

        var demoApp = angular.module('demoApp', ['ngRoute', 'ngAnimate', 'ngResource'])
            .factory('Customers', ['$resource', function ($resource) {

                var urlBase = '/api/customers';
                return $resource(urlBase, {}, {
                    query: { method: 'GET', params: { }, isArray: true }
                });
            }]);

        demoApp.config(function ($routeProvider) {
            $routeProvider
                .when('/home',
                    {
                        controller: 'SimpleController',
                        templateUrl: 'partial/view1.html'
                    })
                .when('/search',
                    {
                        controller: 'SimpleController',
                        templateUrl: 'partial/view2.html'
                    })
                .otherwise({ redirectTo: '/home' });
        });

        var controllers = {};

        controllers.navbarController = function($scope, $location) {
            $scope.highlight = function (path) {
                //alert(path + '    ' + $location.path().substr(0, path.length));

                return $location.path().substr(0, path.length) == path;
            };
        };

        controllers.SimpleController = function ($scope, Customers) {
            $scope.customers = [];
            $scope.status;
            $scope.statusClass;
            $scope.customer = { Id: undefined, Name: undefined, City: undefined };

            function init() {
                 getCustomers();
            }

            function getCustomers() {
                $scope.customers  = Customers.query();

            }

            $scope.newCustomer = function () {
                
                $scope.customer.Id = '';
                $scope.customer.Name = '';
                $scope.customer.City = '';
            };

            $scope.selectCustomerToUpdate = function(id) {
                var cust;
                for (var i = 0; i < $scope.customers.length; i++) {
                    var currCust = $scope.customers[i];
                    if (currCust.Id == id) {
                        cust = currCust;
                        break;
                    }
                }

                if (cust == undefined)
                    return;

                $scope.customer.Id = cust.Id;
                $scope.customer.Name = cust.Name;
                $scope.customer.City = cust.City;

            };

            $scope.saveCustomer = function () {
                
                var cust = {
                    Id: $scope.customer.Id,
                    Name: $scope.customer.Name,
                    City: $scope.customer.City
                };
                
                if (cust.Id) {
                    $scope.updateCustomer(cust);
                } else {
                    $scope.insertCustomer(cust);
                }
            };

            $scope.updateCustomer = function (cust) {
                $scope.status = 'Updating customer';
                $scope.statusClass = 'alert alert-info';

                Customers.save(cust, function () {
                    $scope.status = 'Updated customer! Refreshing customer list';
                    $scope.statusClass = 'alert alert-success';

                    for (var i = 0; i < $scope.customers.length; i++) {
                        var currCust = $scope.customers[i];
                        if (currCust.Id == $scope.customer.Id) {
                            currCust.Name = $scope.customer.Name;
                            currCust.City = $scope.customer.City;
                            break;
                        }
                    }


                }, function (error) {
                        $scope.status = 'Unable to update customer:' + error.message;
                        $scope.statusClass = 'alert alert-danger';

                });
            };

            $scope.insertCustomer = function (cust) {
                $scope.status = 'Inserting new customer';
                $scope.statusClass = 'alert alert-info';

                Customers.save(cust, function(newCust) {
                        $scope.status = 'Inserted customer! Refreshing customer list';
                        $scope.statusClass = 'alert alert-success';

                        $scope.customer.Id = newCust.Id;
                        $scope.customers.push(newCust);
                    }, function (error) {
                        $scope.status = 'Unable to update customer:' + error.message;
                        $scope.statusClass = 'alert alert-danger';

                    });
            };

            $scope.deleteCustomer = function (id) {
                $scope.statusClass = 'alert alert-info';
                $scope.status = 'Deleting customer';

                Customers.delete({id: id}, function () {
                        $scope.status = 'Deleted customer! Refreshing customer list';
                        $scope.statusClass = 'alert alert-success';

                        for (var i = 0; i < $scope.customers.length; i++) {
                            var currCust = $scope.customers[i];
                            if (currCust.Id == id) {
                                $scope.customers.splice(i, 1);
                                break;
                            }
                        }
                    }, function (error) {
                        $scope.status = 'Unable to delete customer:' + error.message;
                        $scope.statusClass = 'alert alert-danger';

                    });
                return false;
            };
            init();

        };

        demoApp.controller(controllers);
    </script>
</body>
</html>
