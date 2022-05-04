<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Condormarket_V_4._0._1.Home" %>

<!DOCTYPE html >
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
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
        td {
            padding: 5px;
        }
    </style>
  </head>

<html>
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
    <div id="map"></div>
      
    <script>      

        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: -34.5688, lng: -70.9989 },
                zoom: 11
            });
                        
            var markers = '<%=getNegocios() %>';
            var obj = JSON.parse(markers);

            for (var i = 0; i < obj.length; i++) {
                var id = obj[i].id;
                var name = obj[i].nombre;
                var direccion = obj[i].direccion;
                var horario = obj[i].horario;
                var tipo1 = obj[i].tipo1;
                var tipo2 = obj[i].tipo2;
                var tipo3 = obj[i].tipo3;
                var reseña = obj[i].resena;
                var url_img = obj[i].url_img;

                var point = new google.maps.LatLng(
                    parseFloat(obj[i].latitud),
                    parseFloat(obj[i].longitud));

                var tablaContenido = '<h4>' + name + '</h4>' +
                    '<table> ' +
                    '<tr>' +
                    '    <td><b>Direccion:</b> ' + direccion + '</td>' +
                    '    <td rowspan="4"><img src="' + url_img + '" height="100" width="100" style="float: right;"></td>' +
                    '</tr >' +
                    '<tr>' +
                    '    <td><b>Reseña:</b> ' + reseña + '</td>' +
                    '</tr>' +
                    '<tr>' +
                    '    <td><b>Horario:</b> ' + horario + '</td>' +
                    '</tr>' +
                    '<tr>' +
                    '    <td><b>Tipo:</b> ' + tipo1 + ',' + tipo2 + ',' + tipo3 + ' </td>' +
                    '</tr>' +
                    '</table>';

                var infowincontent = document.createElement('div');

                var strong = document.createElement('h4');
                strong.textContent = name;
                infowincontent.appendChild(strong);
                infowincontent.appendChild(document.createElement('br'));

                var img = document.createElement('img');
                img.src = url_img;
                img.height = "100";
                img.width = "100";
                img.style.cssFloat = "right"
                infowincontent.appendChild(img);

                var h3 = document.createElement('h6');
                h3.textContent = "Direccion: " + direccion;
                infowincontent.appendChild(h3);

                var h31 = document.createElement('h6');
                h31.textContent = "Reseña: " + reseña;
                infowincontent.appendChild(h31);

                var h32 = document.createElement('h6');
                h32.textContent = "Horario: " + horario;
                infowincontent.appendChild(h32);

                var tipo = document.createElement('h6');
                tipo.textContent = "Tipo: " + tipo1 + ", " + tipo2 + ", " + tipo3;
                infowincontent.appendChild(tipo);


                var marker = new google.maps.Marker({
                    map: map,
                    position: point,
                    title: name
                });

                const infoWindow = new google.maps.InfoWindow({
                    content: tablaContenido,
                });

                marker.addListener('click', function () {                    
                    infoWindow.open(map, marker);
                });
            }
        }

        function doNothing() { }
    </script>
      <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAL9hWU2w9EFYORwgFvHaA_yAB3Wkmix7M&callback=initMap"></script>

      <form id="form1" runat="server">
      </form>
      
  </body>
</html>
