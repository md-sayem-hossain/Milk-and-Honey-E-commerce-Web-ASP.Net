<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="MilkANDhoney.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container-fluid {
            margin: 5rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-5">
                <img src="Assets/undraw_hello_re_3evm.svg" class="img-fluid"
                    alt="Sample image">
            </div>
            <div class="col-7">
                <h3 class="mb-5">Registration</h3>
                <div class="row">
                    <div class="col-sm-1">
                        <label class="form-label">Name</label>
                    </div>
                    <div class="col-sm-4">
                        <input runat="server" type="text" class="form-control ml-4" id="Name">
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorName"
                            runat="server"
                            ControlToValidate="Name"
                            ErrorMessage="Name can not be empty"
                            ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row mt-3">
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
                        <label class="form-label">Gender</label>
                    </div>
                    <div class="col-sm-4" style="margin-left: 23px;">
                        <asp:RadioButtonList ID="RadioButtonGender" RepeatDirection="Horizontal" runat="server" CssClass="FormatRadioButtonList">
                            <asp:ListItem Value="0">Male</asp:ListItem>
                            <asp:ListItem Value="1">Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="RadioButtonGender"
                            ErrorMessage="You should choose gender"
                            ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-sm-1">
                        <label class="form-label">Password</label>
                    </div>
                    <div class="col-sm-4">
                        <input runat="server" type="password" class="form-control ml-4" id="password">
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator3"
                            runat="server"
                            ControlToValidate="password"
                            ErrorMessage="Password can not be empty"
                            ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-sm-1">
                        <label class="form-label">Confirm Password</label>
                    </div>
                    <div class="col-sm-4">
                        <input runat="server" type="password" class="form-control ml-4" id="Confirmpass">
                        <div class="col-md-5">
                            <br>
                            <asp:Button ID="btnRegistration" runat="server" Text="REGISTER" CssClass="btn btn-primary" OnClick="btnRegistration_Click" /><br />
                            <br />
                            <asp:HyperLink ID="login" runat="server" NavigateUrl="~/Login.aspx" ForeColor="#f9a826">Login</asp:HyperLink>
                            <asp:Label ID="lblMsg" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4"
                            runat="server"
                            ControlToValidate="Confirmpass"
                            ErrorMessage="Confirm Password can not be empty"
                            ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1"
                            runat="server"
                            ErrorMessage="Password and confirm password does not match"
                            ControlToValidate="Confirmpass"
                            ControlToCompare="password"
                            Display="Dynamic"
                            ForeColor="Red"></asp:CompareValidator>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
