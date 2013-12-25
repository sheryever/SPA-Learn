[33mcommit 174fb45d08820682e36d5ef0604dc5a525e6750b[m
Author: Abu Ali Muhammad Sharjeel <sheryever@hotmail.com>
Date:   Mon Oct 21 13:42:36 2013 +0300

    fixes
    
    Practice 8, Practice 9

[1mdiff --git a/Practice/Practice 8.aspx b/Practice/Practice 8.aspx[m
[1mindex c07b617..33dd46d 100644[m
[1m--- a/Practice/Practice 8.aspx[m	
[1m+++ b/Practice/Practice 8.aspx[m	
[36m@@ -11,7 +11,7 @@[m
 </head>[m
 <body>[m
     <h1>Defining Routes</h1>[m
[31m-        [m
[32m+[m[32m    <a href="#/">View 1</a>   | <a href="#/view2">View 1</a>[m[41m   [m
     <div data-ng-view=""></div>[m
 [m
     <script>[m
[36m@@ -35,16 +35,16 @@[m
 [m
         var controllers = {};[m
         controllers.SimpleController = function($scope) {[m
[31m-            $scope.customers = [{ name: 'Abu Ali', city: 'Madina' }[m
[31m-                , { name: 'Hamid Khatri', city: 'Makkah' }[m
[31m-                , { name: 'Abdul Lateef', city: 'Madina' }[m
[31m-                , { name: 'Qasim', city: 'Hyderabad' }];[m
[32m+[m[32m            $scope.customers = [{ Name: 'Abu Ali', City: 'Madina' }[m
[32m+[m[32m                , { Name: 'Hamid Khatri', City: 'Makkah' }[m
[32m+[m[32m                , { Name: 'Abdul Lateef', City: 'Madina' }[m
[32m+[m[32m                , { Name: 'Qasim', City: 'Hyderabad' }];[m
 [m
[31m-            $scope.addCustomer = function() {[m
[32m+[m[32m            $scope.saveCustomer = function () {[m
                 $scope.customers.push([m
                     {[m
[31m-                        name: $scope.newCustomer.name,[m
[31m-                        city: $scope.newCustomer.city[m
[32m+[m[32m                        Name: $scope.customer.Name,[m
[32m+[m[32m                        City: $scope.customer.City[m
                     });[m
             };[m
         };[m
[1mdiff --git a/Practice/Practice 9.aspx b/Practice/Practice 9.aspx[m
[1mindex ed454ff..7284574 100644[m
[1m--- a/Practice/Practice 9.aspx[m	
[1m+++ b/Practice/Practice 9.aspx[m	
[36m@@ -19,10 +19,10 @@[m
         var demoApp = angular.module('demoApp', ['ngRoute', 'ngAnimate'])[m
             .factory('simpleFactory', function() {[m
                 var factory = {};[m
[31m-                var customers = [{ name: 'Abu Ali', city: 'Madina' }[m
[31m-                , { name: 'Hamid Khatri', city: 'Makkah' }[m
[31m-                , { name: 'Abdul Lateef', city: 'Madina' }[m
[31m-                , { name: 'Qasim', city: 'Hyderabad' }];[m
[32m+[m[32m                var customers = [{ Name: 'Abu Ali', City: 'Madina' }[m
[32m+[m[32m                , { Name: 'Hamid Khatri', City: 'Makkah' }[m
[32m+[m[32m                , { Name: 'Abdul Lateef', City: 'Madina' }[m
[32m+[m[32m                , { Name: 'Qasim', City: 'Hyderabad' }];[m
 [m
                 factory.getCustomers = function() {[m
                     return customers;[m
[36m@@ -55,11 +55,11 @@[m
                 $scope.customers = simpleFactory.getCustomers();[m
             }[m
 [m
[31m-            $scope.addCustomer = function() {[m
[32m+[m[32m            $scope.saveCustomer = function() {[m
                 $scope.customers.push([m
                     {[m
[31m-                        name: $scope.newCustomer.name,[m
[31m-                        city: $scope.newCustomer.city[m
[32m+[m[32m                        Name: $scope.customer.Name,[m
[32m+[m[32m                        City: $scope.customer.City[m
                     });[m
             };[m
         };[m
