namespace VTYSproje
{
    partial class Ekleme
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblilacAdi = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtbxilacAdi = new System.Windows.Forms.TextBox();
            this.txtbxfiyat = new System.Windows.Forms.TextBox();
            this.cmbxKategori = new System.Windows.Forms.ComboBox();
            this.cmbxfirma = new System.Windows.Forms.ComboBox();
            this.dtgrdwveklemesf = new System.Windows.Forms.DataGridView();
            this.btnekle = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dtgrdwveklemesf)).BeginInit();
            this.SuspendLayout();
            // 
            // lblilacAdi
            // 
            this.lblilacAdi.AutoSize = true;
            this.lblilacAdi.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.lblilacAdi.Location = new System.Drawing.Point(695, 97);
            this.lblilacAdi.Name = "lblilacAdi";
            this.lblilacAdi.Size = new System.Drawing.Size(69, 20);
            this.lblilacAdi.TabIndex = 1;
            this.lblilacAdi.Text = "İlaç Adı:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label1.Location = new System.Drawing.Point(685, 135);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(79, 20);
            this.label1.TabIndex = 1;
            this.label1.Text = "Firma ID:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label2.Location = new System.Drawing.Point(714, 173);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(50, 20);
            this.label2.TabIndex = 1;
            this.label2.Text = "Fiyat:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label3.Location = new System.Drawing.Point(666, 211);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(98, 20);
            this.label3.TabIndex = 1;
            this.label3.Text = "Kategori ID:";
            // 
            // txtbxilacAdi
            // 
            this.txtbxilacAdi.Location = new System.Drawing.Point(799, 97);
            this.txtbxilacAdi.Name = "txtbxilacAdi";
            this.txtbxilacAdi.Size = new System.Drawing.Size(121, 22);
            this.txtbxilacAdi.TabIndex = 2;
            // 
            // txtbxfiyat
            // 
            this.txtbxfiyat.Location = new System.Drawing.Point(799, 173);
            this.txtbxfiyat.Name = "txtbxfiyat";
            this.txtbxfiyat.Size = new System.Drawing.Size(121, 22);
            this.txtbxfiyat.TabIndex = 2;
            // 
            // cmbxKategori
            // 
            this.cmbxKategori.FormattingEnabled = true;
            this.cmbxKategori.Location = new System.Drawing.Point(799, 211);
            this.cmbxKategori.Name = "cmbxKategori";
            this.cmbxKategori.Size = new System.Drawing.Size(121, 24);
            this.cmbxKategori.TabIndex = 3;
            // 
            // cmbxfirma
            // 
            this.cmbxfirma.FormattingEnabled = true;
            this.cmbxfirma.Location = new System.Drawing.Point(799, 135);
            this.cmbxfirma.Name = "cmbxfirma";
            this.cmbxfirma.Size = new System.Drawing.Size(121, 24);
            this.cmbxfirma.TabIndex = 3;
            this.cmbxfirma.SelectedIndexChanged += new System.EventHandler(this.cmbxfirma_SelectedIndexChanged);
            // 
            // dtgrdwveklemesf
            // 
            this.dtgrdwveklemesf.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgrdwveklemesf.Location = new System.Drawing.Point(18, 88);
            this.dtgrdwveklemesf.Name = "dtgrdwveklemesf";
            this.dtgrdwveklemesf.RowHeadersWidth = 51;
            this.dtgrdwveklemesf.RowTemplate.Height = 24;
            this.dtgrdwveklemesf.Size = new System.Drawing.Size(553, 252);
            this.dtgrdwveklemesf.TabIndex = 4;
            // 
            // btnekle
            // 
            this.btnekle.Location = new System.Drawing.Point(729, 291);
            this.btnekle.Name = "btnekle";
            this.btnekle.Size = new System.Drawing.Size(150, 40);
            this.btnekle.TabIndex = 5;
            this.btnekle.Text = "EKLE";
            this.btnekle.UseVisualStyleBackColor = true;
            this.btnekle.Click += new System.EventHandler(this.btnekle_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label4.Location = new System.Drawing.Point(13, 13);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(184, 25);
            this.label4.TabIndex = 6;
            this.label4.Text = "EKLEME SAYFASI";
            // 
            // Ekleme
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(935, 489);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.btnekle);
            this.Controls.Add(this.dtgrdwveklemesf);
            this.Controls.Add(this.cmbxfirma);
            this.Controls.Add(this.cmbxKategori);
            this.Controls.Add(this.txtbxfiyat);
            this.Controls.Add(this.txtbxilacAdi);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.lblilacAdi);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "Ekleme";
            this.Text = "Ekleme";
            this.Load += new System.EventHandler(this.Ekleme_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dtgrdwveklemesf)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label lblilacAdi;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtbxilacAdi;
        private System.Windows.Forms.TextBox txtbxfiyat;
        private System.Windows.Forms.ComboBox cmbxKategori;
        private System.Windows.Forms.ComboBox cmbxfirma;
        private System.Windows.Forms.DataGridView dtgrdwveklemesf;
        private System.Windows.Forms.Button btnekle;
        private System.Windows.Forms.Label label4;
    }
}