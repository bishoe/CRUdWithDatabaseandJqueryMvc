using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUdWithDatabaseandJquery
{
    public class AddNewItem
    {
        public int ID { get; set; }
        public int Cat_id { get; set; }
        public string Item_name { get; set; }
        public string Item_img { get; set; }
        public decimal Item_price { get; set; }
        public decimal Item_quantity { get; set; }
        public string Item_Detalis { get; set; }


    }
}