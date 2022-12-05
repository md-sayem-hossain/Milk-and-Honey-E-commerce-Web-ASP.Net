<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="MilkANDhoney.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #PName {
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }

        .oneline {
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-12 col-lg-8 col-md-12 col-sm-12">
                <h4>YOU'VE COME A LONG WAY, BABY!</h4>
                <p>Fill the form below to complete your purchase!</p>
                <hr />
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputEmail4">Email</label>
                        <input runat="server" type="email" class="form-control" id="inputEmail" placeholder="Email" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputPassword4">Full Name</label>
                        <input runat="server" type="text" class="form-control" id="inputFNAME" placeholder="Full Name" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputAddress">Address</label>
                    <input runat="server" type="text" class="form-control" id="inputAddress" placeholder="Dammam st." required>
                </div>
            </div>
            <div class="col-4">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">
                            <b>YOUR ORDER</b>
                        </div>
                        <asp:Repeater ID="CheckoutProducts" runat="server">
                            <ItemTemplate>
                                <div class="row">
                                    <div class="col-9 oneline">
                                        <p runat="server" id="PName"><%#Eval("PName") %></p>
                                    </div>
                                    <div class="col-3">
                                        <p runat="server" id="PPrice"><%#Eval("TotalPrice") %></p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <hr style="border: 1px dashed groove" />
                        <div class="row">
                            <div class="col-8">
                                <b style="color: #f9a826">Total</b>
                            </div>
                            <div class="col-4">
                                <b runat="server" id="Total" style="color: #f9a826"></b>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="button" id="PURCHASE" runat="server" onserverclick="PURCHASE_ServerClick" class="btn btn-primary btn-lg btn-block mt-2"><i class="fa fa-cart-plus"></i>COMPLETE PURCHASE</button>
            </div>
        </div>
    </div>
</asp:Content>
