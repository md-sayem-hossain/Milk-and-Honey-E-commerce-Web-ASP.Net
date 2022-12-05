<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="MilkANDhoney.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 4rem">
        <div class="row">
            <asp:Repeater ID="DetailsRepeater" runat="server">
                <ItemTemplate>
                    <div class="col-lg-4 col-md-12">
                        <div class="text-left">
                            <img src="<%#Eval("PImage") %>" width="100%" height="100%" />
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <strong>Name</strong>
                        <h5><%#Eval("PName") %></h5>
                        <hr />
                        <strong>Description</strong>
                        <p style="text-align: justify"><%#Eval("PDescription") %></p>
                        <hr />
                        <strong>Price</strong>
                        <h4 style="font-weight: bolder">$<%#Eval("PPrice") %></h4>
                        <hr />
                        <strong>Left in Stock</strong>
                        <p style="font-weight: bolder"><%#Eval("PQuantity") %></p>
                        <hr />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="offset-lg-4 col-md-3 col-6 col-lg-3 offset-md-0 offset-sm-0">
                <input runat="server" id="quantity" type="number" max="40" min="1" class="form-control text-center" value="1" />
            </div>
            <div class="col-lg-3 col-md-3 col-6">
                <asp:Button ID="addtocart" runat="server" Text="Add to cart" CssClass="btn btn-primary" OnClick="addtocart_Click" /><br />
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
