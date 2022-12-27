using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Npgsql;

namespace VTYSproje
{
    public partial class Ekleme : Form
    {
        public Ekleme()
        {
            InitializeComponent();
        }

        NpgsqlConnection baglanti = new NpgsqlConnection("Server = localhost; Port=5432; Database=eczane2; User Id = postgres; Password=admin;");
        DataSet temp = new DataSet();
        private void btnekle_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand yaz = new NpgsqlCommand("insert into ilac(adi,firmaid,fiyat,kategori) values(@adi,@firmaid,@fiyat,@kategori)",baglanti);
            yaz.Parameters.AddWithValue("@adi",txtbxilacAdi.Text);
            yaz.Parameters.AddWithValue("@firmaid", int.Parse(cmbxfirma.Text));
            yaz.Parameters.AddWithValue("@fiyat", int.Parse(txtbxfiyat.Text));
            yaz.Parameters.AddWithValue("@kategori", int.Parse(cmbxKategori.Text));
            yaz.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Başarılı.");
            txtbxilacAdi.Text = "";
            cmbxfirma.Text = "";
            txtbxfiyat.Text = "";
            cmbxKategori.Text = "";

            temp.Tables["ilac"].Clear();
            baglanti.Open();
            NpgsqlDataAdapter adapter = new NpgsqlDataAdapter("select *from ilac", baglanti);
            adapter.Fill(temp, "ilac");
            dtgrdwveklemesf.DataSource = temp.Tables["ilac"];
            baglanti.Close();
           
        }

        private void cmbxfirma_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void Ekleme_Load(object sender, EventArgs e)
        {
            NpgsqlCommand command = new NpgsqlCommand("select * from ilacfirma", baglanti);
            baglanti.Open();
            NpgsqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                cmbxfirma.Items.Add(reader["firmaid"]);
            }
            baglanti.Close();

            NpgsqlCommand command2 = new NpgsqlCommand("select * from ilackategori", baglanti);
            baglanti.Open();
            NpgsqlDataReader reader2 = command2.ExecuteReader();

            while (reader2.Read())
            {
                cmbxKategori.Items.Add(reader2["kategorid"]);
            }
            baglanti.Close();

            baglanti.Open();
            NpgsqlDataAdapter adapter = new NpgsqlDataAdapter("select * from ilac", baglanti);
            adapter.Fill(temp, "ilac");
            dtgrdwveklemesf.DataSource = temp.Tables["ilac"];
            baglanti.Close();
        }
    }
}
