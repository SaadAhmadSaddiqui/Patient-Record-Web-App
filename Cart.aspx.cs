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
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            medsTotalBill.Text = 0.ToString();
            CalculateTotal();
            gvCart.DataBind();
        }

        protected void linkRemoveFromCart_Click(object sender, EventArgs e)
        {
            int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
            int mID = Convert.ToInt32(gvCart.DataKeys[rowIndex].Values[0]);
            con.Open();

            SqlCommand cmd = new SqlCommand("DELETE FROM Cart WHERE CartMedsID = '" + mID + "'", con);
            cmd.ExecuteNonQuery();

            con.Close();
            CalculateTotal();
            gvCart.DataBind();
        }

        void CalculateTotal()
        {
            double totes = 0;
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT * FROM Cart", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    
                    totes = totes + double.Parse(dr.GetValue(3).ToString());
                }
            }
            con.Close();
            medsTotalBill.Text = totes.ToString() + " AED";
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("TRUNCATE TABLE Cart", con);
            cmd.ExecuteNonQuery();
            con.Close();
            CalculateTotal();
            Response.Redirect("CheckOutPage.aspx");
        }
    }
}