<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MilkANDhoney.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mb-5">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-6">
                <img src="Assets/undraw_login_re_4vu2.svg" class="img-fluid"
                    alt="Sample image">
            </div>
            <div class="col-6">
                <h3 class="mb-5">Login</h3>
                <div class="row">
                    <div class="col-sm-1">
                        <label class="form-label">Email</label>
                    </div>
                    <div class="col-sm-4">
                        <input runat="server" type="text" class="form-control ml-4" id="email">
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ControlToValidate="email"
                            ErrorMessage="Email can not be empty"
                            ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-sm-1">
                        <label class="form-label">Password</label>
                    </div>
                    <div class="col-4">
                        <input runat="server" type="password" class="form-control ml-4" id="password">
                        <div class="col-md-2">
                            <br>
                            <asp:Button ID="btnLogin" runat="server" Text="LOG IN" CssClass="btn btn-primary" OnClick="btnLogin_Click" /><br />
                            <br />
                            <asp:HyperLink ID="Register" runat="server" NavigateUrl="~/Registration.aspx" ForeColor="#f9a826">Register</asp:HyperLink><br />
                            <asp:Label ID="lableMsg" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4"
                            runat="server"
                            ControlToValidate="password"
                            ErrorMessage="Password can not be empty"
                            ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
