<%@ Page Title="" Language="C#" MasterPageFile="~/PRSMaster.Master" AutoEventWireup="true" CodeBehind="MedInfo.aspx.cs" Inherits="Patient_Record_Web_App.MedInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <i class="fa fa-pencil"></i>
    <div class="container">
        <div class="row">
            <%-- Left Card (Med Details) --%>
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <%-- Medicine Details --%>
                        <div class="row">
                            <div class="col text-center">
                                    <h4>Medicine Details</h4>
                            </div>
                        </div>
                        <%-- Medicine Icon --%>
                        <div class="row">
                            <div class="col text-center">
                                    <i class="fas fa-prescription-bottle-alt fa-6x"></i>
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
                                        <asp:TextBox CssClass="form-control" ID="txtMedID" placeholder="MedID" runat="server"></asp:TextBox>
                                        <asp:Button ID="btnGo" CssClass="btn btn-secondary" runat="server" Text="Go" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtMedName" placeholder="Medicine Name" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <%-- Formula and Price Row --%>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtMedFormula" placeholder="Formula" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtMedPrice" placeholder="Price" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <%-- Manu and Disti Row --%>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtMedManufacturer" placeholder="Manufacturer" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtMedDistributor" placeholder="Distributor" runat="server"></asp:TextBox>
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
            <%-- Right Card (Med List) --%>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <%-- Title Med List --%>
                        <div class="row">
                            <div class="col text-center">
                                    <h4>Medicine List</h4>
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
                                <asp:GridView CssClass="table table-striped table-bordered" ID="gvMeds" runat="server"></asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <i class="fa fa-pencil"></i>s

</asp:Content>
