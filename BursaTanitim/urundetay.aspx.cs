using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BursaTanitim
{
    public partial class urundetay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) //veritabanından veri okuma burda
        {
            String id = Request.QueryString["urunid"].ToString();
            String baglantiString = ConfigurationManager.ConnectionStrings["baglantiString"].ConnectionString;
            SqlConnection baglanti = new SqlConnection(baglantiString);
            baglanti.Open();
            String sorgu = "Select *, (select avg(puan) from puan where urun_id = @p1) puan from urunler where Id =@p1";
            SqlCommand komut = new SqlCommand(sorgu, baglanti);
            komut.Parameters.AddWithValue("@p1", id);

            SqlDataReader dr = komut.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    Image1.ImageUrl = "/yuklenen/" + dr["urun_resim"].ToString();
                    lblIsim.Text = dr["urun_isim"].ToString();
                    lblAciklama.Text = dr["urun_aciklama"].ToString();
                    lblTarih.Text = dr["urun_tarih"].ToString();
                    lblPuan.Text = dr["puan"].ToString();
                }
            }
            dr.Close();

            sorgu = "select * from yorumlar where urun_id = @urun";
            komut = new SqlCommand(sorgu, baglanti);
            komut.Parameters.AddWithValue("@urun", id);
            dr = komut.ExecuteReader();
            if (dr.HasRows)
            {
                repeaterYorumlar.DataSource = dr;
                repeaterYorumlar.DataBind();
            }
        }

        protected void btnSiparis_Click(object sender, EventArgs e)
        {
            lblSiparis.Text = "Siparişiniz başarıyla alınmıştır..";
        }

        protected void btnBegen_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void btnBegenme_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void btnYorum_Click(object sender, EventArgs e)
        {
            String id = Request.QueryString["urunid"].ToString();
            String baglantiString = ConfigurationManager.ConnectionStrings["baglantiString"].ConnectionString;
            SqlConnection baglanti = new SqlConnection(baglantiString);
            baglanti.Open();

            // kullanıcı bilgileri al
            String ad = txtAd.Text;
            String soyad = txtSoyad.Text;
            String kullaniciAdi = txtKullaniciAdi.Text;

            // kullanıcıyı ekle
            String sorgu = "insert into kullanici(kullanici_adi, adi, soyadi) values(@kullanici, @ad, @soyad);";
            SqlCommand command = new SqlCommand(sorgu, baglanti);
            command.Parameters.AddWithValue("@kullanici", kullaniciAdi);
            command.Parameters.AddWithValue("@ad", ad);
            command.Parameters.AddWithValue("@soyad", soyad);
            int sonuc = command.ExecuteNonQuery();

            // eklenen kullanıcının id bilgisi
            sorgu = "select Id from kullanici where kullanici_adi = @kullanici;";
            command = new SqlCommand(sorgu, baglanti);
            command.Parameters.AddWithValue("@kullanici", kullaniciAdi);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable table = new DataTable();
            adapter.Fill(table);
            int kullaniciId = Int32.Parse(table.Rows[0]["Id"].ToString());

            String yorum = txtYorum.Text;
            sorgu = "insert into yorumlar(yorum_icerik, yorum_tarih, urun_id, kullanici_id) values(@icerik, @tarih, @urun, @kullanici);";
            command = new SqlCommand(sorgu, baglanti);
            command.Parameters.AddWithValue("@icerik", yorum);
            command.Parameters.AddWithValue("@tarih", DateTime.Now);
            command.Parameters.AddWithValue("@urun", id);
            command.Parameters.AddWithValue("@kullanici", kullaniciId);
            sonuc = command.ExecuteNonQuery();

            Response.Redirect(Request.RawUrl);
        }

        protected void puan1_Click(object sender, ImageClickEventArgs e)
        {
            String id = Request.QueryString["urunid"].ToString();
            String baglantiString = ConfigurationManager.ConnectionStrings["baglantiString"].ConnectionString;
            SqlConnection baglanti = new SqlConnection(baglantiString);
            baglanti.Open();

            String sorgu = "insert into puan(urun_id, puan_tarih, puan) values(@urun, @tarih, @puan);";
            SqlCommand command = new SqlCommand(sorgu, baglanti);
            command.Parameters.AddWithValue("@urun", id);
            command.Parameters.AddWithValue("@tarih", DateTime.Now);
            command.Parameters.AddWithValue("@puan", 1);
            int sonuc = command.ExecuteNonQuery();

            Response.Redirect(Request.RawUrl);
        }

        protected void puan2_Click(object sender, ImageClickEventArgs e)
        {
            String id = Request.QueryString["urunid"].ToString();
            String baglantiString = ConfigurationManager.ConnectionStrings["baglantiString"].ConnectionString;
            SqlConnection baglanti = new SqlConnection(baglantiString);
            baglanti.Open();

            String sorgu = "insert into puan(urun_id, puan_tarih, puan) values(@urun, @tarih, @puan);";
            SqlCommand command = new SqlCommand(sorgu, baglanti);
            command.Parameters.AddWithValue("@urun", id);
            command.Parameters.AddWithValue("@tarih", DateTime.Now);
            command.Parameters.AddWithValue("@puan", 2);
            int sonuc = command.ExecuteNonQuery();

            Response.Redirect(Request.RawUrl);
        }

        protected void puan3_Click(object sender, ImageClickEventArgs e)
        {
            String id = Request.QueryString["urunid"].ToString();
            String baglantiString = ConfigurationManager.ConnectionStrings["baglantiString"].ConnectionString;
            SqlConnection baglanti = new SqlConnection(baglantiString);
            baglanti.Open();

            String sorgu = "insert into puan(urun_id, puan_tarih, puan) values(@urun, @tarih, @puan);";
            SqlCommand command = new SqlCommand(sorgu, baglanti);
            command.Parameters.AddWithValue("@urun", id);
            command.Parameters.AddWithValue("@tarih", DateTime.Now);
            command.Parameters.AddWithValue("@puan", 3);
            int sonuc = command.ExecuteNonQuery();

            Response.Redirect(Request.RawUrl);
        }

        protected void puan4_Click(object sender, ImageClickEventArgs e)
        {
            String id = Request.QueryString["urunid"].ToString();
            String baglantiString = ConfigurationManager.ConnectionStrings["baglantiString"].ConnectionString;
            SqlConnection baglanti = new SqlConnection(baglantiString);
            baglanti.Open();

            String sorgu = "insert into puan(urun_id, puan_tarih, puan) values(@urun, @tarih, @puan);";
            SqlCommand command = new SqlCommand(sorgu, baglanti);
            command.Parameters.AddWithValue("@urun", id);
            command.Parameters.AddWithValue("@tarih", DateTime.Now);
            command.Parameters.AddWithValue("@puan", 4);
            int sonuc = command.ExecuteNonQuery();

            Response.Redirect(Request.RawUrl);
        }

        protected void puan5_Click(object sender, ImageClickEventArgs e)
        {
            String id = Request.QueryString["urunid"].ToString();
            String baglantiString = ConfigurationManager.ConnectionStrings["baglantiString"].ConnectionString;
            SqlConnection baglanti = new SqlConnection(baglantiString);
            baglanti.Open();

            String sorgu = "insert into puan(urun_id, puan_tarih, puan) values(@urun, @tarih, @puan);";
            SqlCommand command = new SqlCommand(sorgu, baglanti);
            command.Parameters.AddWithValue("@urun", id);
            command.Parameters.AddWithValue("@tarih", DateTime.Now);
            command.Parameters.AddWithValue("@puan", 5);
            int sonuc = command.ExecuteNonQuery();

            Response.Redirect(Request.RawUrl);
        }
    }
}