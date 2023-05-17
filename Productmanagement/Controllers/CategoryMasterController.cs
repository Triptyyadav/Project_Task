using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Productmanagement.Models;
using Productmanagement.Repository;
namespace Productmanagement.Controllers
{
    public class CategoryMasterController : Controller
    {
        // GET: Category
        public ActionResult Index()
        {
            ProductManagementRepository pmRepo = new ProductManagementRepository();
            ModelState.Clear();
            return View(pmRepo.GetAllCategory());
            
        }

       

      
        public ActionResult AddCategory()
        {
            CategoryModel objCategory = new CategoryModel();
            return View("AddCategory", objCategory);
        }


        [HttpPost]
        public ActionResult AddCategory(CategoryModel objCategory)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ProductManagementRepository pmRepo = new ProductManagementRepository();

                    if (pmRepo.AddCategory(objCategory))
                    {
                        ViewBag.Message = "Category Master added successfully";
                        

                    }
                }

                
                return View("AddCategory", objCategory);
                
            }
            catch
            {
                return View();
            }
        }

        public ActionResult EditCategoryDetails(int id)
        {
            ProductManagementRepository pmRepo = new ProductManagementRepository();
            return View("EditCategory",pmRepo.GetAllCategory().Find(pm => pm.CategoryId == id));

        }

        
        [HttpPost]
        public ActionResult EditCategoryDetails(int id, CategoryModel obj)
        {
            try
            {
                ProductManagementRepository pmRepo = new ProductManagementRepository();

                pmRepo.UpdateCategory(obj);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        
        public ActionResult DeleteCategory(int id)
        {
            try
            {
                ProductManagementRepository pmRepo = new ProductManagementRepository();
                if (pmRepo.DeleteCategory(id))
                {
                    ViewBag.AlertMsg = "Category Master deleted successfully";

                }
                return RedirectToAction("Index");

            }
            catch (Exception ex)
            {
                return RedirectToAction("Index");
            }
        }

    }
}
