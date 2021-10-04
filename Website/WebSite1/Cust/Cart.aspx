<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMasterPage.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cust_Cart" ValidateRequest ="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <div class ="container">
        <section class="content">
        <div class=" panel ">
            <div class="panel-heading ">
                <div class="panel-title ">
                    <h4>My Room</h4>
                </div>
            </div>
            <div class="panel-body">
                <div class="Shopping-cart-area pt-60 pb-60">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">

                                <div class="table-content table-responsive">


                                    <asp:GridView runat="server" ID="GVCart" CssClass=" table-responsive-sm table-bordered table product-list " BackColor="White" CellPadding="4" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center" AutoGenerateColumns="false" OnRowCommand="GVCart_RowCommand">
                                        <AlternatingRowStyle HorizontalAlign="Center" />
                                        <HeaderStyle Font-Bold="True" ForeColor="Black" />
                                        <RowStyle HorizontalAlign="Center" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Product Image">
                                                <ItemTemplate>
                                                    <p>
                                                        <img class="img-fluid" src=' <%# Eval("Pic") %>' runat="server" alt="ProductImage" style="width: 4em; height: 4em" />

                                                    </p>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Row Number">
                                                <ItemTemplate>
                                                    <p>
                                                        <%# Eval("RecID") %>
                                                    </p>
                                                </ItemTemplate>

                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Room Type">
                                                <ItemTemplate>
                                                    <p><%# Eval("Room Type") %></p>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Room Name">
                                                <ItemTemplate>
                                                    <p><%# Eval("Room Name") %></p>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Room Price">
                                                <ItemTemplate>
                                                    <p><%# (Eval("Price")) %></p>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Quantity">
                                                <ItemTemplate>
                                                    <p><%# Eval("Quantity")%></p>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Price Total">
                                                <ItemTemplate>
                                                    <p><%# (Eval("ProductTotalAmount")) %></p>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="BtnRemoveFromCart" CssClass=" btn btn-sm btn-outline-danger" CommandArgument='<%# Eval("RecID") %>' CommandName="Remove From Cart"><i class ="fa fa-trash "></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>

                                <div class="row" runat="server" id="idTotal">
                                    <div class="col-md-5 ml-auto  pull-right">
                                        <div class="cart-page-total">
                                            <h2>Cart totals</h2>
                                            <ul>
                                                <li>Subtotal <span>N<%=totalAmount %></span></li>
                                                <li>Total <span>N<%=totalAmount %></span></li>
                                            </ul>

                                        </div>
                                        <div class="cart-page-total">
                                            <ul>

                                                <li>
                                                    <asp:LinkButton ID="lnkPay" OnClick="NavigateToPayOut" CssClass="btn btn-sm btn-primary pull-right  " runat="server"><i class="fa fa-paypal "></i>&nbsp Buy Goods</asp:LinkButton>
                                                    <br />
                                                    <br />
                                                    <br />
                                                </li>
                                            </ul>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   </div>

</asp:Content>




