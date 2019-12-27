﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PRSMaster.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Patient_Record_Web_App.SignUp1" %>
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
                            <div class="col">
                                <center>
                                    <img width="150px" src="All necessary Images/imgs/generaluser.png" alt="General User" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member Sign Up</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-center">                                
                                <span class="badge badge-pill badge-primary">Login credentials</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <i class="fa fa-pencil"></i>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtUsername" placeholder="Username" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPassword" placeholder="Password" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="btnSignUp" CssClass="btn btn-success btn-block" runat="server" Text="Sign Up" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="HomePage.aspx">Back to Home Page</a>
            </div>
        </div>
    </div>
    <i class="fa fa-pencil"></i>s

</asp:Content>
