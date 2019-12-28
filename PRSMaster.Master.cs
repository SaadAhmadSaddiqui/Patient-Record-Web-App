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

        }
    }
}