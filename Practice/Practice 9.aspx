<%@ Page Language="C#" AutoEventWireup="true"  ClassName="Practice_1" Inherits="System.Web.UI.Page"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" data-ng-app="demoApp">
<head runat="server">
    <title> AngularJS </title>
    <script src="Scripts/angular.js"></script>
    <script src="Scripts/angular-route-min.js"></script>
    <script src="Scripts/angular-animate.min.js"></script>
</head>
<body>
    <h1>The Role of Factories</h1>
        
    <div data-ng-view=""></div>

    <script>

        var demoApp = angular.module('demoApp', ['ngRoute', 'ngAnimate'])
            .factory('simpleFactory', function() {
                var factory = {};
                var customers = [{ name: 'Abu Ali', city: 'Madina' }
                , { name: 'Hamid Khatri', city: 'Makkah' }
                , { name: 'Abdul Lateef', city: 'Madina' }
                , { name: 'Qasim', city: 'Hyderabad' }];

                factory.getCustomers = function() {
                    return customers;
                };

                return factory;
            });

        demoApp.config(function($routeProvider) {
            $routeProvider
                .when('/',
                    {
                        controller: 'SimpleController',
                        templateUrl: 'partial/view1.html'
                    })
                .when('/view2',
                    {                        
                        controller: 'SimpleController',
                        templateUrl: 'partial/view2.html'
                    })
                .otherwise({ redirectTo: '/' });
        });

        var controllers = {};
        controllers.SimpleController = function ($scope, simpleFactory) {
            $scope.customers = [];

            init();
            function init() {
                $scope.customers = simpleFactory.getCustomers();
            }

            $scope.addCustomer = function() {
                $scope.customers.push(
                    {
                        name: $scope.newCustomer.name,
                        city: $scope.newCustomer.city
                    });
            };
        };

        demoApp.controller(controllers);
    </script>
</body>
</html>
