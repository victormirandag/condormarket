using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;
using System.Xml;
using System.Text.RegularExpressions;

namespace Condormarket_V_4._0._1
{
    public partial class admin : System.Web.UI.Page
    {
        consultas con = new consultas();
        DataTable tabla = new DataTable();
        DataTable grid = new DataTable();
        string direccion = "";
        protected void Page_Load(object sender, EventArgs e)
        {
           

            
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
             
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            
            tabla = con.CONSULTA(DropDownList1.SelectedValue, "%"+txtfiltro.Text+"%");

            grid.Columns.Add("ID");
            grid.Columns.Add("Estado");
            grid.Columns.Add("Nombre Negocio");
            grid.Columns.Add("Rut Negocio");
            grid.Columns.Add("Nombre Dueño");
            grid.Columns.Add("Rut Dueño");
            grid.Columns.Add("Correo Dueño");
            grid.Columns.Add("Direccion Negocio");
            


            foreach (DataRow fila in tabla.Rows) {

                if (RadioButtonList1.SelectedValue != "3")
                {

                    if (fila["estado"].ToString() == RadioButtonList1.SelectedValue)
                    {
                        grid.Rows.Add(fila.ItemArray);
                    }
                }
                else {

                    grid.Rows.Add(fila.ItemArray);
                }
                
            }

            GridView1.DataSource = grid;
            GridView1.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (System.Windows.Forms.MessageBox.Show("Seguro que desea habilitar este negocio?", "Message", System.Windows.Forms.MessageBoxButtons.YesNo) == System.Windows.Forms.DialogResult.Yes)
            {
                con.habilita_deshabilita(TextBox2.Text, "1");
                

                XmlDocument doc = new XmlDocument();

                string marker = null;
                foreach (DataRow row in con.BD_negocios().Rows)
                {
                    direccion = row["direccion"].ToString().Replace("'", " ");

                  

                    System.Windows.Forms.MessageBox.Show(""+direccion);
                    marker = marker + ("<marker id='" + row["id"].ToString() + "' rut='" + row["rut_negocio"].ToString() + "' nombre='" + row["nombre"].ToString() + "' direccion='" + direccion + "' horario='" + row["horario"].ToString() + "' resena='" + row["resena"].ToString() + "' url_img='" + row["url_img"].ToString() + "' tipo1='" + row["tipo1"].ToString() + "' tipo2='" + row["tipo2"].ToString() + "' tipo3='" + row["tipo3"].ToString() + "' lat='" + row["latitud"].ToString() + "' lng='" + row["longitud"].ToString() + "' />");
                    
                }
                doc.LoadXml("<markers>" + marker + "</markers>");
                doc.Save("C:\\Users\\Joao\\Downloads\\condormarket\\condormarket\\Condormarket V 4.0.1\\Condormarket V 4.0.1\\xml\\ubicaciones.xml");
                Response.Redirect("admin.aspx");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (System.Windows.Forms.MessageBox.Show("Seguro que desea deshabilitar este negocio?", "Message", System.Windows.Forms.MessageBoxButtons.YesNo) == System.Windows.Forms.DialogResult.Yes)
            {
                con.habilita_deshabilita(TextBox2.Text, "0");
                
                XmlDocument doc = new XmlDocument();

                string marker = null;
                foreach (DataRow row in con.BD_negocios().Rows)
                {
                    marker = marker + ("<marker id='" + row["id"].ToString() + "' rut='" + row["rut_negocio"].ToString() + "' nombre='" + row["nombre"].ToString() + "' direccion='" + row["direccion"].ToString() + "' horario='" + row["horario"].ToString() + "' resena='" + row["resena"].ToString() + "' url_img='" + row["url_img"].ToString() + "' tipo1='" + row["tipo1"].ToString() + "' tipo2='" + row["tipo2"].ToString() + "' tipo3='" + row["tipo3"].ToString() + "' lat='" + row["latitud"].ToString() + "' lng='" + row["longitud"].ToString() + "' />");
                }
                doc.LoadXml("<markers>" + marker + "</markers>");
                doc.Save("C:\\Users\\Joao\\Downloads\\condormarket\\condormarket\\Condormarket V 4.0.1\\Condormarket V 4.0.1\\xml\\ubicaciones.xml");
                Response.Redirect("admin.aspx");
            }
        }

        

        

      

       

       
        

        


    }
}