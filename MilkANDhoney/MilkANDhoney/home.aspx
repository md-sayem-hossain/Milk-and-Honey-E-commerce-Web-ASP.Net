<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="MilkANDhoney.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="Assets/carousel/HairCareDeskEn.png" alt="First slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="Assets/carousel/NewSkinDeskEn.png" alt="Second slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="Assets/carousel/SkinCareDeskEn.png" alt="Third slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="Assets/carousel/SunCareDeskEn.png" alt="Fourth slide">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <hr />




    <div class="container mt-5">
        <h4 style="color: #4a4a4a" class="mb-4">NATURAL AND ORGANIC SKIN CARE</h4>
        <div class="row">
            <asp:ListView runat="server" ID="ListView1" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="col-lg-4 col-md-6 col-sm-12 mb-5 d-flex justify-content-center">
                        <a href="Details.aspx?PID=<%#Eval("PID") %>" style="text-decoration:none; color:black">
                            <div class="card text-center">

                                <img src="<%#Eval("PImage") %>" width="100%" height="100%" />

                                <div class="card-body text-left">
                                    <p class="card-title" style="font-size: 12px"><%#Eval("PName") %></p>
                                    <strong style="font-size: 20px; font-size: 20px; color: #f9a826;"><%#Eval("PPrice", "{0:c}") %></strong>
                                </div>
                            </div>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>

    <asp:SqlDataSource
        ID="SqlDataSource1"
        runat="server"
        DataSourceMode="DataReader"
        ConnectionString="<%$ ConnectionStrings:db %>"
        SelectCommand="SELECT [PID], [PName], [PPrice], [PImage] FROM [Product]"></asp:SqlDataSource>
</asp:Content>
