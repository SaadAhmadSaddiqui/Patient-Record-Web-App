<%@ Page Title="" Language="C#" MasterPageFile="~/PRSMaster.Master" AutoEventWireup="true" CodeBehind="PatientInfo.aspx.cs" Inherits="Patient_Record_Web_App.PatientInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <i class="fa fa-pencil"></i>
    <div class="container-fluid">
        <div class="row">
            <%-- Left Card (Patient Details) --%>
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <%-- Patient Details --%>
                        <div class="row">
                            <div class="col text-center">
                                    <h4>Patient Details</h4>
                            </div>
                        </div>
                        <%-- Patient Icon --%>
                        <div class="row">
                            <div class="col text-center">
                                    <i class="fas fa-user-injured fa-6x"></i>
                            </div>
                        </div>
                        <%-- Horizontal Rule --%>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <%-- ID and Name Row --%>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtPatientID" placeholder="Patient ID" runat="server"></asp:TextBox>
                                        <asp:Button ID="btnGo" CssClass="btn btn-secondary" runat="server" Text="Go" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPatientName" placeholder="Patient Name" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <%-- Age, Gender and Blood Type Row --%>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtPatientAge" placeholder="Age" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:DropDownList ID="txtPatientGenders" CssClass="form-control" placeholder="Gender" runat="server">
                                        <asp:ListItem Text="-Select-" Value="Select" />
                                        <asp:ListItem Text="M" Value="M" />
                                        <asp:ListItem Text="F" Value="F" />
                                        <asp:ListItem Text="O" Value="O" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:DropDownList ID="txtPatientBT" CssClass="form-control" placeholder="Blood Type" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <%-- Contact and Status Row --%>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtPatientContact" placeholder="Contact" TextMode="Number" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:DropDownList ID="txtPatientStatus" CssClass="form-control" placeholder="Marital Status" runat="server">
                                        <asp:ListItem Text="-Select-" Value="Select" />
                                        <asp:ListItem Text="Single" Value="Single"/>
                                        <asp:ListItem Text="Married" Value="Married"/>
                                        <asp:ListItem Text="Divorced" Value="Divorced"/>
                                        <asp:ListItem Text="Widowed" Value="Widowed"/>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtGuardianName" placeholder="Guardian Name" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtGuardianContact" placeholder="Guardian Contact" runat="server"></asp:TextBox>
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
            <%-- Right Card (Patient List) --%>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <%-- Title Patient List --%>
                        <div class="row">
                            <div class="col text-center">
                                    <h4>Patient List</h4>
                            </div>
                        </div>
                        <%-- Horizontal Rule --%>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <%-- Patient List GridView --%>
                        <div class="row">
                            <div class="col">
                                <asp:GridView CssClass="table table-striped table-bordered" ID="gvPatient" runat="server"></asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <i class="fa fa-pencil"></i>s

</asp:Content>
