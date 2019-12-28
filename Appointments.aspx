<%@ Page Title="" Language="C#" MasterPageFile="~/PRSMaster.Master" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="Patient_Record_Web_App.Appointments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <i class="fa fa-pencil"></i>
    <div class="container-fluid">
        <div class="row">
            <%-- Left Card (Appointment Booking) --%>
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <%-- Title Booking Appointment --%>
                        <div class="row">
                            <div class="col text-center">
                                    <h4>Appointment Booking</h4>
                            </div>
                        </div>
                        <%-- Calendar Icon --%>
                        <div class="row">
                            <div class="col text-center">
                                <i class="fas fa-calendar-check fa-6x"></i>
                            </div>
                        </div>
                        <%-- Horizontal Rule --%>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <%-- Patient ID and Name Row --%>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtPatientID" placeholder="Patient ID" runat="server"></asp:TextBox>
                                        <asp:Button ID="btnPGo" CssClass="btn btn-secondary" runat="server" Text="Go" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPatientName" placeholder="Patient Name" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <%-- Visit ID, Date, and Time Row --%>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtVisitID" placeholder="Visit ID" runat="server"></asp:TextBox>
                                        <asp:Button ID="BtnVGo" CssClass="btn btn-secondary" runat="server" Text="Go" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtVisitDate" placeholder="Visit Date" TextMode="Date" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtVisitTime" placeholder="Time" runat="server" TextMode="Time"></asp:TextBox>
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
            <%-- Right Card (Appointments List) --%>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <%-- Title Appointments List --%>
                        <div class="row">
                            <div class="col text-center">
                                    <h4>Appointments List</h4>
                            </div>
                        </div>
                        <%-- Horizontal Rule --%>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <%-- Med List GridView --%>
                        <div class="row">
                            <div class="col">
                                <asp:GridView CssClass="table table-striped table-bordered" ID="gvVisits" runat="server"></asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <i class="fa fa-pencil"></i>s

</asp:Content>
