<%@ Page Title="" Language="C#" MasterPageFile="~/PRSMaster.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Patient_Record_Web_App.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-3">
        <div class="row">
            <div class="col text-center">
                <h4>Your Cart</h4>
            </div>
        </div>
        <hr />
        <div class="card">
            <%-- Card header --%>
            <div class="card-header bg-dark text-light">
                <i class="fa fa-shopping-cart"></i>Shopping Cart
                <a href="Medicines.aspx" class="btn btn-outline-info btn-sm fa-pull-right">Continue Shopping</a>
                <div class="clearfix"></div>
            </div>
            <%-- Card Body --%>
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <asp:GridView ID="gvCart" CssClass="table table-striped table-bordered dataTable" runat="server" AutoGenerateColumns="False" DataKeyNames="CartMedsID" DataSourceID="CartGVCS">
                            <Columns>
                                <asp:TemplateField HeaderText="Medicine">

                                    <ItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-10">
                                                    <div class="row">
                                                        <div class="col">
                                                            <asp:Label ID="fMedsName" runat="server" Text='<%# Eval("MedsName") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            Formula:
                                                            <asp:Label ID="fMedsFormula" runat="server" Text='<%# Eval("MedsFormula") %>' Font-Bold="True"></asp:Label>
                                                            &nbsp;| Price:
                                                            <asp:Label ID="fMedsPrice" runat="server" Text='<%# Eval("MedsPrice") + " AED" %>' Font-Bold="True"></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <asp:LinkButton ID="linkRemoveFromCart" OnClick="linkRemoveFromCart_Click" runat="server"><i class="btn btn-outline-danger fa fa-trash" style="margin-top: 14px"></i></asp:LinkButton>
                                                </div>
                                            </div>

                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="CartGVCS" runat="server" ConnectionString="<%$ ConnectionStrings:PatientGVCS %>" SelectCommand="SELECT * FROM [Cart]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
            <div class="card-footer">

                Total price: <asp:Label ID="medsTotalBill" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                <asp:Button ID="btnCheckout" OnClick="btnCheckout_Click" CssClass="btn btn-success fa-pull-right" Text="Checkout" runat="server" />
            </div>
        </div>
        <%--<div class="col-md-8">
            <div class="media">
                <div class="media-body">
                    <h5 class="media-heading">
                        Name of the Item in the cart.
                    </h5>
                    Price of the item.
                </div>
            </div>
        </div>
        <div class="col-md-4">

        </div>--%>
    </div>
</asp:Content>
