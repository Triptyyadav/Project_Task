using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Productmanagement.Models;
using Productmanagement.Repository;
using PagedList;
namespace Productmanagement.Controllers


{
    public class ProductMasterController : Controller
    {
        // GET: Product
        public ActionResult Index(int? page)
        {
            ProductManagementRepository pmRepo = new ProductManagementRepository();
            ModelState.Clear();
            int pageSize = 10;
            int pageIndex = 1;
            pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;

            ProductListModel objProductList = new ProductListModel();
            objProductList = pmRepo.GetAllProduct(pageIndex, pageSize);

           return View(objProductList.ProductList.ToPagedList(pageIndex, pageSize));            
        }



        public ActionResult AddProduct()
        {
            ProductManagementRepository pmRepo = new ProductManagementRepository();
            ProductModel objProduct = new ProductModel();

            List<SelectListItem> items = new List<SelectListItem>();

            List<CategoryModel> objList = pmRepo.GetAllCategory();
            
            foreach (CategoryModel catagory in objList)
            {
                items.Add(new SelectListItem
                {
                    Text = catagory.CategoryName,
                    Value = catagory.CategoryId.ToString()
                });
            }
            Session["CategoryList"] = objList;
            ViewBag.ListItems = items;
            return View("AddProduct", objProduct);
        }


        [HttpPost]
        public ActionResult AddProduct(ProductModel objProduct)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ProductManagementRepository pmRepo = new ProductManagementRepository();

                    if (pmRepo.AddProduct(objProduct))
                    {
                        ViewBag.Message = "Product Master added successfully";


                    }
                }

                
                
                List<SelectListItem> items = new List<SelectListItem>();

                List<CategoryModel> objList = (List<CategoryModel>)Session["CategoryList"];

                foreach (CategoryModel catagory in objList)
                {
                    items.Add(new SelectListItem
                    {
                        Text = catagory.CategoryName,
                        Value = catagory.CategoryId.ToString()
                    });
                }

                ViewBag.ListItems = items;
                return View("AddProduct", objProduct);

            }
            catch
            {
                return View();
            }
        }

        public ActionResult EditProductDetails(int id)
        {
            ProductManagementRepository pmRepo = new ProductManagementRepository();
            List<SelectListItem> items = new List<SelectListItem>();

            List<CategoryModel> objList = pmRepo.GetAllCategory();

            foreach (CategoryModel catagory in objList)
            {
                items.Add(new SelectListItem
                {
                    Text = catagory.CategoryName,
                    Value = catagory.CategoryId.ToString()
                });
            }

            ViewBag.ListItems = items;
            return View("EditProduct",pmRepo.GetProductById(id));
            
        }


        [HttpPost]
        public ActionResult EditProductDetails(int id, ProductModel obj)
        {
            try
            {
                ProductManagementRepository pmRepo = new ProductManagementRepository();

                pmRepo.UpdateProduct(obj);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }


        public ActionResult DeleteProduct(int id)
        {
            try
            {
                ProductManagementRepository pmRepo = new ProductManagementRepository();
                if (pmRepo.DeleteProduct(id))
                {
                    ViewBag.AlertMsg = "Product Master deleted successfully";

                }
                return RedirectToAction("Index");

            }
            catch
            {
                return View();
            }
        }



    }
}
