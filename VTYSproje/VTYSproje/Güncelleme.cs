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
    public partial class Güncelleme : Form
    {
        public Güncelleme()
        {
            InitializeComponent();
        }
        NpgsqlConnection baglanti = new NpgsqlConnection("Server = localhost; Port=5432; Database=eczane2; User Id = postgres; Password=admin;");
        DataSet temp = new DataSet();
        private void Güncelleme_Load(object sender, EventArgs e)
        {
            NpgsqlCommand command = new NpgsqlCommand("select * from ilac", baglanti);
            baglanti.Open();
            NpgsqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                cmbxilacid.Items.Add(reader["ilacid"]);
            }
            baglanti.Close();


            NpgsqlCommand command2 = new NpgsqlCommand("select * from ilacfirma", baglanti);
            baglanti.Open();
            NpgsqlDataReader reader2 = command2.ExecuteReader();

            while (reader2.Read())
            {
                cmbxFirma.Items.Add(reader2["firmaid"]);
            }
            baglanti.Close();


            NpgsqlCommand command3 = new NpgsqlCommand("select * from ilackategori", baglanti);
            baglanti.Open();
            NpgsqlDataReader reader3 = command3.ExecuteReader();

            while (reader3.Read())
            {
                cmbxKategori.Items.Add(reader3["kategorid"]);
            }
            baglanti.Close();


            baglanti.Open();
            NpgsqlDataAdapter adapter = new NpgsqlDataAdapter("select * from ilac", baglanti);
            adapter.Fill(temp, "ilac");
            dataGridViewGuncelleme.DataSource = temp.Tables["ilac"];
            baglanti.Close();
        }

        private void btnGuncelle_Click(object sender, EventArgs e)
        {

            baglanti.Open();
            NpgsqlCommand yaz = new NpgsqlCommand("update ilac set adi=@adi, firmaid=@firmaid, kategori=@kategori, fiyat=@fiyat where ilacid=@ilacid", baglanti);
            yaz.Parameters.AddWithValue("@ilacid", int.Parse(cmbxilacid.Text));
            yaz.Parameters.AddWithValue("@adi", txtbxilacAdi.Text);
            yaz.Parameters.AddWithValue("@firmaid", int.Parse(cmbxFirma.Text));
            yaz.Parameters.AddWithValue("@kategori", int.Parse(cmbxKategori.Text));
            yaz.Parameters.AddWithValue("@fiyat", int.Parse(txtbxFiyat.Text));
            yaz.ExecuteNonQuery();
            baglanti.Close();



            MessageBox.Show("Basarili.");
            cmbxilacid.Text = "";
            txtbxilacAdi.Text = "";
            cmbxFirma.Text = "";
            cmbxKategori.Text = "";
            txtbxFiyat.Text = "";
            temp.Tables["ilac"].Clear();
            baglanti.Open();
            NpgsqlDataAdapter adapter = new NpgsqlDataAdapter("select *from ilac", baglanti);
            adapter.Fill(temp, "ilac");
            dataGridViewGuncelleme.DataSource = temp.Tables["ilac"];
            baglanti.Close();
        }

        private void cmbxilacid_SelectedIndexChanged(object sender, EventArgs e)
        {
            temp.Tables["ilac"].Clear();
            DataTable tbl = new DataTable();
            baglanti.Open();
            NpgsqlDataAdapter adapter = new NpgsqlDataAdapter("select *from ilac where ilacid=@ilacid ",baglanti);
            adapter.SelectCommand.Parameters.AddWithValue("@ilacid", int.Parse(cmbxilacid.Text));
            adapter.Fill(tbl);
            dataGridViewGuncelleme.DataSource = tbl;
            baglanti.Close();


            txtbxilacAdi.Text = dataGridViewGuncelleme.CurrentRow.Cells["adi"].Value.ToString();
            cmbxFirma.Text = dataGridViewGuncelleme.CurrentRow.Cells["firmaid"].Value.ToString();
            cmbxKategori.Text = dataGridViewGuncelleme.CurrentRow.Cells["kategori"].Value.ToString();
            txtbxFiyat.Text = dataGridViewGuncelleme.CurrentRow.Cells["fiyat"].Value.ToString();

        }
    }
}
