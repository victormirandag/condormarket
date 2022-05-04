<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cerrar.aspx.cs" Inherits="Condormarket_V_4._0._1.cerrar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <%
        HttpCookie cookie = new HttpCookie("session", "no_ok");
        cookie.Expires = DateTime.Now.AddYears(1);
        Response.Cookies.Add(cookie);
        Session["ing"] = "cerrada";
        Response.Redirect("Home.aspx");
        
         %>
    </div>
    </form>
</body>
</html>
