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
    <h1>Defining Routes</h1>
    <a href="#/">View 1</a>   | <a href="#/view2">View 1</a>   
    <div data-ng-view=""></div>

    <script>

        var demoApp = angular.module('demoApp', ['ngRoute', 'ngAnimate']);

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
        controllers.SimpleController = function($scope) {
            $scope.customers = [{ Name: 'Abu Ali', City: 'Madina' }
                , { Name: 'Hamid Khatri', City: 'Makkah' }
                , { Name: 'Abdul Lateef', City: 'Madina' }
                , { Name: 'Qasim', City: 'Hyderabad' }];

            $scope.saveCustomer = function () {
                $scope.customers.push(
                    {
                        Name: $scope.customer.Name,
                        City: $scope.customer.City
                    });
            };
        };

        demoApp.controller(controllers);
    </script>
</body>
</html>
