<%@ Page Title="" Language="C#" MasterPageFile="~/PRSMaster.Master" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="Patient_Record_Web_App.Appointments" %>
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
                                        <asp:Button ID="btnPGo" CssClass="btn btn-secondary" runat="server" Text="Go" OnClick="btnPGo_Click" />
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
                                        <asp:Button ID="BtnVGo" CssClass="btn btn-secondary" runat="server" Text="Go" OnClick="BtnVGo_Click" />
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
                                <asp:GridView CssClass="table table-striped table-bordered" ID="gvVisits" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="VisitGVCS">
                                    <Columns>
                                        <asp:BoundField DataField="Id" HeaderText="Appointment ID" InsertVisible="False" ReadOnly="True" SortExpression="Id">
                                        <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Appointments">
                                            <ItemTemplate>
                                                <ItemTemplate>
                                                <div class="container-fluid">
                                                    <%-- Patient Name --%>
                                                    <div class="row">
                                                        <div class="col">
                                                            <asp:Label ID="fPName" runat="server" Text='<%# Eval("PatientName") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <%-- Visit Date and Time --%>
                                                    <div class="row">
                                                        <div class="col">

                                                            Patient ID:
                                                            <asp:Label ID="fPID" runat="server" Text='<%# Eval("PatientID") %>' Font-Bold="True"></asp:Label>
                                                            &nbsp;| Date:
                                                            <asp:Label ID="fVDate" runat="server" Text='<%# Eval("VisitDate", "{0:dd-MMM-yyyy}") %>' Font-Bold="True"></asp:Label>
                                                            &nbsp;| Time:
                                                            <asp:Label ID="fVTime" runat="server" Text='<%# Eval("Time") %>' Font-Bold="True"></asp:Label>

                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="VisitGVCS" runat="server" ConnectionString="<%$ ConnectionStrings:PatientGVCS %>" SelectCommand="SELECT * FROM [Visit]"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />

</asp:Content>
