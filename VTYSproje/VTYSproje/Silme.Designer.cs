namespace VTYSproje
{
    partial class Silme
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
            this.cmbxiliacid = new System.Windows.Forms.ComboBox();
            this.dataGridViewSilme = new System.Windows.Forms.DataGridView();
            this.btnSil = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewSilme)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label1.Location = new System.Drawing.Point(13, 13);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(163, 25);
            this.label1.TabIndex = 0;
            this.label1.Text = "SİLME SAYFASI";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label2.Location = new System.Drawing.Point(704, 127);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(174, 20);
            this.label2.TabIndex = 5;
            this.label2.Text = "Silinecek İlaç ID seçin";
            // 
            // cmbxiliacid
            // 
            this.cmbxiliacid.FormattingEnabled = true;
            this.cmbxiliacid.Location = new System.Drawing.Point(719, 161);
            this.cmbxiliacid.Name = "cmbxiliacid";
            this.cmbxiliacid.Size = new System.Drawing.Size(137, 24);
            this.cmbxiliacid.TabIndex = 4;
            this.cmbxiliacid.SelectedIndexChanged += new System.EventHandler(this.cmbxiliacid_SelectedIndexChanged);
            // 
            // dataGridViewSilme
            // 
            this.dataGridViewSilme.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewSilme.Location = new System.Drawing.Point(18, 75);
            this.dataGridViewSilme.Name = "dataGridViewSilme";
            this.dataGridViewSilme.RowHeadersWidth = 51;
            this.dataGridViewSilme.RowTemplate.Height = 24;
            this.dataGridViewSilme.Size = new System.Drawing.Size(553, 252);
            this.dataGridViewSilme.TabIndex = 6;
            // 
            // btnSil
            // 
            this.btnSil.Location = new System.Drawing.Point(708, 234);
            this.btnSil.Name = "btnSil";
            this.btnSil.Size = new System.Drawing.Size(150, 40);
            this.btnSil.TabIndex = 7;
            this.btnSil.Text = "SİL";
            this.btnSil.UseVisualStyleBackColor = true;
            this.btnSil.Click += new System.EventHandler(this.btnSil_Click);
            // 
            // Silme
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(961, 382);
            this.Controls.Add(this.btnSil);
            this.Controls.Add(this.dataGridViewSilme);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.cmbxiliacid);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "Silme";
            this.Text = "Silme";
            this.Load += new System.EventHandler(this.Silme_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewSilme)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox cmbxiliacid;
        private System.Windows.Forms.DataGridView dataGridViewSilme;
        private System.Windows.Forms.Button btnSil;
    }
}