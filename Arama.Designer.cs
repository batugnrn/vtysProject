namespace VTYSproje
{
    partial class Arama
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
            this.dataGridViewAramasf = new System.Windows.Forms.DataGridView();
            this.cmbxiliacid = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewAramasf)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridViewAramasf
            // 
            this.dataGridViewAramasf.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewAramasf.Location = new System.Drawing.Point(18, 84);
            this.dataGridViewAramasf.Name = "dataGridViewAramasf";
            this.dataGridViewAramasf.RowHeadersWidth = 51;
            this.dataGridViewAramasf.RowTemplate.Height = 24;
            this.dataGridViewAramasf.Size = new System.Drawing.Size(553, 252);
            this.dataGridViewAramasf.TabIndex = 1;
            // 
            // cmbxiliacid
            // 
            this.cmbxiliacid.FormattingEnabled = true;
            this.cmbxiliacid.Location = new System.Drawing.Point(732, 196);
            this.cmbxiliacid.Name = "cmbxiliacid";
            this.cmbxiliacid.Size = new System.Drawing.Size(121, 24);
            this.cmbxiliacid.TabIndex = 2;
            this.cmbxiliacid.SelectedIndexChanged += new System.EventHandler(this.cmbxiliacid_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label1.Location = new System.Drawing.Point(738, 157);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(94, 20);
            this.label1.TabIndex = 3;
            this.label1.Text = "İlaç ID girin";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label2.Location = new System.Drawing.Point(13, 13);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(175, 25);
            this.label2.TabIndex = 4;
            this.label2.Text = "ARAMA SAYFASI";
            // 
            // Arama
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(979, 456);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cmbxiliacid);
            this.Controls.Add(this.dataGridViewAramasf);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "Arama";
            this.Text = "Arama";
            this.Load += new System.EventHandler(this.Arama_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewAramasf)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.DataGridView dataGridViewAramasf;
        private System.Windows.Forms.ComboBox cmbxiliacid;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
    }
}