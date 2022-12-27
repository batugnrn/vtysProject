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
    public partial class Arama : Form
    {
        public Arama()
        {
            InitializeComponent();
        }

        NpgsqlConnection baglanti = new NpgsqlConnection("Server = localhost; Port=5432; Database=eczane2; User Id = postgres; Password=admin;");
        DataSet temp = new DataSet();

        private void Arama_Load(object sender, EventArgs e)
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
            dataGridViewAramasf.DataSource = temp.Tables["ilac"];
            baglanti.Close();
        }

        private void cmbxiliacid_SelectedIndexChanged(object sender, EventArgs e)
        {
            temp.Tables["ilac"].Clear();
            DataTable tbl = new DataTable();
            baglanti.Open();
            NpgsqlDataAdapter adapter = new NpgsqlDataAdapter("select *from ilac where ilacid=@ilacid ", baglanti);
            adapter.SelectCommand.Parameters.AddWithValue("@ilacid", int.Parse(cmbxiliacid.Text));
            adapter.Fill(tbl);
            dataGridViewAramasf.DataSource = tbl;
            baglanti.Close();
        }
    }
}
