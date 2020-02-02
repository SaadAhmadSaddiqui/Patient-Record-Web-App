<%@ Page Title="" Language="C#" MasterPageFile="~/PRSMaster.Master" AutoEventWireup="true" CodeBehind="Medicines.aspx.cs" Inherits="Patient_Record_Web_App.Medicines" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({/* "scrollX": true, */"scrollY": 300 });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <br />
    <div class="container-fluid">
        <div class="row">
            <%-- Right Card (Medicines View) --%>
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <%-- Title Medicines --%>
                        <div class="row">
                            <div class="col text-center">
                                    <h4>Medicines</h4>
                            </div>
                        </div>
                        <%-- Horizontal Rule --%>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <%-- Meds GridView --%>
                        <div class="row">
                            <div class="col">
                                <asp:GridView CssClass="table table-striped table-bordered" ID="gvMeds" runat="server" AutoGenerateColumns="False" DataKeyNames="medID" DataSourceID="MedicineGVCS">
                                    <Columns>
                                        
                                        <asp:BoundField DataField="medID" HeaderText="Medicine ID" SortExpression="medID">
                                        <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>
                                        
                                        <asp:TemplateField HeaderText="Medicine">
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-md-10">
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
                                                            <asp:Label ID="fMedPrice" runat="server" Text='<%# Eval("MedicinePrice") + " AED" %>' Font-Bold="True"></asp:Label>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2" style="margin-top: 11px">
                                                            <asp:LinkButton ID="btnAddToCart" OnClick="btnAddToCart_Click" CssClass="btn btn-outline-primary" runat="server"><i class="fas fa-cart-plus"></i> Add to cart</asp:LinkButton>
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
