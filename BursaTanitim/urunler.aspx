<%@ Page Title="" Language="C#" MasterPageFile="~/AnaSayfa.Master" AutoEventWireup="true" CodeBehind="urunler.aspx.cs" Inherits="BursaTanitim.urunler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style2 {
        width: 113px;
        text-align: right;
    }
    .auto-style3 {
        width: 113px;
        height: 21px;
        text-align: center;
    }
    .auto-style4 {
        height: 21px;
    }
    .auto-style6 {
        width: 113px;
        height: 22px;
    }
    .auto-style7 {
        height: 22px;
    }
    .auto-style8 {
        width: 113px;
        text-align: center;
    }
    .auto-style9 {
        width: 1002px;
        height: 517px;
        padding: 5px;
    }
    .auto-style10 {
        width: 113px;
        height: 24px;
    }
    .auto-style11 {
        height: 24px;
    }
</style>
    <script>
        function tarihKontrol() {
            
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="uicerik">

        <table class="auto-style9">
            <tr>
                <td class="auto-style8">Ürün İsmi:</td>
                <td>
                    <asp:TextBox ID="txtUrunIsim" runat="server" MaxLength="49" Width="168px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Ürün Açıklama:</td>
                <td>
                    <asp:TextBox ID="txtUrunAciklama" runat="server" Height="100px" MaxLength="499" TextMode="MultiLine" Width="168px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Ürün Resmi:</td>
                <td class="auto-style4">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Ürün Tarih:</td>
                <td>
                    <asp:TextBox ID="txtTarih" runat="server"></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <td class="auto-style8">Kategori:</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="kategori_isim" DataValueField="Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [kategori]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="btnUrunEkle" runat="server" Height="55px" Text="Ürün Ekle" Width="234px" OnClick="btnUrunEkle_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style11">
                    <asp:Label ID="lblSonuc" runat="server" Text="Sonuç"></asp:Label>
                </td>
            </tr>
        </table>

    </div>
</asp:Content>
