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
    public partial class AdminManagement : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            gvAdmins.DataBind();
        }

        protected void btnPGo_Click(object sender, EventArgs e)
        {
            GetAdminByID();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            NewAdmin();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            UpdateAdmin();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            DeleteAdmin();
        }

        // User Defined Methods START

        void NewAdmin()
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                if (txtAdminUsername.Text == "" || txtAdminPassword.Text == "")
                {
                    Response.Write("<script>alert('Fill in all the fields!');</script>");
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO AdminLogin (Username, Password) VALUES (@aUsername, @aPassword)", con);
                    cmd.Parameters.AddWithValue("@aUsername", txtAdminUsername.Text);
                    cmd.Parameters.AddWithValue("@aPassword", txtAdminPassword.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Admin Added!');</script>");
                    gvAdmins.DataBind();
                    Clear();
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void UpdateAdmin()
        {
            if (CheckAdminExists())
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                        SqlCommand cmd = new SqlCommand("UPDATE AdminLogin SET Username = @aUsername, Password = @aPassword WHERE adminID = '" + txtAdminID.Text + "'", con);
                        cmd.Parameters.AddWithValue("@aUsername", txtAdminUsername.Text);
                        cmd.Parameters.AddWithValue("@aPassword", txtAdminPassword.Text);
                        cmd.ExecuteNonQuery();

                        con.Close();
                        Response.Write("<script>alert('Admin Updated!');</script>");
                        Clear();
                        gvAdmins.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Admin ID!');</script>");
            }
        }

        void DeleteAdmin()
        {
            try
            {
                if (CheckAdminExists())
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("DELETE FROM AdminLogin WHERE adminID = '" + txtAdminID.Text + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Admin Deleted!');</script>");
                    Clear();
                    gvAdmins.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Admin ID!');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void GetAdminByID()
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM AdminLogin WHERE adminID= '" + txtAdminID.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtAdminUsername.Text = dr.GetValue(1).ToString();
                        txtAdminPassword.Text = dr.GetValue(2).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Admin ID!');</script>");
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool CheckAdminExists()
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM AdminLogin WHERE adminID= '" + txtAdminID.Text.Trim() + "'", con);
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
            txtAdminUsername.Text = txtAdminID.Text = txtAdminPassword.Text = "";
        }
    }
}