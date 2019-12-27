<%@ Page Title="" Language="C#" MasterPageFile="~/PRSMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Patient_Record_Web_App.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-5" style="margin-left: 30%">

        <div class="form-box">
            <div class="form-top">
                <div class="form-top-left">
                    <h3>Sign up now</h3>
                    <p>Fill in the form below to get instant access:</p>
                </div>
                <div class="form-top-right">
                    <i class="fa fa-pencil"></i>
                </div>
            </div>


            <div class="form-bottom">



                <!-- sign up form start honay laga hai :)-->


                <div class="form-group">

                    <asp:TextBox ID="sName" runat="server" type="text" class="form-username form-control" placeholder="Name"></asp:TextBox>

                </div>

                <div class="form-group">

                    <asp:TextBox ID="sBirthDate" runat="server" type="text" class="form-username form-control" placeholder="Birth Date (dd-mm-yyyy)"></asp:TextBox>

                </div>

                <div class="form-group">

                    <asp:TextBox ID="sEmail" runat="server" type="text" class="form-username form-control" placeholder="Email : person@example.com"></asp:TextBox>

                </div>

                <div class="form-group">

                    <asp:TextBox ID="sPassword" runat="server" type="password" class="form-username form-control" placeholder="Enter New Password"></asp:TextBox>

                </div>


                <div class="form-group">

                    <asp:TextBox ID="scPassword" runat="server" type="password" class="form-username form-control" placeholder="Confirm Password"></asp:TextBox>

                </div>


                <div class="form-group">

                    <asp:TextBox ID="Phone" runat="server" type="text" class="form-username form-control" placeholder="Phone Number (11 Digits)"></asp:TextBox>

                </div>

                <div class="form-group">

                    <input type="radio" name="Gender" value="M" id="test" checked="checked" />
                    Male
                                
                    <input type="radio" name="Gender" value="F" />
                    Female

                           
                </div>


                <div class="form-group">

                    <asp:TextBox ID="Address" class="form-username form-control" placeholder="Address" TextMode="multiline" Columns="40" Rows="10" runat="server" />

                </div>

                <asp:Button Text="SignUp" runat="server" type="submit" class="btn btn-primary" OnClientClick="return validateS();"></asp:Button>


                <!-- sign up ends here -->

            </div>
        </div>
    </div>
</asp:Content>
