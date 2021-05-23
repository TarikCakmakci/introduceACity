<%@ Page Title="" Language="C#" MasterPageFile="~/AnaSayfa.Master" AutoEventWireup="true" CodeBehind="urundetay.aspx.cs" Inherits="BursaTanitim.urundetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 100%;           
        }

        .auto-style3 {
            height: 21px;
        }

        .auto-style4 {
            width: 114px;
        }

        .auto-style5 {
            width: 100%;
            height: 45px;
        }

        .auto-style6 {
            width: 100%;
            height: 227px;
        }

        .like {
            -ms-align-content: center;
            -webkit-align-content: center;
            align-content: center;
        }
    </style>

    <script>
        function adSoyadKontrol() {
            console.log("ca");

            var ad = document.getElementById("<%=txtAd.ClientID %>");
            var soyad = document.getElementById("<%=txtSoyad.ClientID %>");

            console.log(ad);
            console.log(soyad);

            var girilmemesiGerekenler = ["<", ">", ",", ";", "--", "=", "<html>", "<body>", "src", "+", "!", "'", "^", "+", "%", "&"];

            for (var i = 0; i < girilmemesiGerekenler.length; i++) {
                if (ad.value == girilmemesiGerekenler[i]) {
                    alert("Hatalı ifade girdiniz");
                    return false;
                }
            }
            if (ad.value.length > 50) {
                window.alert("Maksimumu 50 karakter girebilirsiniz");
            }
            if (ad.value > 0 || ad.value < 0) {
                alert("Sayı girdiniz");
                return false;
            }

            for (var i = 0; i < girilmemesiGerekenler.length; i++) {
                if (soyad.value == girilmemesiGerekenler[i]) {
                    alert("Hatalı ifade girdiniz");
                    return false;
                }
            }
            if (soyad.value.length > 50) {
                window.alert("Maksimumu 50 karakter girebilirsiniz");
                return false;
            }
            if (soyad.value > 0 || soyad.value < 0) {
                alert("Sayı girdiniz");
                return false;
            }

            // burası doğru ad soyad
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style6">
        <tr>
            <td style="width: 15%;">
                <asp:Image CssClass="auto-style2" ID="Image1" runat="server" />
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblIsim" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblAciklama" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblTarih" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="lblPuan" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table style="-ms-align-content: end; -webkit-align-content: end; align-content: end;">
                    <tr>
                        <td>
                            <asp:ImageButton ID="btnBegen" runat="server" Text="Beğen" ImageUrl="~/resim/001-thumbs-up.png" OnClick="btnBegen_Click" />
                        </td>
                        <td>
                            <asp:ImageButton ID="btnBegenme" runat="server" Text="Beğenme" ImageUrl="~/resim/002-thumb-down.png" OnClick="btnBegenme_Click" />
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="2">YORUMLAR

                <asp:Repeater ID="repeaterYorumlar" runat="server">
                    <ItemTemplate>
                        <div>
                            <asp:Label ID="lblYorumIcerik" runat="server" Text='<%#Eval("yorum_icerik")%>'></asp:Label><br />
                            <asp:Label ID="lblYorumTarih" runat="server" Text='<%#Eval("yorum_tarih")%>'></asp:Label><br />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="2">

                <table class="auto-style5">
                    <tr>
                        <td class="auto-style4">Adınız:</td>
                        <td>
                            <asp:TextBox ID="txtAd" runat="server" Width="193px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Soyadınız:</td>
                        <td>
                            <asp:TextBox ID="txtSoyad" runat="server" Width="195px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Kullanıcı adınız:</td>
                        <td>
                            <asp:TextBox ID="txtKullaniciAdi" runat="server" Width="195px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Yorum:</td>
                        <td>
                            <asp:TextBox ID="txtYorum" runat="server" Width="193px" Height="50px"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                                <td>
                                    <asp:ImageButton ID="puan1" runat="server" ImageUrl="~/resim/004-1-star.png" OnClick="puan1_Click" />
                                    <asp:ImageButton ID="puan2" runat="server" ImageUrl="~/resim/003-star-with-number-two.png" OnClick="puan2_Click" />
                                    <asp:ImageButton ID="puan3" runat="server"  ImageUrl="~/resim/002-star-number-3.png" OnClick="puan3_Click"/>
                                    <asp:ImageButton ID="puan4" runat="server" ImageUrl="~/resim/001-star-with-number-4.png" OnClick="puan4_Click" />
                                    <asp:ImageButton ID="puan5" runat="server" ImageUrl="~/resim/005-five.png" OnClick="puan5_Click" />
                                </td>

                             </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnSiparis" runat="server" Text="Sipariş Ver" OnClientClick="if (adSoyadKontrol() == false) return false;" Width="195px" OnClick="btnSiparis_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnYorum" runat="server" Text="Yorum Yaz" OnClientClick="if (adSoyadKontrol() == false) return false;" Width="195px" OnClick="btnYorum_Click" />
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="auto-style4">&nbsp;</td>
                        <td>
                            <asp:Label ID="lblSiparis" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                </table>

            </td>




        </tr>
    </table>


</asp:Content>
