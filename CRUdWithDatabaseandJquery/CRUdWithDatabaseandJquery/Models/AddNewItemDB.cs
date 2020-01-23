using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CRUdWithDatabaseandJquery.Models
{
    public class AddNewItemDB
    {
        //declare connection string  
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //Return list of all Employees  
        public List<AddNewItem> ListAll()
        {
            List<AddNewItem> lst = new List<AddNewItem>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("SelectItems", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = com.ExecuteReader();
                while (rdr.Read())
                {
                    lst.Add(new AddNewItem
                    {
                        ID = Convert.ToInt32(rdr["ID"]),
                        Cat_id = Convert.ToInt32(rdr["Cat_id"]),
                        Item_name = rdr["Item_name"].ToString(),
                        Item_img = rdr["Item_img"].ToString(),
                        Item_price =Convert.ToDecimal( rdr["Item_price"]),
                        Item_quantity = Convert.ToDecimal(rdr["Item_quantity"]),
                        
                        Item_Detalis = rdr["Item_Detalis"].ToString(),
                    });
                }
                return lst;
            }
        }

        //Method for Adding an Employee  
        public int Add(AddNewItem AddNe)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateItems", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@Id", AddNe.ID);
                com.Parameters.AddWithValue("@Cat_id", AddNe.Cat_id);
                com.Parameters.AddWithValue("@Item_name", AddNe.Item_name);
                com.Parameters.AddWithValue("@Item_img", AddNe.Item_img);
                com.Parameters.AddWithValue("@Item_price", AddNe.Item_price);
                com.Parameters.AddWithValue("@Item_quantity", AddNe.Item_quantity);
                com.Parameters.AddWithValue("@Item_Detalis", AddNe.Item_Detalis);

                com.Parameters.AddWithValue("@Action", "Insert");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        //Method for Updating Employee record  
        public int Update(AddNewItem AddNe)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateItems", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@Id", AddNe.ID);
                com.Parameters.AddWithValue("@Cat_id", AddNe.Cat_id);
                com.Parameters.AddWithValue("@Item_name", AddNe.Item_name);
                com.Parameters.AddWithValue("@Item_img", AddNe.Item_img);
                com.Parameters.AddWithValue("@Item_price", AddNe.Item_price);
                com.Parameters.AddWithValue("@Item_quantity", AddNe.Item_quantity);
                com.Parameters.AddWithValue("@Item_Detalis", AddNe.Item_Detalis);

                com.Parameters.AddWithValue("@Action", "Update");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        //Method for Deleting an Employee  
        public int Delete(int ID)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("DeleteItems", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@ID", ID);
                i = com.ExecuteNonQuery();
            }
            return i;
        }
    }

}