<%@ Page Title="" Language="C#" MasterPageFile="~/PRSMaster.Master" AutoEventWireup="true" CodeBehind="CheckOutPage.aspx.cs" Inherits="Patient_Record_Web_App.CheckOutPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row mt-5">
            <div class="col text-center">
                    <h1>Thank you for shopping with us!</h1>

            </div>
        </div>
        <hr />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="row">
            <div class="col text-center">
                    <asp:Button ID="btnHome" OnClick="btnHome_Click" Text="Back to Home" CssClass="btn btn-primary mx-auto" runat="server" />
            </div>
        </div>
    </div>


</asp:Content>
