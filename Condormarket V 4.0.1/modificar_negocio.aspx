<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modificar_negocio.aspx.cs" Inherits="Condormarket_V_4._0._1.modificar_negocio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 123px;
        }
        .auto-style2 {
        }
        .auto-style3 {
            width: 169px;
            height: 23px;
        }
        .auto-style5 {
        }
        .auto-style7 {
            width: 94px;
        }
        .auto-style8 {
            height: 23px;
            width: 94px;
        }
        .auto-style9 {
            width: 169px;
            height: 26px;
        }
        .auto-style10 {
            height: 26px;
        }
        .auto-style11 {
            width: 94px;
            height: 26px;
        }
*,*:before,*:after{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}*{color:#000!important;text-shadow:none!important;background:transparent!important;box-shadow:none!important}label{display:inline-block;margin-bottom:5px;font-weight:bold}
        #TextArea1 {
            height: 39px;
            width: 307px;
        }
        .auto-style12 {
            width: 100px;
        }
        .auto-style13 {
        }
        .auto-style14 {
            height: 26px;
            width: 100px;
        }
        .auto-style15 {
            width: 169px;
            height: 48px;
        }
        .auto-style17 {
            width: 94px;
            height: 48px;
        }
        .auto-style23 {
            width: 268435488px;
        }
        .auto-style24 {
            width: 160px;
            height: 23px;
        }
        .auto-style25 {
            width: 160px;
        }
        .auto-style26 {
            height: 25px;
            width: 160px;
        }
        .auto-style27 {
        }
        .auto-style28 {
            height: 48px;
            width: 152px;
        }
        .auto-style29 {
            width: 152px;
            height: 23px;
        }
        .auto-style30 {
            height: 26px;
            width: 152px;
        }
        .auto-style31 {
            font-size: x-large;
            text-align: center;
        }
        .auto-style32 {
            width: 169px;
            height: 25px;
        }
        .auto-style33 {
            height: 25px;
            width: 152px;
        }
        .auto-style34 {
            width: 94px;
            height: 25px;
        }
        .auto-style35 {
            height: 25px;
            width: 100px;
        }
        .auto-style36 {
            height: 25px;
            width: 426px;
        }
        .auto-style37 {
            width: 426px;
        }
    </style>
</head>
<body>
    <%   
           
            if (HttpContext.Current.Response.Cookies["session"] != null && Request.Cookies["session"].Value == "ok_negocio" || Session["ing"] == "negocio")
                {
                    Response.WriteFile("cabecera_negocio.html");
                    Session["ing"] = "negocio";

                }
                else
                {
                    Response.WriteFile("cabecera.html");
                }
            
            
        %>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style31" colspan="5">Modificar Cambios en el local</td>
                <td class="auto-style25">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style31" colspan="5">&nbsp;</td>
                <td class="auto-style25">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Nombre:</td>
                <td class="auto-style27">
                    <asp:Label ID="lblnombre" runat="server"></asp:Label>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style12">Nombre Local</td>
                <td class="auto-style37">
                    <asp:Label ID="lblnom" runat="server"></asp:Label>
                </td>
                <td class="auto-style25" rowspan="3">
                    <asp:Image ID="Image1" runat="server" Height="94px" Width="151px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Apellido:</td>
                <td class="auto-style27">
                    <asp:Label ID="Apellido" runat="server"></asp:Label>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style12">Rut Local:</td>
                <td class="auto-style37">
                    <asp:Label ID="lblrutlocal" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">Rut:</td>
                <td class="auto-style28">
                    <asp:Label ID="lblrut" runat="server"></asp:Label>
                </td>
                <td class="auto-style17"></td>
                <td class="auto-style12" rowspan="2">Tipo:</td>
                <td rowspan="2" class="auto-style37">
                        <asp:DropDownList ID="Droptipo1" runat="server" Style="margin-bottom: 2px" Height="27px" Width="206px">
                            <asp:ListItem>Seleccione</asp:ListItem>
                            <asp:ListItem>Abarrotes</asp:ListItem>
                            <asp:ListItem>Almacen</asp:ListItem>
                            <asp:ListItem>Artesania</asp:ListItem>
                            <asp:ListItem>Bazar</asp:ListItem>
                            <asp:ListItem>Botilleria</asp:ListItem>
                            <asp:ListItem>Carniceria</asp:ListItem>
                            <asp:ListItem>Cordoneria</asp:ListItem>
                            <asp:ListItem>Ferreteria</asp:ListItem>
                            <asp:ListItem>Libreria</asp:ListItem>
                            <asp:ListItem>Muebleria</asp:ListItem>
                            <asp:ListItem>Panaderia</asp:ListItem>
                            <asp:ListItem>Peluqueria</asp:ListItem>
                            <asp:ListItem>Queseria</asp:ListItem>
                            <asp:ListItem>Restaurant</asp:ListItem>
                            <asp:ListItem>Sandwicheria</asp:ListItem>
                            <asp:ListItem>Servicio tecnico</asp:ListItem>
                            <asp:ListItem>Telas</asp:ListItem>
                            <asp:ListItem>Tienda fotografica</asp:ListItem>
                            <asp:ListItem>Verduleria</asp:ListItem>
                            <asp:ListItem>Vidrieria</asp:ListItem>
                            <asp:ListItem>Zapateria</asp:ListItem>
                        </asp:DropDownList>
                    <br />
                        <asp:DropDownList ID="Droptipo2" runat="server" Style="margin-bottom: 2px" Height="27px" Width="206px">
                            <asp:ListItem>Seleccione</asp:ListItem>
                            <asp:ListItem>Abarrotes</asp:ListItem>
                            <asp:ListItem>Almacen</asp:ListItem>
                            <asp:ListItem>Artesania</asp:ListItem>
                            <asp:ListItem>Bazar</asp:ListItem>
                            <asp:ListItem>Botilleria</asp:ListItem>
                            <asp:ListItem>Carniceria</asp:ListItem>
                            <asp:ListItem>Cordoneria</asp:ListItem>
                            <asp:ListItem>Ferreteria</asp:ListItem>
                            <asp:ListItem>Libreria</asp:ListItem>
                            <asp:ListItem>Muebleria</asp:ListItem>
                            <asp:ListItem>Panaderia</asp:ListItem>
                            <asp:ListItem>Peluqueria</asp:ListItem>
                            <asp:ListItem>Queseria</asp:ListItem>
                            <asp:ListItem>Restaurant</asp:ListItem>
                            <asp:ListItem>Sandwicheria</asp:ListItem>
                            <asp:ListItem>Servicio tecnico</asp:ListItem>
                            <asp:ListItem>Telas</asp:ListItem>
                            <asp:ListItem>Tienda fotografica</asp:ListItem>
                            <asp:ListItem>Verduleria</asp:ListItem>
                            <asp:ListItem>Vidrieria</asp:ListItem>
                            <asp:ListItem>Zapateria</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="Droptipo3" runat="server" Style="margin-bottom: 2px" Height="27px" Width="206px">
                            <asp:ListItem>Seleccione</asp:ListItem>
                            <asp:ListItem>Abarrotes</asp:ListItem>
                            <asp:ListItem>Almacen</asp:ListItem>
                            <asp:ListItem>Artesania</asp:ListItem>
                            <asp:ListItem>Bazar</asp:ListItem>
                            <asp:ListItem>Botilleria</asp:ListItem>
                            <asp:ListItem>Carniceria</asp:ListItem>
                            <asp:ListItem>Cordoneria</asp:ListItem>
                            <asp:ListItem>Ferreteria</asp:ListItem>
                            <asp:ListItem>Libreria</asp:ListItem>
                            <asp:ListItem>Muebleria</asp:ListItem>
                            <asp:ListItem>Panaderia</asp:ListItem>
                            <asp:ListItem>Peluqueria</asp:ListItem>
                            <asp:ListItem>Queseria</asp:ListItem>
                            <asp:ListItem>Restaurant</asp:ListItem>
                            <asp:ListItem>Sandwicheria</asp:ListItem>
                            <asp:ListItem>Servicio tecnico</asp:ListItem>
                            <asp:ListItem>Telas</asp:ListItem>
                            <asp:ListItem>Tienda fotografica</asp:ListItem>
                            <asp:ListItem>Verduleria</asp:ListItem>
                            <asp:ListItem>Vidrieria</asp:ListItem>
                            <asp:ListItem>Zapateria</asp:ListItem>
                        </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td class="auto-style2">Sexo:</td>
                <td class="auto-style27">
                    <asp:Label ID="lblsexo" runat="server"></asp:Label>
                </td>
                <td class="auto-style7"></td>
                <td class="auto-style25"></td>
            </tr>
            <tr>
                <td class="auto-style3">Correo:</td>
                <td class="auto-style27">
                    <asp:Label ID="lblcorreo" runat="server"></asp:Label>
                </td>
                <td class="auto-style8"></td>
                <td class="auto-style13" rowspan="2">Direccion Local:</td>
                <td rowspan="2" class="auto-style37">
                    <asp:Label ID="lbldireccion" runat="server"></asp:Label>
                </td>
                <td class="auto-style25"></td>
            </tr>
            <tr>
                <td class="auto-style3">Usuario</td>
                <td class="auto-style29">
                    <asp:Label ID="lblusuario" runat="server"></asp:Label>
                </td>
                <td class="auto-style8"></td>
                <td class="auto-style24"></td>
            </tr>
            <tr>
                <td class="auto-style32">Clave:</td>
                <td class="auto-style33">
                    <asp:TextBox ID="txtclave" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style34"></td>
                <td class="auto-style35">Horario:</td>
                <td class="auto-style36">
                    <asp:TextBox ID="txthorario" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style26"></td>
            </tr>
            <tr>
                <td class="auto-style9">Confirmar clave:</td>
                <td class="auto-style30">
                    <asp:TextBox ID="txtclave2" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style11"></td>
                <td class="auto-style14">Servicios:</td>
                <td class="auto-style10" colspan="2">
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" Style="text-align: left" Width="343px" RepeatDirection="Horizontal">
                            <asp:ListItem Value="2">Caja vecina</asp:ListItem>
                            <asp:ListItem Value="3">Redcompra</asp:ListItem>
                            <asp:ListItem Value="1">Sencillito</asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
            </tr>
            <tr>
                <td class="auto-style2">Telefono</td>
                <td class="auto-style27">
                    <asp:TextBox ID="txtcelu" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style12" rowspan="2">Reseña</td>
                <td colspan="2" rowspan="2">
                        <asp:TextBox ID="txtreseña" runat="server" Height="51px" Width="339px"></asp:TextBox>
                    </td>
                <td class="auto-style23">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style5" colspan="2">&nbsp;</td>
                <td class="auto-style23">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Foto</td>
                <td class="auto-style27" colspan="2">
                    <asp:FileUpload ID="uploadfileuser" runat="server" Width="211px" />
                </td>
                <td class="auto-style12">Foto</td>
                <td colspan="3">
                    <asp:FileUpload ID="uploadfilestore" runat="server" Width="328px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style27">
                    <asp:Image ID="Image2" runat="server" Height="94px" Width="151px" />
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style12">
                    <asp:Button ID="Button1" runat="server" Text="Guardar Cambios" OnClick="Button1_Click" />
                </td>
                <td colspan="3">&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>

