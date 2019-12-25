<%@ Page Title="" Language="C#" MasterPageFile="~/PRSMaster.Master" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="Patient_Record_Web_App.LoginForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:25%; text-align:center; margin-left:38%">
        <form id="LoginPage">
        <div class="form-group">
            
            <%--<label for="txtUsername">Email address</label>--%>
            <asp:Label for="txtUsername" ID="lblEmail" runat="server">Email Address</asp:Label>
            <%--<input type="email" class="form-control" runat="server" id="txtUsername" aria-describedby="emailHelp">--%>
            <asp:TextBox CssClass="form-control" ID="txtUsername" runat="server"></asp:TextBox>
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
        </div>
        <div class="form-group">
            <asp:Label for="txtPassword" ID="lblPassword" runat="server">Password</asp:Label>
            <%--<label for="txtPassword">Password</label>--%>
            <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server"></asp:TextBox>
            <%--<input type="password" class="form-control" id="txtPassword">--%>
        </div>
        <div class="form-group form-check">
            <asp:CheckBox ID="exampleCheck1" CssClass="form-check-input" runat="server" />
            <%--<input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
            <asp:Label for="exampleCheck1" ID="lblCheckMeOut" runat="server">Remember me</asp:Label>
            <%--<label class="form-check-label" for="exampleCheck1">Check me out</label>--%>
        </div>
        <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Login" OnClick="btnSubmit_Click" />
        <%--<button type="submit" class="btn btn-primary">Submit</button>--%>
      </form>
    </div>
</asp:Content>
