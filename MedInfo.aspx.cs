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
    public partial class MedInfo : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            gvMeds.DataBind();
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            GetMedicineByID();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            NewMedicine();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            UpdateMedicine();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            DeleteMedicine();
        }

        // User Defined Methods START

        void NewMedicine()
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                if (txtMedName.Text == "" || txtMedFormula.Text == "" || txtMedPrice.Text == "")
                {
                    Response.Write("<script>alert('Fill in all the fields!');</script>");
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO Medicine (MedicineName, MedicineFormula, MedicinePrice) VALUES (@mName, @mFormula, @mPrice)", con);
                    cmd.Parameters.AddWithValue("@mName", txtMedName.Text);
                    cmd.Parameters.AddWithValue("@mFormula", txtMedFormula.Text);
                    cmd.Parameters.AddWithValue("@mPrice", txtMedPrice.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Medicine Added!');</script>");
                    gvMeds.DataBind();
                    Clear();
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void UpdateMedicine()
        {
            if (CheckMedicineExists())
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                        SqlCommand cmd = new SqlCommand("UPDATE Medicine SET MedicineName = @mName, MedicineFormula = @mFormula, MedicinePrice = @mPrice WHERE medID = '" + txtMedID.Text + "'", con);
                        cmd.Parameters.AddWithValue("@mName", txtMedName.Text);
                        cmd.Parameters.AddWithValue("@mFormula", txtMedFormula.Text);
                        cmd.Parameters.AddWithValue("@mPrice", txtMedPrice.Text);
                        cmd.ExecuteNonQuery();

                        con.Close();
                        Response.Write("<script>alert('Medicine Updated!');</script>");
                        Clear();
                        gvMeds.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Medicine ID!');</script>");
            }
        }

        void DeleteMedicine()
        {
            try
            {
                if (CheckMedicineExists())
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("DELETE FROM Medicine WHERE medID = '" + txtMedID.Text + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Medicine Deleted!');</script>");
                    Clear();
                    gvMeds.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Medicine ID!');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void GetMedicineByID()
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Medicine WHERE medID= '" + txtMedID.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtMedName.Text = dr.GetValue(1).ToString();
                        txtMedFormula.Text = dr.GetValue(2).ToString();
                        txtMedPrice.Text = dr.GetValue(3).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Medicine ID!');</script>");
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool CheckMedicineExists()
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Medicine WHERE medID= '" + txtMedID.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void Clear()
        {
            txtMedID.Text = txtMedName.Text = txtMedFormula.Text = txtMedPrice.Text = "";
        }
    }
}