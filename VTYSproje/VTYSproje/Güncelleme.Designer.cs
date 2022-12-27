namespace VTYSproje
{
    partial class Güncelleme
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
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.cmbxilacid = new System.Windows.Forms.ComboBox();
            this.dataGridViewGuncelleme = new System.Windows.Forms.DataGridView();
            this.cmbxFirma = new System.Windows.Forms.ComboBox();
            this.cmbxKategori = new System.Windows.Forms.ComboBox();
            this.txtbxilacAdi = new System.Windows.Forms.TextBox();
            this.txtbxFiyat = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.btnGuncelle = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewGuncelleme)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label1.Location = new System.Drawing.Point(13, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(239, 25);
            this.label1.TabIndex = 0;
            this.label1.Text = "GÜNCELLEME SAYFASI";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label2.Location = new System.Drawing.Point(705, 91);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(172, 20);
            this.label2.TabIndex = 1;
            this.label2.Text = "Güncellenecek ilac ID";
            // 
            // cmbxilacid
            // 
            this.cmbxilacid.FormattingEnabled = true;
            this.cmbxilacid.Location = new System.Drawing.Point(709, 121);
            this.cmbxilacid.Name = "cmbxilacid";
            this.cmbxilacid.Size = new System.Drawing.Size(158, 24);
            this.cmbxilacid.TabIndex = 2;
            this.cmbxilacid.SelectedIndexChanged += new System.EventHandler(this.cmbxilacid_SelectedIndexChanged);
            // 
            // dataGridViewGuncelleme
            // 
            this.dataGridViewGuncelleme.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewGuncelleme.Location = new System.Drawing.Point(18, 81);
            this.dataGridViewGuncelleme.Name = "dataGridViewGuncelleme";
            this.dataGridViewGuncelleme.RowHeadersWidth = 51;
            this.dataGridViewGuncelleme.RowTemplate.Height = 24;
            this.dataGridViewGuncelleme.Size = new System.Drawing.Size(553, 252);
            this.dataGridViewGuncelleme.TabIndex = 3;
            // 
            // cmbxFirma
            // 
            this.cmbxFirma.FormattingEnabled = true;
            this.cmbxFirma.Location = new System.Drawing.Point(774, 212);
            this.cmbxFirma.Name = "cmbxFirma";
            this.cmbxFirma.Size = new System.Drawing.Size(121, 24);
            this.cmbxFirma.TabIndex = 4;
            // 
            // cmbxKategori
            // 
            this.cmbxKategori.FormattingEnabled = true;
            this.cmbxKategori.Location = new System.Drawing.Point(774, 254);
            this.cmbxKategori.Name = "cmbxKategori";
            this.cmbxKategori.Size = new System.Drawing.Size(121, 24);
            this.cmbxKategori.TabIndex = 4;
            // 
            // txtbxilacAdi
            // 
            this.txtbxilacAdi.Location = new System.Drawing.Point(774, 172);
            this.txtbxilacAdi.Name = "txtbxilacAdi";
            this.txtbxilacAdi.Size = new System.Drawing.Size(121, 22);
            this.txtbxilacAdi.TabIndex = 5;
            // 
            // txtbxFiyat
            // 
            this.txtbxFiyat.Location = new System.Drawing.Point(774, 296);
            this.txtbxFiyat.Name = "txtbxFiyat";
            this.txtbxFiyat.Size = new System.Drawing.Size(121, 22);
            this.txtbxFiyat.TabIndex = 5;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label3.Location = new System.Drawing.Point(675, 172);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(69, 20);
            this.label3.TabIndex = 6;
            this.label3.Text = "İlaç Adı:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label4.Location = new System.Drawing.Point(665, 213);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(79, 20);
            this.label4.TabIndex = 6;
            this.label4.Text = "Firma ID:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label5.Location = new System.Drawing.Point(646, 254);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(98, 20);
            this.label5.TabIndex = 6;
            this.label5.Text = "Kategori ID:";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label6.Location = new System.Drawing.Point(694, 295);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(50, 20);
            this.label6.TabIndex = 6;
            this.label6.Text = "Fiyat:";
            // 
            // btnGuncelle
            // 
            this.btnGuncelle.Location = new System.Drawing.Point(717, 364);
            this.btnGuncelle.Name = "btnGuncelle";
            this.btnGuncelle.Size = new System.Drawing.Size(150, 40);
            this.btnGuncelle.TabIndex = 7;
            this.btnGuncelle.Text = "GÜNCELLE";
            this.btnGuncelle.UseVisualStyleBackColor = true;
            this.btnGuncelle.Click += new System.EventHandler(this.btnGuncelle_Click);
            // 
            // Güncelleme
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(968, 480);
            this.Controls.Add(this.btnGuncelle);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtbxFiyat);
            this.Controls.Add(this.txtbxilacAdi);
            this.Controls.Add(this.cmbxKategori);
            this.Controls.Add(this.cmbxFirma);
            this.Controls.Add(this.dataGridViewGuncelleme);
            this.Controls.Add(this.cmbxilacid);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "Güncelleme";
            this.Text = "Güncelleme";
            this.Load += new System.EventHandler(this.Güncelleme_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewGuncelleme)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox cmbxilacid;
        private System.Windows.Forms.DataGridView dataGridViewGuncelleme;
        private System.Windows.Forms.ComboBox cmbxFirma;
        private System.Windows.Forms.ComboBox cmbxKategori;
        private System.Windows.Forms.TextBox txtbxilacAdi;
        private System.Windows.Forms.TextBox txtbxFiyat;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button btnGuncelle;
    }
}