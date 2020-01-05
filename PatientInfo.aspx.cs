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
    public partial class PatientInfo : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BloodGroupComboFill();
            }
            gvPatient.DataBind();
        }

        // Adding a new patient's info
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            NewPatient();
        }

        // Updating an existing patient's info
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            UpdatePatient();
        }

        // Deleteing a patient's info
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            DeletePatient();
        }

        // Searching a patient's info
        protected void btnGo_Click(object sender, EventArgs e)
        {
            GetPatientByID();
        }


        // User Defined Methods START

        void NewPatient()
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                if (txtPatientName.Text == "" || txtPatientAge.Text == "" || txtPatientGenders.SelectedItem.Value == "" || txtPatientGenders.SelectedItem.Value == "Select" || txtPatientBT.SelectedItem.Value == "" || txtPatientBT.SelectedItem.Value == "Select" || txtPatientStatus.SelectedItem.Value == "" || txtPatientStatus.SelectedItem.Value == "Select" || txtPatientContact.Text == "" || txtGuardianName.Text == "" || txtGuardianContact.Text == "" || txtPatientEmail.Text == "")
                {
                    Response.Write("<script>alert('Fill in all the fields!');</script>");
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO Patient (patientName, patientAge, Gender, btID, [Marital Status], patientContact, guardianName, guardianContact, Email) VALUES (@pName, @pAge, @pGender, @pBT, @pStatus, @pContact, @gName, @gContact, @pEmail)", con);
                    cmd.Parameters.AddWithValue("@pName", txtPatientName.Text);
                    cmd.Parameters.AddWithValue("@pAge", txtPatientAge.Text);
                    cmd.Parameters.AddWithValue("@pGender", txtPatientGenders.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@pBT", txtPatientBT.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@pStatus", txtPatientStatus.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@pContact", txtPatientContact.Text);
                    cmd.Parameters.AddWithValue("@gName", txtGuardianName.Text);
                    cmd.Parameters.AddWithValue("@gContact", txtGuardianContact.Text);
                    cmd.Parameters.AddWithValue("@pEmail", txtPatientEmail.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Patient Added!');</script>");
                    gvPatient.DataBind();
                    Clear();
                }
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void UpdatePatient()
        {
            if (CheckPatientExists())
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                        SqlCommand cmd = new SqlCommand("UPDATE Patient SET patientName = @pName, patientAge = @pAge, Gender = @pGender, btID = @pBT, [Marital Status] = @pStatus, patientContact = @pContact, guardianName = @gname, guardianContact = @gContact, Email = @pEmail WHERE patientID = '" + txtPatientID.Text + "'", con);
                        cmd.Parameters.AddWithValue("@pName", txtPatientName.Text);
                        cmd.Parameters.AddWithValue("@pAge", txtPatientAge.Text);
                        cmd.Parameters.AddWithValue("@pGender", txtPatientGenders.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@pBT", txtPatientBT.SelectedValue);
                        cmd.Parameters.AddWithValue("@pStatus", txtPatientStatus.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@pContact", txtPatientContact.Text);
                        cmd.Parameters.AddWithValue("@gName", txtGuardianName.Text);
                        cmd.Parameters.AddWithValue("@gContact", txtGuardianContact.Text);
                        cmd.Parameters.AddWithValue("@pEmail", txtPatientEmail.Text);
                        cmd.ExecuteNonQuery();

                        con.Close();
                        Response.Write("<script>alert('Patient Updated!');</script>");
                        Clear();
                        gvPatient.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Patient ID!');</script>");
            }


        }

        void DeletePatient()
        {
            try
            {
                if (CheckPatientExists())
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("DELETE FROM Patient WHERE patientID = '" + txtPatientID.Text + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Patient Deleted!');</script>");
                    Clear();
                    gvPatient.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Patient ID!');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool CheckPatientExists()
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Patient WHERE patientID= '" + txtPatientID.Text.Trim() + "'", con);
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

        void GetPatientByID()
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Patient WHERE patientID= '" + txtPatientID.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtPatientName.Text = dr.GetValue(1).ToString();
                        txtPatientAge.Text = dr.GetValue(2).ToString();
                        txtPatientGenders.Text = dr.GetValue(3).ToString();
                        txtPatientBT.Text = dr.GetValue(4).ToString();
                        txtPatientStatus.Text = dr.GetValue(5).ToString();
                        txtPatientContact.Text = dr.GetValue(6).ToString();
                        txtGuardianName.Text = dr.GetValue(7).ToString();
                        txtGuardianContact.Text = dr.GetValue(8).ToString();
                        txtPatientEmail.Text = dr.GetValue(9).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Patient ID!');</script>");
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void BloodGroupComboFill()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM BloodType", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            txtPatientBT.DataSource = dt;
            txtPatientBT.DataValueField = "Blood Type";
            txtPatientBT.DataBind();
            con.Close();
        }

        void Clear()
        {
            txtPatientID.Text = txtPatientName.Text = txtPatientEmail.Text = txtPatientAge.Text = txtGuardianName.Text = txtGuardianContact.Text = txtPatientContact.Text = "";
            txtPatientGenders.SelectedIndex = txtPatientBT.SelectedIndex = txtPatientStatus.SelectedIndex = 0;
        }
        
        // User Defined Methods END
    }
}