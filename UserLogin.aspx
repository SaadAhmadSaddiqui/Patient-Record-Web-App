<%@ Page Title="" Language="C#" MasterPageFile="~/PRSMaster.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="Patient_Record_Web_App.UserLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <i class="fa fa-pencil"></i>
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col text-center">
                                    <img width="150" src="All necessary Images/imgs/generaluser.png" alt="General User" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-center">
                                    <h3>Member Login</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtUsername" placeholder="Username" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPassword" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="btnLogin" CssClass="btn btn-primary btn-block" runat="server" Text="Login" />
                                </div>
                                <div class="form-group">
                                    <a href="SignUp.aspx">
                                        <input id="btnSignUp" Class="btn btn-dark btn-block" type="button" value="Sign Up" />
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="HomePage.aspx">Back to Home Page</a>
            </div>
        </div>
    </div>
    <i class="fa fa-pencil"></i>
</asp:Content>
