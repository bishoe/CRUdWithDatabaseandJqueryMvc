//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CRUdWithDatabaseandJquery.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Items
    {
        public int ID { get; set; }
        public Nullable<int> Cat_id { get; set; }
        public string Item_name { get; set; }
        public string Item_img { get; set; }
        public Nullable<decimal> Item_price { get; set; }
        public Nullable<decimal> Item_quantity { get; set; }
        public string Item_Detalis { get; set; }
    }
}