<%@ Page Title="" Language="C#" MasterPageFile="~/AnaSayfa.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="BursaTanitim._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
        <ItemTemplate>
            <div class ="aana">   
                <table>
                    <tr>
                        <td>
                            <a href="urundetay.aspx?urunid=<%#Eval("Id") %>">  
                        <img src ='<%# "/yuklenen/"+ Eval("urun_resim") %>'width="200",height="200" />
                    </a>
                        </td>
                        <td>
                             <div style="float:left;margin-left:125px;">
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("urun_isim")%>'></asp:Label><br />
                    <p> <%# Eval("urun_aciklama")%> </p>
                    <p> <%# Eval("urun_tarih")%> </p>
                    <p> <%# Eval("urun_puan")%> </p
                    <br />
                    <a href="urundetay.aspx?urunid=<%#Eval("Id") %>"> Urun Detay Sayfasi </a>
                </div>
                        </td>
                    </tr>
                </table>               
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
