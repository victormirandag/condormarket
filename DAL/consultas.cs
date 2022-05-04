using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using MySql.Data;
using MySql.Data.MySqlClient;
using System.Data;

namespace DAL
{
    public class consultas
    {
        Conexion conexion;
        //iniciar conexion con bd
        public consultas()
        {
            conexion = new Conexion();
        }

           //--------------------------------------------------REGISTRO------------------------------------------------------------------
        public void Registrar_usuario(string rut,string nombre, string apellido,string usuario,string contraseña, string correo, string sexo, string identificador, string telefono, string url ) {
            try
            {
                MySqlCommand cmdcomando = new MySqlCommand();
                cmdcomando.CommandText = "INSERT INTO usuarios (rut, nombre, apellido, telefono, contraseña, usuario, correo, sexo, url_img, identificador) VALUES('" + rut + "','" + nombre + "','" + apellido + "','" + telefono + "','" + contraseña + "','" + usuario + "', '" + correo + "','" + sexo + "','" + url + "','" + identificador + "')";
                conexion.ejecutar_comandosql(cmdcomando);
                
            }
            catch (Exception e)
            {
                System.Windows.Forms.MessageBox.Show("Error registro de usuario(consultas)......   "+e.Message);
            }
            
        }
        public void Registrar_negocio(string NombreNegocio,string RutNegocio,string tipo1, string tipo2, string tipo3,string direccion, string Latitud, string Longitud,string Horario,string Reseña,string Estado,string Url_Img ){
         try
            {
                MySqlCommand cmdcomando = new MySqlCommand();
                string consulta = "INSERT INTO negocio (rut_negocio, nombre, direccion, estado, horario, resena, url_img, tipo1, tipo2, tipo3, latitud, longitud) VALUES('" + RutNegocio + "','" + NombreNegocio + "',@direccion,'" + Estado + "','" + Horario + "','" + Reseña + "','" + Url_Img + "','" + tipo1 + "','" + tipo2 + "','" + tipo3 + "','" + Latitud + "','" + Longitud + "')";
                cmdcomando.CommandText = consulta;
                cmdcomando.Parameters.AddWithValue("@direccion", direccion);
                conexion.ejecutar_comandosql(cmdcomando);
                
            }
            catch (Exception e)
            {
                System.Windows.Forms.MessageBox.Show("Error registro de negocio(consultas)......   "+e.Message);
            }
            
        }

        public void dueño_negocio(string rut_user, string rut_local)
        {
            try
            {
                MySqlCommand cmdcomando = new MySqlCommand();
                cmdcomando.CommandText = "INSERT INTO dueño_negocio (rut_dueño,rut_negocio) VALUES('" + rut_user + "','" + rut_local + "')";
                conexion.ejecutar_comandosql(cmdcomando);
            }
            catch (Exception e)
            {
                System.Windows.Forms.MessageBox.Show("Error registro de negocio(dueño_negocio)......   " + e.Message);
            }

        }
        public void Servicio_Negocio(string Rut_Negocio, string Cod_Servicio){
                 try
            {
                MySqlCommand cmdcomando = new MySqlCommand();
                cmdcomando.CommandText = "INSERT INTO negocio_servicio (rut_negocio,codigo_servicio) VALUES('" + Rut_Negocio + "','" + Cod_Servicio + "')";
                conexion.ejecutar_comandosql(cmdcomando);
                
            }
            catch (Exception e)
            {
                System.Windows.Forms.MessageBox.Show("Error registro de servicio(consultas)......  "+e.Message);
            }
        }


        //--------------------------------------------------------LOGIN----------------------------------------------------------------------
        public bool Valida_sesion(string user, string pass)
        {

            MySqlCommand cmdcomando = new MySqlCommand();
            cmdcomando.CommandText = "SELECT * FROM usuarios where usuario='"+user+"' and contraseña='"+pass+"'";
            cmdcomando.CommandType = CommandType.Text;

            DataTable resultado = conexion.ejecutar_sentenciasql(cmdcomando);

            if (resultado.Rows.Count==0){
                return false;
            }else{
                return true;
            }
        
        }
        public DataTable info_usuario(string user,string pass) {
            MySqlCommand cmdcomando = new MySqlCommand();
            cmdcomando.CommandText = "SELECT * from usuarios where usuario='"+user+"' and contraseña='"+pass+"'";
            cmdcomando.CommandType = CommandType.Text;

            DataTable resultado = conexion.ejecutar_sentenciasql(cmdcomando);
            return resultado; 

        }

        //--------------------------------------------------CREACION ARCHIVO XML UBICACIONES---------------------------------------------
        public DataTable BD_negocios()
        {

            MySqlCommand cmdcomando = new MySqlCommand();
            cmdcomando.CommandText = "SELECT * from negocio where estado='1'";
            cmdcomando.CommandType = CommandType.Text;

            DataTable resultado = conexion.ejecutar_sentenciasql(cmdcomando);

            return resultado;
        }

        //------------------------------------------------ADMINISTRADORES-------------------------------------------------------------------------

       public DataTable CONSULTA(string filtro,string condicion)
        {

            MySqlCommand cmdcomando = new MySqlCommand();

            if (filtro == "0" || condicion == "")
            {
                cmdcomando.CommandText = "SELECT n.id, n.estado, n.nombre, n.rut_negocio, u.nombre, u.rut, u.correo, n.direccion  from negocio n, usuarios u, dueño_negocio d where (d.rut_dueño=u.rut) and (d.rut_negocio=N.rut_negocio)";
            }
            else {

                cmdcomando.CommandText = "SELECT n.id, n.estado, n.nombre, n.rut_negocio, u.nombre, u.rut, u.correo, n.direccion  from negocio n, usuarios u, dueño_negocio d where (d.rut_dueño=u.rut) and (d.rut_negocio=N.rut_negocio) and " + filtro + " like '" + condicion + "'";
            }
            
            cmdcomando.CommandType = CommandType.Text;

            DataTable resultado = conexion.ejecutar_sentenciasql(cmdcomando);

            return resultado;
        }

       public void habilita_deshabilita(string id,string estado)
       {
           try
           {
               MySqlCommand cmdcomando = new MySqlCommand();
               cmdcomando.CommandText = "update negocio set estado = '"+estado+"' where id='"+id+"'";
               conexion.ejecutar_comandosql(cmdcomando);

           }
           catch (Exception e)
           {
               System.Windows.Forms.MessageBox.Show("Error registro de servicio(consultas)......  " + e.Message);
           }
       }

       //------------------------------------------------------------------CUENTA DE NEGOCIO-------------------------------------------------------------
       public DataTable info_dueño_mi_cuenta(string id) {

           MySqlCommand cmdcomando = new MySqlCommand();
           cmdcomando.CommandText = "SELECT * from usuarios where id='"+id+"'";
           cmdcomando.CommandType = CommandType.Text;

           DataTable resultado = conexion.ejecutar_sentenciasql(cmdcomando);

           return resultado;
       }

       public DataTable info_negocio_dueño(string id)
       {

           MySqlCommand cmdcomando = new MySqlCommand();
           cmdcomando.CommandText = "SELECT n.rut_negocio, n.nombre, n.direccion, n.estado, n.horario, n.resena,n.url_img,n.tipo1,n.tipo2,n.tipo3 from negocio n, usuarios u, dueño_negocio d where (d.rut_dueño=u.rut) and (d.rut_negocio=n.rut_negocio) and u.id='" + id + "'";
           cmdcomando.CommandType = CommandType.Text;

           DataTable resultado = conexion.ejecutar_sentenciasql(cmdcomando);

           return resultado;
       }

       public void update_user(string rut, string contraseña, string telefono, string url_img) {

           try
           {
               MySqlCommand cmdcomando = new MySqlCommand();

               string consulta = "update usuarios set contraseña =@1, telefono=@2, url_img=@3 where rut=@4";
               cmdcomando.CommandText = consulta;

               cmdcomando.Parameters.AddWithValue("@1", contraseña);
               cmdcomando.Parameters.AddWithValue("@2", telefono);
               cmdcomando.Parameters.AddWithValue("@3", url_img);
               cmdcomando.Parameters.AddWithValue("@4", rut);

               conexion.ejecutar_comandosql(cmdcomando);

           }
           catch (Exception e)
           {
               System.Windows.Forms.MessageBox.Show("Error registro de update(consultas)......  " + e.Message);
           }
       }

       public void update_negocio(string rut_negocio, string tipo1, string tipo2, string tipo3,string reseña, string url_img)
       {

           try
           {
               MySqlCommand cmdcomando = new MySqlCommand();

               string consulta = "update negocio set tipo1 =@1, tipo2=@2, tipo3=@3, resena=@4, url_img=@5 where rut_negocio=@6";
               cmdcomando.CommandText = consulta;

               cmdcomando.Parameters.AddWithValue("@1", tipo1);
               cmdcomando.Parameters.AddWithValue("@2", tipo2);
               cmdcomando.Parameters.AddWithValue("@3", tipo3);
               cmdcomando.Parameters.AddWithValue("@4", reseña);
               cmdcomando.Parameters.AddWithValue("@4", url_img);
               cmdcomando.Parameters.AddWithValue("@4", rut_negocio);

               conexion.ejecutar_comandosql(cmdcomando);

           }
           catch (Exception e)
           {
               System.Windows.Forms.MessageBox.Show("Error registro de update(consultas)......  " + e.Message);
           }
       }

        
        public DataTable Buscar() {

            MySqlCommand cmdcomando = new MySqlCommand();
            cmdcomando.CommandText = "SELECT * from";
            cmdcomando.CommandType = CommandType.Text;

            DataTable resultado = conexion.ejecutar_sentenciasql(cmdcomando);

            return resultado;
        }

        
            
        }
    }

