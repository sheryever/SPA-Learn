<%@ Page  Language="C#" AutoEventWireup="true" ClassName="Practice_1" Inherits="System.Web.UI.Page" %>

<!DOCTYPE html>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" data-ng-app="">
<head runat="server">
    <title> AngularJS </title>
    <script src="Scripts/angular.min.js"></script>
</head>
<body>
    <h1>Iterating with the ng-repeat Directive</h1>
        
    <div class="container" data-ng-init="names=['Dave', 'Napur', 'Heedy']">
        <h3>Looping with the ng-repeat Diretive</h3>
        <ul>
            <li data-ng-repeat="name in names">{{ name }}</li>
        </ul>
    </div>
</body>
</html>
