using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCaPhe.DAO
{
    public class DataProvider
    {
        string connectionStr = "Data Source=DESKTOP-L4MP05E;Initial Catalog=QuanLyQuanCaPhe;" +
                               "Integrated Security=True";

        public DataTable excuteQuery(string query, object[] parameter = null)
        {
            DataTable data = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionStr))
            {

                connection.Open();

                SqlCommand command = new SqlCommand(query,connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;

                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item,parameter[i]);
                            i++;
                        }                          
                    }

                }

                SqlDataAdapter adapter = new SqlDataAdapter(command);

                adapter.Fill(data);

                connection.Close();
            }

            return data;

        }
    }
}
