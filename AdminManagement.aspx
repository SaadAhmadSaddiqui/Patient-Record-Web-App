<%@ Page Title="" Language="C#" MasterPageFile="~/PRSMaster.Master" AutoEventWireup="true" CodeBehind="AdminManagement.aspx.cs" Inherits="Patient_Record_Web_App.AdminManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div class="container-fluid">
        <div class="row">
            <%-- Left Card (Admin Details) --%>
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <%-- Title Admin Details --%>
                        <div class="row">
                            <div class="col text-center">
                                    <h4>Admin Details</h4>
                            </div>
                        </div>
                        <%-- Admins Icon --%>
                        <div class="row">
                            <div class="col text-center">
                                <i class="fas fa-users-cog fa-6x"></i>
                            </div>
                        </div>
                        <%-- Horizontal Rule --%>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <%-- Admin ID Row --%>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtAdminID" placeholder="Admin ID" runat="server"></asp:TextBox>
                                        <asp:Button ID="btnPGo" CssClass="btn btn-secondary" runat="server" Text="Go" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%-- Login Credentials Pill --%>
                        <div class="row">
                            <div class="col text-center">                                
                                <span class="badge badge-pill badge-primary">Login credentials</span>
                            </div>
                        </div>
                        <%-- Break --%>
                        <div class="row">
                            <div class="col">
                                <br />
                            </div>
                        </div>
                        <%-- Admin Username And Password Row --%>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtAdminUsername" placeholder="Username" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtAdminPassword" placeholder="Password" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <%-- Buttons Row --%>
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Button ID="btnAdd" CssClass="btn btn-success btn-block" runat="server" Text="Add" />
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="btnUpdate" CssClass="btn btn-primary btn-block" runat="server" Text="Update" />
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="btnDelete" CssClass="btn btn-danger btn-block" runat="server" Text="Delete" />
                            </div>
                        </div>
                    </div>
                </div>
                <a href="HomePage.aspx">Back to Home Page</a>
            </div>
            <%-- Right Card (Admins List) --%>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <%-- Title Admins List --%>
                        <div class="row">
                            <div class="col text-center">
                                    <h4>Admins List</h4>
                            </div>
                        </div>
                        <%-- Horizontal Rule --%>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <%-- Admin List GridView --%>
                        <div class="row">
                            <div class="col">
                                <asp:GridView CssClass="table table-striped table-bordered" ID="gvAdmins" runat="server"></asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />

</asp:Content>
