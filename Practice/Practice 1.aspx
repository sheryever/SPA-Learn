<%@ Page Language="C#" AutoEventWireup="true" ClassName="Practice_1" Inherits="System.Web.UI.Page"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" data-ng-app="">
<head runat="server">
    <title> AngularJS </title>
    <script src="Scripts/angular.min.js"></script>
</head>
<body>
    
    <h1>Simple Binding with empty model</h1>
    Name: <br/>
    <input type ="text" data-ng-model="name"/> {{ name }}

</body>
</html>
