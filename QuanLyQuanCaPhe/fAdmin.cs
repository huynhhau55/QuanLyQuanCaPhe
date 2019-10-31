using QuanLyQuanCaPhe.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyQuanCaPhe
{
    public partial class fAdmin : Form
    {
        public fAdmin()
        {
            InitializeComponent();
            loadAccountList();
        }

        void loadAccountList()
        {
            string query = "EXEC USP_GetAccountByUsername2 @username , @DisplayName";
            DataProvider dataProvider = new DataProvider();
            dtgvAccount.DataSource = dataProvider.excuteQuery(query, new object[] { "admin","admin"});
        }

       
    }
}
