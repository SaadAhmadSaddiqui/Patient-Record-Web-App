<%@ Page Title="" Language="C#" MasterPageFile="~/PRSMaster.Master" AutoEventWireup="true" CodeBehind="PatientInfo.aspx.cs" Inherits="Patient_Record_Web_App.PatientInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({/* "scrollX": true, */"scrollY": 490 });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
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
                                        <asp:Button ID="btnGo" CssClass="btn btn-secondary" runat="server" Text="Go" OnClick="btnGo_Click" />
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
                                    <asp:TextBox CssClass="form-control" ID="txtPatientContact" placeholder="Contact" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:DropDownList ID="txtPatientStatus" CssClass="form-control" placeholder="Marital Status" runat="server">
                                        <asp:ListItem Text="-Select-" Value="Select" />
                                        <asp:ListItem Text="Single" Value="Single" />
                                        <asp:ListItem Text="Married" Value="Married" />
                                        <asp:ListItem Text="Divorced" Value="Divorced" />
                                        <asp:ListItem Text="Widowed" Value="Widowed" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <%-- Guardian Name and Contact Row --%>
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
                        <%-- Email Row --%>
                        <div class="row">
                            <div class="col">
                                <asp:TextBox CssClass="form-control" ID="txtPatientEmail" placeholder="Email" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <%-- Buttons Row --%>
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Button ID="btnAdd" CssClass="btn btn-success btn-block" runat="server" Text="Add" OnClick="btnAdd_Click" />
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="btnUpdate" CssClass="btn btn-warning
                                    btn-block"
                                    runat="server" Text="Update" OnClick="btnUpdate_Click" />
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="btnDelete" CssClass="btn btn-danger btn-block" runat="server" Text="Delete" OnClick="btnDelete_Click" />
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
                                <asp:GridView CssClass="table table-striped table-bordered data-table dataTable" ID="gvPatient" runat="server" AutoGenerateColumns="False" DataKeyNames="patientID" DataSourceID="PatientGridViewDataSource">
                                    <Columns>
                                        <asp:BoundField DataField="patientID" HeaderText="Patient ID" InsertVisible="False" ReadOnly="True" SortExpression="patientID" >

                                        
                                        <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>

                                        
                                        <asp:TemplateField HeaderText="Patient">

                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <%-- Patient Name --%>
                                                    <div class="row">
                                                        <div class="col">
                                                            <asp:Label ID="fPatientName" runat="server" Text='<%# Eval("patientName") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <%-- Age, Gender, and Blood Group --%>
                                                    <div class="row">
                                                        <div class="col">

                                                            Age:
                                                            <asp:Label ID="fPatientAge" runat="server" Text='<%# Eval("patientAge") %>' Font-Bold="True"></asp:Label>
                                                            &nbsp;| Gender:
                                                            <asp:Label ID="fPatientGender" runat="server" Text='<%# Eval("Gender") %>' Font-Bold="True"></asp:Label>
                                                            &nbsp;| Blood Group:
                                                            <asp:Label ID="fBloodGroup" runat="server" Text='<%# Eval("btID") %>' Font-Bold="True"></asp:Label>

                                                            &nbsp;| Marital Status:
                                                            <asp:Label ID="fPatientStatus" runat="server" Text='<%# Eval("[Marital Status]") %>' Font-Bold="True"></asp:Label>

                                                        </div>
                                                    </div>
                                                    <%-- Contact and Email --%>
                                                    <div class="row">
                                                        <div class="col">

                                                            Contact:
                                                            <asp:Label ID="fPatientContact" runat="server" Text='<%# Eval("patientContact") %>' Font-Bold="True"></asp:Label>
                                                            &nbsp;| Email:
                                                            <asp:Label ID="fPatientEmail" runat="server" Text='<%# Eval("Email") %>' Font-Bold="True"></asp:Label>

                                                        </div>
                                                    </div>
                                                    <%-- Guardian Name and Contact --%>
                                                    <div class="row">
                                                        <div class="col">

                                                            Guardian:
                                                            <asp:Label ID="fGuardianName" runat="server" Text='<%# Eval("guardianName") %>' Font-Bold="True"></asp:Label>
                                                            &nbsp;| Guardian Contact:
                                                            <asp:Label ID="fGuardianContact" runat="server" Text='<%# Eval("guardianContact") %>' Font-Bold="True"></asp:Label>

                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="PatientGridViewDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PatientGVCS %>" SelectCommand="SELECT * FROM [Patient]"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />

</asp:Content>
