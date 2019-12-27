<%@ Page Title="" Language="C#" MasterPageFile="~/PRSMaster.Master" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="Patient_Record_Web_App.LoginForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <div>
        
        <i class="fa fa-pencil"></i>
        <form id="LoginPage">
        <div class="form-group w-50">
            

        </div>
        <div class="form-group w-50">
            <asp:TextBox CssClass="form-control" ID="txtPassword" placeholder="Password" runat="server"></asp:TextBox>
        </div>
        <div class="form-group form-check">
            <asp:CheckBox ID="exampleCheck1" CssClass="form-check-input" runat="server" />
            <asp:Label for="exampleCheck1" ID="lblCheckMeOut" runat="server">Remember me</asp:Label>
        </div>
        <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Login" OnClick="btnSubmit_Click" />
      </form>
            
    </div>
    </center>
</asp:Content>
