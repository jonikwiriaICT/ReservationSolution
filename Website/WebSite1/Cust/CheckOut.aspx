<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckOut.aspx.cs" Inherits="Cust_CheckOut" ValidateRequest ="false"  %>

<!DOCTYPE html>

<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Ensures optimal rendering on mobile devices. -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Optimal Internet Explorer compatibility -->
</head>

<body>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Label ID="lblCheck" Visible="false" runat="server" Text=""></asp:Label>
        <asp:GridView runat="server" ID="GVCart" CssClass=" table-responsive-sm table-bordered table product-list " BackColor="White" CellPadding="4" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center" AutoGenerateColumns="false">
            <AlternatingRowStyle HorizontalAlign="Center" />
            <HeaderStyle Font-Bold="True" ForeColor="Black" />
            <RowStyle HorizontalAlign="Center" />
            <Columns>
                <asp:TemplateField HeaderText="Product Image">
                    <ItemTemplate>
                        <p>
                            <img class="img-fluid" src='<%# Eval("Pic") %>' runat="server" alt="ProductImage" style="width: 4em; height: 4em" />

                        </p>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Room ID">
                    <ItemTemplate>
                        <p>
                            <%# Eval("RoomID") %>
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
    </form>





</body>
</html>

