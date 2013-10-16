<%@ Page Language="C#" AutoEventWireup="true"  ClassName="Practice_1" Inherits="System.Web.UI.Page"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" data-ng-app="">
<head runat="server">
    <title> AngularJS </title>
    <script src="Scripts/angular.min.js"></script>
</head>
<body>
    <h1>Using Filters</h1>
        
    <div class="container" data-ng-init="customers = [{name : 'Abu Ali', city: 'Madina' }, {name : 'Hamid Khatri', city: 'Makkah' }, {name : 'Abdul Lateef', city: 'Madina' }, {name : 'Qasim', city: 'Hyderabad' } ]">
        <h3>Using uppercase Filter</h3>
        <ul>
            <li data-ng-repeat="customer in customers">{{ customer.name | uppercase }}</li>
        </ul>
        
        <h3>Using filter Filter to filtering data</h3>
        Search : <br/>
        <input type="text" data-ng-model="searchText"/>
        <ul>
            <li data-ng-repeat="customer in customers | filter:searchText | orderBy: 'name'"></li>
        </ul>
    </div>
</body>
</html>
