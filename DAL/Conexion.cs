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
    class Conexion
    {
        DataTable tabla;
        MySqlConnection stringconexion;
        MySqlCommand cmd;
        public Conexion() {
            stringconexion = new MySqlConnection("Server=Localhost;Database=almachile;Uid=root;pwd=aiep;");
            cmd = new MySqlCommand();
        }


        public bool ejecutar_comandosql(MySqlCommand stringsqlcomando)
        {
        //insert, update, delete
            bool respuesta = true;

            cmd = stringsqlcomando;
            cmd.Connection = stringconexion;
            stringconexion.Open();
            respuesta=(cmd.ExecuteNonQuery()<=0)?false:true;
            stringconexion.Close();
            return respuesta;
        }
        public DataTable ejecutar_sentenciasql(MySqlCommand stringsqlcomando)
        {
            //select
            cmd =stringsqlcomando;
            cmd.Connection = stringconexion;
            stringconexion.Open();
            tabla=new DataTable();
            tabla.Load(cmd.ExecuteReader());
            stringconexion.Close();
            return tabla;
        }
    }
}
