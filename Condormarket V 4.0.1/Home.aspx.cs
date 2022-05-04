using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;
using System.Xml;
using Newtonsoft.Json;
using MySql.Data.MySqlClient;
using Newtonsoft.Json.Linq;

namespace Condormarket_V_4._0._1
{
    public partial class Home : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }    
        

        public string getNegocios()
        {

            var consultas = new consultas();
            var markers = consultas.BD_negocios();

            var joSerialized = JsonConvert.SerializeObject(markers);
            return joSerialized;
            //return "[{'marker':'aaaa'},{'marker':'bbbbb'}]";
        }
    }
}