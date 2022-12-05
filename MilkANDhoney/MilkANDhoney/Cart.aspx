<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="MilkANDhoney.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Tableheader {
            background: -webkit-linear-gradient(#fac906, #f18811);
            border: 1px solid #fac906
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h4><i class="fa fa-cart-plus"></i> My Cart</h4>
        <hr />
        <div class="row">
            <div class="col-12">
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" OnRowDeleting="GridView1_RowDeleting" AutoGenerateColumns="False" EmptyDataText="Empty" ShowFooter="True" CssClass="table" CellPadding="4">
                        <Columns>
                            <asp:BoundField DataField="#" HeaderText="#">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PName" HeaderText="Name">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:ImageField DataImageUrlField="PImage" HeaderText="Image" ControlStyle-Height="71px">
                                <ControlStyle Height="71px"></ControlStyle>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:ImageField>
                            <asp:BoundField DataField="PPrice" HeaderText="Price">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PQuantity" HeaderText="Quantity">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TotalPrice" HeaderText="Total">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" ControlStyle-ForeColor="Red" />
                        </Columns>
                        <HeaderStyle CssClass="Tableheader" VerticalAlign="Middle" HorizontalAlign="Center" ForeColor="White" />
                        <FooterStyle CssClass="Tableheader" VerticalAlign="Middle" HorizontalAlign="Center" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </div>
                <br />
            </div>

        </div>

        <div class="row">
            <div class="col-12 text-right">
                <asp:LinkButton runat="server" CssClass="btn btn-primary" PostBackUrl="~/Checkout.aspx">Checkout</asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>
