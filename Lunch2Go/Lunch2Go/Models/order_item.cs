//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Lunch2Go.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    
    public partial class order_item
    {
        [Key]
        public int order_id { get; set; }
        public int product_id { get; set; }
        public Nullable<int> qty { get; set; }
    
        public virtual order order { get; set; }
        public virtual product product { get; set; }
    }
}
