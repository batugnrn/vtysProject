using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace VTYSproje
{
    public partial class Silme : Form
    {
        public Silme()
        {
            InitializeComponent();
        }
        NpgsqlConnection baglanti = new NpgsqlConnection("Server = localhost; Port=5432; Database=eczane2; User Id = postgres; Password=admin;");
        DataSet temp = new DataSet();
        private void cmbxiliacid_SelectedIndexChanged(object sender, EventArgs e)
        {
            temp.Tables["ilac"].Clear();
            DataTable tbl = new DataTable();
            baglanti.Open();
            NpgsqlDataAdapter adapter = new NpgsqlDataAdapter("select *from ilac where ilacid=@ilacid ", baglanti);
            adapter.SelectCommand.Parameters.AddWithValue("@ilacid", int.Parse(cmbxiliacid.Text));
            adapter.Fill(tbl);
            dataGridViewSilme.DataSource = tbl;
            baglanti.Close();
        }


        private void Silme_Load(object sender, EventArgs e)
        {
            NpgsqlCommand command = new NpgsqlCommand("select * from ilac", baglanti);
            baglanti.Open();
            NpgsqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                cmbxiliacid.Items.Add(reader["ilacid"]);
            }
            baglanti.Close();


            baglanti.Open();
            NpgsqlDataAdapter adapter = new NpgsqlDataAdapter("select * from ilac", baglanti);
            adapter.Fill(temp, "ilac");
            dataGridViewSilme.DataSource = temp.Tables["ilac"];
            baglanti.Close();
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand command = new NpgsqlCommand("delete from ilac where ilacid=@ilacid", baglanti);
            command.Parameters.AddWithValue("@ilacid", int.Parse(cmbxiliacid.Text));
            command.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Basarılı.");
            cmbxiliacid.Text = "";

            temp.Tables["ilac"].Clear();
            baglanti.Open();
            NpgsqlDataAdapter adapter = new NpgsqlDataAdapter("select * from ilac", baglanti);
            adapter.Fill(temp, "ilac");
            dataGridViewSilme.DataSource = temp.Tables["ilac"];
            baglanti.Close();


            cmbxiliacid.Items.Clear();
            NpgsqlCommand command2 = new NpgsqlCommand("select * from ilac", baglanti);
            baglanti.Open();
            NpgsqlDataReader reader2 = command2.ExecuteReader();

            while (reader2.Read())
            {
                cmbxiliacid.Items.Add(reader2["ilacid"]);
            }
            baglanti.Close();
        }
    }
}
