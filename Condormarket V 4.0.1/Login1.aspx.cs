using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Data;
namespace Condormarket_V_4._0._1
{
    public partial class Login1 : System.Web.UI.Page
    {
        consultas consulta = new consultas();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (consulta.Valida_sesion(txtuser.Text,txtpass.Text))
            {
                string identificador=null;
                string nombreCompleto = null;

                foreach (DataRow row in consulta.info_usuario(txtuser.Text, txtpass.Text).Rows){

                    identificador=row["identificador"].ToString();
                    nombreCompleto=row["nombre"].ToString()+" "+row["apellido"].ToString();
                    Session["user"]=row["id"].ToString();

                }


                if (identificador == "usuario")
                {

                    HttpCookie cookie = new HttpCookie("session", "ok_user");
                    cookie.Expires = DateTime.Now.AddYears(1);
                    Response.Cookies.Add(cookie);
                    Response.Redirect("tipo_reg.aspx");

                }
                else {

                    if (identificador == "dueño")
                    {
                        HttpCookie cookie = new HttpCookie("session", "ok_negocio");
                        cookie.Expires = DateTime.Now.AddYears(1);
                        Response.Cookies.Add(cookie);
                        Response.Redirect("tipo_reg.aspx");
                    }
                    else
                    {
                        HttpCookie cookie = new HttpCookie("session","ok_admin");
                        cookie.Expires = DateTime.Now.AddYears(1);
                        Response.Cookies.Add(cookie);
                        Response.Redirect("tipo_reg.aspx");
                    }
                }
               
            }
            else {
                HttpCookie cookie = new HttpCookie("session", "no_ok");
                cookie.Expires = DateTime.Now.AddYears(1);
                Response.Cookies.Add(cookie);

                

                System.Windows.Forms.MessageBox.Show("La contraseña o el usuario no son validas");
                txtpass.Text = "";
                txtuser.Text = "";

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("tipo_reg.aspx");
        }
    }
}