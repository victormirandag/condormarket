<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Condormarket_V_4._0._1.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: center;
            font-size: large;
        }
        .auto-style3 {
            width: 747px;
            font-size: x-large;
        }
        .auto-style4 {
            text-align: center;
            font-size: xx-large;
        }
        .auto-style5 {
            width: 150px;
            text-align: center;
            font-size: x-large;
        }
        .auto-style6 {
            text-align: center;
            font-size: large;
        }
        .auto-style7 {
            width: 254px;
            text-align: right;
            font-size: large;
        }
        .auto-style8 {
            width: 133px;
            text-align: center;
            font-size: large;
        }
        .auto-style9 {
            text-align: justify;
            font-size: large;
            text-decoration: underline;
            font-weight: 700;
        }
        .auto-style10 {
            width: 27px;
            text-align: center;
            font-size: large;
        }
        .auto-style11 {
            text-align: center;
        }
        .auto-style12 {
            width: 62px;
            text-align: center;
            font-size: large;
        }
        .auto-style13 {
            text-align: center;
            font-size: large;
            height: 23px;
        }
        .auto-style14 {
            height: 23px;
        }
    </style>
</head>
<body>
     <%   
           
            if (HttpContext.Current.Response.Cookies["session"] != null && Request.Cookies["session"].Value == "ok_admin" || Session["ing"] == "admin")
                {
                    Response.WriteFile("cabecera_admin.html");
                    Session["ing"] = "admin";

                }
                else
                {
                    Response.WriteFile("cabecera.html");
                }
            
            
        %>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style4" colspan="6">Centro de configuracion ChileMarket</td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="5">
                    &nbsp;</td>
                <td>
                   
                </td>
            </tr>
            <tr>
                <td class="auto-style9" colspan="5">Control de suscripcion de negocios</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="259px" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal" style="font-size: medium">
                        <asp:ListItem Value="1">Activos</asp:ListItem>
                        <asp:ListItem Value="0">Inactivos</asp:ListItem>
                        <asp:ListItem Selected="True" Value="3">Todo</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style7">
                    Buscar por:</td>
                <td class="auto-style8">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Value="0">Seleccionar</asp:ListItem>
                        <asp:ListItem Value="u.nombre">Nombre dueño</asp:ListItem>
                        <asp:ListItem Value="u.rut">Rut dueño</asp:ListItem>
                        <asp:ListItem Value="n.rut_negocio">Rut de negocio</asp:ListItem>
                        <asp:ListItem Value="n.nombre">Nombre de negocio</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtfiltro" runat="server" Height="16px" style="margin-bottom: 2px"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button4" runat="server" Text="Buscar" Width="129px" OnClick="Button4_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="5">
                    <asp:GridView ID="GridView1" runat="server" CssClass="auto-style6" Height="146px" Width="1096px">
                    </asp:GridView>
                </td>
                <td class="auto-style11">
                    ID Negocio:<br />
                    <asp:TextBox ID="TextBox2" runat="server" Width="91px"></asp:TextBox><br />
                    <asp:Button ID="Button1" runat="server" Text="Habilitar" Width="132px" OnClick="Button1_Click" />
                    <asp:Button ID="Button3" runat="server" Text="Deshabilitar" Width="129px" OnClick="Button3_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13" colspan="5"></td>
                <td class="auto-style14"></td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    <div>
    
    </div>
    </form>
</body>
</html>
