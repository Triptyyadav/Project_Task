using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Productmanagement.Models
{
    public class CategoryModel
    {
        [Display(Name = "CategoryId")]

        public int CategoryId { get; set; }

        [Required(ErrorMessage = "Category Name is required.")]
        [Display(Name = "Category Name")]
        public string CategoryName { get; set; }
       
        

    }
}