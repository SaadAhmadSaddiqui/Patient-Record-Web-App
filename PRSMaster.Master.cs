using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Patient_Record_Web_App
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Role"] == null)
                {
                    // Active Buttons
                    linkAdminLogin.Visible = true; // Admin login button
                    linkLogIn.Visible = true; // User login button
                    linkMarket.Visible = true; // Market button
                    linkSignUp.Visible = true; // Sign Up button

                    // Hidden Buttons
                    linkLogOut.Visible = false; // Logout button
                    lblHelloUser.Visible = false; // Hello User label
                    linkAdminManagement.Visible = false; // Admin management button
                    linkMedicines.Visible = false; // Medicines button
                    linkAppointmentManagement.Visible = false; // Appointments button
                    linkPatientManagement.Visible = false; // Patient Management button
                }
                else if (Session["Role"].Equals("User"))
                {
                    // Active Buttons
                    linkLogOut.Visible = true; // Logout button
                    lblHelloUser.Visible = true; // Hello User label
                    lblHelloUser.Text = "Hello, " + Session["Username"].ToString() + "!";

                    linkMarket.Visible = true; // Market button
                    linkAdminLogin.Visible = true; // Admin login button

                    // Hidden Buttons
                    linkSignUp.Visible = false; // Sign Up button
                    linkLogIn.Visible = false; // User login button
                    linkAdminManagement.Visible = false; // Admin management button
                    linkMedicines.Visible = false; // Medicines button
                    linkAppointmentManagement.Visible = false; // Appointments button
                    linkPatientManagement.Visible = false; // Patient Management button
                }
                else if (Session["Role"].Equals("Admin"))
                {
                    // Active Buttons
                    linkAdminManagement.Visible = true; // Admin management button
                    linkMedicines.Visible = true; // Medicines button
                    linkAppointmentManagement.Visible = true; // Appointments button
                    linkPatientManagement.Visible = true; // Patient Management button
                    linkLogOut.Visible = true; // Logout button
                    lblHelloUser.Visible = true; // Hello User label
                    lblHelloUser.Text = "Hello, Admin!";
                    linkMarket.Visible = true; // Market button


                    // Hidden Buttons
                    linkSignUp.Visible = false; // Sign Up button
                    linkLogIn.Visible = false; // User login button
                    linkAdminLogin.Visible = false; // Admin login button

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')");
            }
        }

        protected void linkAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void linkPatientManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("PatientInfo.aspx");
        }

        protected void linkAppointmentManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("Appointments.aspx");
        }

        protected void linkMedicines_Click(object sender, EventArgs e)
        {
            Response.Redirect("MedInfo.aspx");
        }

        protected void linkAdminManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminManagement.aspx");
        }

        protected void linkLogIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        protected void linkSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

        protected void linkLogOut_Click(object sender, EventArgs e)
        {
            Session["Role"] = null;
            Response.Redirect("HomePage.aspx");
        }

        protected void linkMarket_Click(object sender, EventArgs e)
        {
            Response.Redirect("Medicines.aspx");
        }
    }
}