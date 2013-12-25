<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Practice1.aspx.cs" Inherits="Directives.Practice1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" data-ng-app="practice1">
<head runat="server">
    <title></title>
    <script src="Scripts/angular.js"></script>

</head>
<body>
    <div id="ddddd" data-ng-controller="directiveController" data-ng-init="">
    <input type="text" data-ng-model="city" /><br/>
    <div>{{city}}</div><br/>

    <div ng-address ng-model="address1">
        
    </div>
            
    <script>
        var app = angular.module('practice1', []);
        app.value('address1', {city: 'Al Madina Al Munawwarah',address: 'Backside of Pakistan House No. 1, Saharah e Sultana', country: 'Saudia Arab'});
        app.controller('directiveController', function($scope) {
            //$scope.
        })
            .directive('ngAddress', function () {
                return {
                    // restrict: 'A',
               require: '^ngModel',
                    scope: {
                        ngModel: '='
                        
                    },
                    template: '<div><div>Address: {{ngModel.address}}</div> <div>City: {{ngModel.city}}</div> <div>Country: {{ngModel.country}}</div></div>'
            };
        });
    </script>
    </div>
</body>
</html>
