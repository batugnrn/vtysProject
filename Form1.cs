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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void FormGoster(Form gstr)
        {
            pnlAnasayfa.Controls.Clear();
            gstr.MdiParent = this;
            pnlAnasayfa.Controls.Add(gstr);
            gstr.Show();
        }
        private void aRAMAToolStripMenuItem2_Click(object sender, EventArgs e)
        {
            Arama arama = new Arama();
            FormGoster(arama);
        }

        private void sİLMEToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            Silme silme = new Silme();
            FormGoster(silme);
        }

        private void gÜNCELLEMEToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Güncelleme güncelleme = new Güncelleme();
            FormGoster(güncelleme);
        }

        private void eKLEMEToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            Ekleme ekleme = new Ekleme();
            FormGoster(ekleme);
        }
    }
}
