<%@ Page Title="" Language="C#" MasterPageFile="~/PRSMaster.Master" AutoEventWireup="true" CodeBehind="MedInfo.aspx.cs" Inherits="Patient_Record_Web_App.MedInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({/* "scrollX": true, */"scrollY": 300 });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div class="container-fluid">
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
                                        <asp:Button ID="btnGo" CssClass="btn btn-secondary" runat="server" Text="Go" OnClick="btnGo_Click" />
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
                        <%--<div class="row">
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
                        </div>--%>
                        <%-- Buttons Row --%>
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Button ID="btnAdd" CssClass="btn btn-success btn-block" runat="server" Text="Add" OnClick="btnAdd_Click" />
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="btnUpdate" CssClass="btn btn-warning btn-block" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="btnDelete" CssClass="btn btn-danger btn-block" runat="server" Text="Delete" OnClick="btnDelete_Click" />
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
                                <asp:GridView CssClass="table table-striped table-bordered" ID="gvMeds" runat="server" AutoGenerateColumns="False" DataKeyNames="medID" DataSourceID="MedicineGVCS">
                                    <Columns>
                                        <asp:BoundField DataField="medID" HeaderText="Medicine ID" InsertVisible="False" ReadOnly="True" SortExpression="medID" >
                                        <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Medicine">
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <%-- Medicine Name --%>
                                                    <div class="row">
                                                        <div class="col">
                                                            <asp:Label ID="fMedName" runat="server" Text='<%# Eval("MedicineName") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <%-- Formula and Price --%>
                                                    <div class="row">
                                                        <div class="col">

                                                            Formula:
                                                            <asp:Label ID="fMedFormula" runat="server" Text='<%# Eval("MedicineFormula") %>' Font-Bold="True"></asp:Label>
                                                            &nbsp;| Price:
                                                            <asp:Label ID="fMedPrice" runat="server" Text='<%# Eval("MedicinePrice") %>' Font-Bold="True"></asp:Label>

                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="MedicineGVCS" runat="server" ConnectionString="<%$ ConnectionStrings:PatientGVCS %>" SelectCommand="SELECT * FROM [Medicine]"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />

</asp:Content>
