using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL;
using System.IO;

namespace Condormarket_V_4._0._1
{
    public partial class modificar_negocio : System.Web.UI.Page
    {
        consultas con = new consultas();
        string img1 = "";
        string img2 = "";
        string idreal ="";
        string clave = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //datos del usuario
            string id = HttpContext.Current.Session["user"].ToString();
            this.idreal = id;

            foreach (DataRow fila in con.info_dueño_mi_cuenta(id).Rows){

                lblrut.Text = fila["rut"].ToString();
                lblnombre.Text = fila["nombre"].ToString();
                Apellido.Text = fila["apellido"].ToString();
                lblusuario.Text = fila["usuario"].ToString();
                lblcorreo.Text = fila["correo"].ToString();
                lblsexo.Text = fila["sexo"].ToString();
                txtcelu.Text = fila["telefono"].ToString();
                Image2.ImageUrl = fila["url_img"].ToString();
                img1 = fila["url_img"].ToString();
                

            }

            foreach (DataRow fila in con.info_negocio_dueño(id).Rows)
            {

                lblnom.Text = fila["nombre"].ToString();
                lblrutlocal.Text = fila["rut_negocio"].ToString();
                Droptipo1.Text = fila["tipo1"].ToString();
                Droptipo2.Text = fila["tipo2"].ToString();
                Droptipo3.Text = fila["tipo3"].ToString();
                lbldireccion.Text = fila["direccion"].ToString();
                txthorario.Text = fila["horario"].ToString();
                txtreseña.Text = fila["resena"].ToString();
                Image1.ImageUrl = fila["url_img"].ToString();
                img2=fila["url_img"].ToString();
            }
           

        }

        private bool ValidaExtencion(string extencion)
        {
            switch (extencion)
            {
                case ".jpg":
                    return true;
                case ".jpeg":
                    return true;
                case ".png":
                    return true;
                case ".gif":
                    return true;
                case ".bmp":
                    return true;
                default:
                    return false;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            
            string ExtencionStore = null;
            string ExtencionUser = null;
            string RutaStore = null;
            string RutaUser = null;
            string clave = "";
            if (txtclave.Text == "") {

                foreach (DataRow fila in con.info_dueño_mi_cuenta(idreal).Rows){

                clave = this.clave;
               
                    }

            }
            else { clave = txtclave.Text; }

            if (uploadfileuser.HasFile && uploadfilestore.HasFile)
            {
                RutaUser = uploadfileuser.FileName;
                RutaStore = uploadfilestore.FileName;
                ExtencionStore = Path.GetExtension(RutaStore);
                ExtencionUser = Path.GetExtension(RutaUser);
                if (ValidaExtencion(ExtencionStore) && ValidaExtencion(ExtencionUser))
                {
                    uploadfilestore.SaveAs(MapPath("~/imagenes/negocio" + RutaStore));
                    uploadfileuser.SaveAs(MapPath("~/imagenes/usuarios" + RutaUser));

                    con.update_negocio(lblrutlocal.Text, Droptipo1.Text, Droptipo2.Text, Droptipo3.Text, txtreseña.Text, "/imagenes/negocio/" + lblrutlocal.Text + RutaStore);
                    con.update_user(lblrut.Text, txtclave.Text, txtcelu.Text, "/imagenes/usuarios" + lblrut.Text + RutaUser);

                    foreach (ListItem item in CheckBoxList1.Items)
                    {
                        if (item.Selected)
                        {
                            con.Servicio_Negocio(lblrutlocal.Text, item.Value);
                        }
                    }


                    Response.Redirect("cerrar.aspx");
                   
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("El archivo no es de tipo imagen.");
                }
            }
            else
            {
                con.update_negocio(lblrutlocal.Text, Droptipo1.Text, Droptipo2.Text, Droptipo3.Text, txtreseña.Text,img1);
                con.update_user(lblrut.Text, txtclave.Text, txtcelu.Text,img2);

                foreach (ListItem item in CheckBoxList1.Items)
                {
                    if (item.Selected)
                    {
                        con.Servicio_Negocio(lblrutlocal.Text, item.Value);
                    }
                }


                Response.Redirect("cerrar.aspx");
            }
        }
    }
}