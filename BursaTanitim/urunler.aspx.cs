using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace BursaTanitim
{
    public partial class urunler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUrunEkle_Click(object sender, EventArgs e)
        {
            try
            {
                String baglantiString = ConfigurationManager.ConnectionStrings["baglantiString"].ConnectionString;
                SqlConnection baglanti = new SqlConnection(baglantiString);
                baglanti.Open();
                String sorgu = "insert into urunler(urun_isim,urun_aciklama,urun_resim,urun_tarih,kategori_id) values(@p1,@p2,@p3,@p4,@p5)";
                SqlCommand komut = new SqlCommand(sorgu, baglanti);
                komut.Parameters.AddWithValue("@p1", txtUrunIsim.Text);
                komut.Parameters.AddWithValue("@p2", txtUrunAciklama.Text.Trim());
                String dosyaIsmi = "";
                if (FileUpload1.HasFile)
                {
                    dosyaIsmi = FileUpload1.FileName.ToString();
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/yuklenen/") + dosyaIsmi);
                }
                else
                {
                    lblSonuc.Text = "Resim ve fotoğraf seçilmedi..";
                    dosyaIsmi = "bos";
                }
                
                komut.Parameters.AddWithValue("@p3", dosyaIsmi);
                komut.Parameters.AddWithValue("@p4", DateTime.Parse(txtTarih.Text));
                komut.Parameters.AddWithValue("@p5", Int16.Parse(DropDownList1.SelectedValue.ToString()));
                komut.ExecuteNonQuery();
                baglanti.Close();
                lblSonuc.Text = "Ürün başarıyla kayıt edildi..";
            }
            catch (Exception ex)
            {
                lblSonuc.Text = ex.Message;
            }


        }

    }
}