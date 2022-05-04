<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="micuenta.aspx.cs" Inherits="Condormarket_V_4._0._1.micuenta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Tipo de Registro</title> 
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css" />
    <link rel="stylesheet"  type:"text/css" href="formularios.css"/>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 836px;
            font-size: x-large;
        }
    </style>
</head>
<body>
    <div>
        <%   
           
            if (HttpContext.Current.Response.Cookies["session"] != null && Request.Cookies["session"].Value == "ok_negocio" || Session["ing"] == "negocio")
                {
                    Response.WriteFile("cabecera_negocio.html");
                    Session["ing"] = "negocio";

                }
                else
                {
                    if (HttpContext.Current.Response.Cookies["session"] != null && Request.Cookies["session"].Value == "ok_admin" || Session["ing"] == "admin")
                    {
                        Response.WriteFile("cabecera_admin.html");
                        Session["ing"] = "admin";

                    }
                    else
                    {
                        if (HttpContext.Current.Response.Cookies["session"] != null && Request.Cookies["session"].Value == "ok_user" || Session["ing"] == "user")
                        {
                            Response.WriteFile("cabecera_user.html");
                            Session["ing"] = "user";

                        }
                        else
                        {
                            Response.WriteFile("cabecera.html");
                        }
                    }
                }
            
            
        %>
    </div>
    <form id="form1" runat="server">
  
    </form>
</body>
</html>
