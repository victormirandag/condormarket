<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login1.aspx.cs" Inherits="Condormarket_V_4._0._1.Login1" %>

<!DOCTYPE html >
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
     <link rel="stylesheet"  type:"text/css" href="formularios.css"/>
    <title>ALMA CHILE</title>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 60%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
<body >
      <%   
         
                    Response.WriteFile("cabecera.html");
             
        %>
    <div class="modal-dialog text-center">
        <div class="modal-content">
      <form runat="server">
           <div class="form-group" id="user-group">
          <table style="height: 158px; width: 150px" align="center">
              <tr>
                  <td><img src="https://i0.wp.com/www.winhelponline.com/blog/wp-content/uploads/2017/12/user.png?fit=256%2C256&quality=100&ssl=1" /></td>
              </tr>              
              <tr>
                <td><asp:TextBox ID="txtuser" placeholder="Ingrese usuario" runat="server" class="form-control" ></asp:TextBox>
                    </td>
            </tr>
            <tr> 
                <td><asp:TextBox ID="txtpass" type="password" placeholder="Ingrese su contraseña"  runat="server" class="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Button ID="Button1" class="btn btn-info" runat="server" style="text-align: center" Text="Iniciar sesion" Width="114px" OnClick="Button1_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Button ID="Button2" class="btn btn-info" runat="server"  Text="Registrarse" Width="115px" OnClick="Button2_Click" />
                </td>
            </tr>
            
        </table>
    </div>
    </form>
    </div>
            
        </div>
</body>
</html>