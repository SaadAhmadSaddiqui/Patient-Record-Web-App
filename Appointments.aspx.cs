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
    public partial class Appointments : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        
        protected void Page_Load(object sender, EventArgs e)
        {
            gvVisits.DataBind();
        }

        // PatientID Go Button
        protected void btnPGo_Click(object sender, EventArgs e)
        {
            GetPatientByID();
        }

        // Visit ID Go Button
        protected void BtnVGo_Click(object sender, EventArgs e)
        {
            GetAppointmentByID();
        }

        // Add Visit Button
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            NewAppointment();
            //CheckTime();
        }

        // Update Visit Button
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            UpdateAppointment();
        }

        // Delete Visit Button
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            DeleteAppointment();
        }

        // User Defined Methods START

        void NewAppointment()
        {
            try
            {

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                if (txtPatientName.Text == "" || txtVisitDate.Text == "" || txtVisitTime.Text == "")
                {
                    Response.Write("<script>alert('Fill in all the fields!');</script>");
                }
                else
                {
                    
                    SqlCommand cmd = new SqlCommand("INSERT INTO Visit (PatientName, PatientID, VisitDate, Time) VALUES (@pName, @pID, @vDate, @vTime)", con);
                    cmd.Parameters.AddWithValue("@pName", txtPatientName.Text);
                    cmd.Parameters.AddWithValue("@pID", txtPatientID.Text);
                    cmd.Parameters.AddWithValue("@vDate", txtVisitDate.Text);
                    cmd.Parameters.AddWithValue("@vTime", txtVisitTime.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Appointment Added!');</script>");
                    gvVisits.DataBind();
                    Clear();
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void CheckTime()
        {
            con.Open();
            SqlCommand ncmd = new SqlCommand("SELECT Time FROM Visit WHERE VisitDate = '" + txtVisitDate.Text + "' ", con);
            SqlDataAdapter da = new SqlDataAdapter(ncmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            SqlDataReader dr = ncmd.ExecuteReader();
            DateTime[] times = new DateTime[dt.Rows.Count];
            if (dr.HasRows)
            {
                for (int i = 0; dr.Read(); i++)
                {
                    times[i] = (DateTime)dr.GetValue(0);
                    Response.Write("<script>console.log('" + dr.GetValue(0).ToString() + "');</script>");
                }
            } else
            {
                Response.Write("<script>console.log('nothing');</script>");

            }
            dr.Close();
            con.Close();
            for (int i = 0; i < times.Length; i++)
            {
                //times[i].
            }
        }

        void UpdateAppointment()
        {
            if (CheckAppointmentExists())
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                        SqlCommand cmd = new SqlCommand("UPDATE Visit SET PatientName = @pName, PatientID = @pID, VisitDate = @vDate, Time = @vTime WHERE Id = '" + txtVisitID.Text + "'", con);
                        cmd.Parameters.AddWithValue("@pName", txtPatientName.Text);
                        cmd.Parameters.AddWithValue("@pID", txtPatientID.Text);
                        cmd.Parameters.AddWithValue("@vDate", txtVisitDate.Text);
                        cmd.Parameters.AddWithValue("@vTIme", txtVisitTime.Text);
                        cmd.ExecuteNonQuery();

                        con.Close();
                        Response.Write("<script>alert('Appointment Updated!');</script>");
                        Clear();
                        gvVisits.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Visit ID!');</script>");
            }
        }

        void DeleteAppointment()
        {
            try
            {
                if (CheckAppointmentExists())
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("DELETE FROM Visit WHERE Id = '" + txtVisitID.Text + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Appointment Deleted!');</script>");
                    Clear();
                    gvVisits.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Visit ID!');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void GetAppointmentByID()
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Visit WHERE Id= '" + txtVisitID.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtPatientName.Text = dr.GetValue(1).ToString();
                        txtPatientID.Text = dr.GetValue(2).ToString();
                        txtVisitDate.Text = dr.GetValue(3).ToString();
                        txtVisitTime.Text = dr.GetValue(4).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Visit ID!');</script>");
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
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

        bool CheckAppointmentExists()
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Visit WHERE Id= '" + txtVisitID.Text.Trim() + "'", con);
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
            txtVisitID.Text = txtPatientID.Text = txtPatientName.Text = txtVisitDate.Text = txtVisitTime.Text = "";
        }

    }
}