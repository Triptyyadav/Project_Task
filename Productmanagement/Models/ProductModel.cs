using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Productmanagement.Models
{
    public class ProductModel
    {
        [Display(Name = "CategoryId")]

        [Required(ErrorMessage = "Please select Category")]
        public int CategoryId { get; set; }

        
        public string CategoryName { get; set; }

        [Display(Name = "ProductId")]
        public int ProductId { get; set; }

        [Required(ErrorMessage = "Product Name is required.")]
        [Display(Name = "Product Name")]
        public string ProductName { get; set; }

        public List<CategoryModel> CategoryModelList { get; set; }

    }


    public class ProductListModel
    {

        public List<ProductModel> ProductList { get; set; }

        public int RowTotalCount { get; set; }

    }
}