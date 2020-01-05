using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Patient_Record_Web_App
{
    public partial class Medicines : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        int mID;
        protected void Page_Load(object sender, EventArgs e)
        {
            // mID = Convert.ToInt32(Request.QueryString["id"].ToString());

        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (Session["Role"] == null)
            {
                Response.Redirect("UserLogin.aspx");
            }
            else if (Session["Role"].Equals("User"))
            {
                int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
                mID = Convert.ToInt32(gvMeds.DataKeys[rowIndex].Values[0]);

                con.Open();

                SqlCommand cmd = con.CreateCommand();

                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO Cart (MedsName, MedsFormula, MedsPrice) SELECT MedicineName, MedicineFormula, MedicinePrice FROM Medicine WHERE medID = '" + mID + "'";
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("Cart.aspx");

            }
        }
    }
}