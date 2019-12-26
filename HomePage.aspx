<%@ Page Title="" Language="C#" MasterPageFile="~/PRSMaster.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Patient_Record_Web_App.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h2>Our Features</h2>
                    <p><b>3 primary features</b></p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 text-center">
                    <h1 id="iconPills" ><i class="fas fa-pills"></i></h1>
                    <h4>Purchasing Medicine</h4>
                    <p class="text-justify">Users who sign up can now purchase medicines from the comfort of their homes and get them delivered to them without any additional charges</p>
                </div>
                <div class="col-md-4 text-center">
                    <h1 id="iconPatients" ><i class="fas fa-user-injured"></i></h1>
                    <h4>Patient Record</h4>
                    <p class="text-justify">The admin of the application now can really easily keep record of the patient using PRS and update patient information if need be.</p>
                </div>
                <div class="col-md-4 text-center">
                    <h1 id="iconAppoitments" ><i class="fas fa-calendar-check"></i></h1>
                    <h4>Booking Appointments</h4>
                    <p class="text-justify">The admin of the application can book appointments for the patients when they calling using PRS and have the record of all the past visits, as well.</p>
                </div>
            </div>
        </div>
    </section>
    
</asp:Content>
