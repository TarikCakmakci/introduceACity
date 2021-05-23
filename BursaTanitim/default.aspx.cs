using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BursaTanitim
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String baglantiString = ConfigurationManager.ConnectionStrings["baglantiString"].ConnectionString;
            String sorgu = "Select *, (select avg(puan) from puan where urun_id = u.id) urun_puan from urunler as u";
            SqlDataAdapter sda = new SqlDataAdapter(sorgu,baglantiString);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}