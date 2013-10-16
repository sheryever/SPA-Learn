<%@ Page Language="C#" AutoEventWireup="true"  ClassName="Practice_1" Inherits="System.Web.UI.Page"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" data-ng-app="">
<head runat="server">
    <title> AngularJS </title>
    <script src="Scripts/angular.min.js"></script>
</head>
<body>
    <h1>Creating a View and Controller</h1>
        
    <div class="container" data-ng-controller="SimpleController" >
        <h3>Adding a Simple Controller</h3>
        <ul>
            <li data-ng-repeat="customer in customers">{{ customer.name}} - {{ customer.city | uppercase }}</li>
        </ul>
    </div>
    <script>
        function SimpleController($scope) {
            $scope.customers = [{ name: 'Abu Ali', city: 'Madina' }
                , { name: 'Hamid Khatri', city: 'Makkah' }
                , { name: 'Abdul Lateef', city: 'Madina' }
                , { name: 'Qasim', city: 'Hyderabad' }];
        }
    </script>
</body>
</html>
