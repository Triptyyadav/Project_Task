using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Productmanagement.Models;

namespace Productmanagement.Repository
{


    public class ProductManagementRepository
    {

        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Tripty\Desktop\arvind\cattering service\nimap.mdf;Integrated Security=True");




        public List<CategoryModel> GetAllCategory()
        {
            List<CategoryModel> CategoryList = new List<CategoryModel>();
            try
            {


                SqlCommand com = new SqlCommand("Select * from category_master", con);
                com.CommandType = CommandType.Text;
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataTable dt = new DataTable();

                con.Open();
                da.Fill(dt);
                con.Close();
                foreach (DataRow dr in dt.Rows)
                {

                    CategoryList.Add(

                        new CategoryModel
                        {

                            CategoryId = Convert.ToInt32(dr["categoryId"]),
                            CategoryName = Convert.ToString(dr["category_name"]),


                        }
                        );
                }
            }
            catch (Exception)
            {

                throw;
            }

            return CategoryList;
        }


        public bool UpdateCategory(CategoryModel obj)
        {


            SqlCommand com = new SqlCommand("UpdateCategoryDetails", con);

            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@CategoryId", obj.CategoryId);
            com.Parameters.AddWithValue("@CategoryName", obj.CategoryName);

            con.Open();
            int i = com.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
            {

                return true;

            }
            else
            {

                return false;
            }
        }

        public bool AddCategory(CategoryModel obj)
        {


            SqlCommand com = new SqlCommand("AddCategory", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@CategoryName", obj.CategoryName);

            con.Open();
            int i = com.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
            {

                return true;

            }
            else
            {

                return false;
            }
        }

        public bool DeleteCategory(int Id)
        {


            SqlCommand com = new SqlCommand("DeleteCategory", con);

            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@CategoryId", Id);

            con.Open();
            int i = com.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
            {

                return true;

            }
            else
            {

                return false;
            }


        }
        //produt
        public ProductListModel GetAllProduct(int page =0,int size =10)
        {
            ProductListModel objProductList = new ProductListModel();

           List<ProductModel> ProductList = new List<ProductModel>();
            


            try
            {


                SqlCommand com = new SqlCommand("GetAllProductDetails", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@page", page);
                com.Parameters.AddWithValue("@size", size);
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataSet ds = new DataSet();

                con.Open();
                da.Fill(ds);
                con.Close();
                foreach (DataRow dr in ds.Tables[0].Rows)
                {

                    ProductList.Add(

                        new ProductModel
                        {

                            ProductId = Convert.ToInt32(dr["Product_Id"]),
                            ProductName = Convert.ToString(dr["Product_name"]),
                            CategoryId = Convert.ToInt32(dr["categoryId"]),
                            CategoryName = Convert.ToString(dr["category_name"]),

                        }
                        );

                    
                }


                objProductList.ProductList = ProductList;
                objProductList.RowTotalCount = Convert.ToInt32(ds.Tables[1].Rows[0]["TotalRecord"]);
            }
            catch (Exception)
            {

                throw;
            }

            return objProductList;
        }

        public bool UpdateProduct(ProductModel obj)
        {


            SqlCommand com = new SqlCommand("UpdateProductDetails", con);

            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@ProductId", obj.ProductId);
            com.Parameters.AddWithValue("@ProductName", obj.ProductName);
            com.Parameters.AddWithValue("@CategoryId", obj.CategoryId);
            con.Open();
            int i = com.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
            {

                return true;

            }
            else
            {

                return false;
            }
        }

        public bool AddProduct(ProductModel obj)
        {


            SqlCommand com = new SqlCommand("AddProduct", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@ProductName", obj.ProductName);
            com.Parameters.AddWithValue("@CategoryId", obj.CategoryId);
            con.Open();
            int i = com.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
            {

                return true;

            }
            else
            {

                return false;
            }
        }

        public bool DeleteProduct(int Id)
        {


            SqlCommand com = new SqlCommand("DeleteProduct", con);

            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@ProductId", Id);

            con.Open();
            int i = com.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
            {

                return true;

            }
            else
            {

                return false;
            }
        }
        public ProductModel GetProductById(int ProductId)
        {
            

            ProductModel objProduct = new ProductModel();

            try
            {


                SqlCommand com = new SqlCommand("GetProductById", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@ProductId", ProductId);
                
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataSet ds = new DataSet();

                con.Open();
                da.Fill(ds);
                con.Close();
                foreach (DataRow dr in ds.Tables[0].Rows)
                {

                    objProduct.ProductId = Convert.ToInt32(dr["Product_Id"]);
                    objProduct.ProductName = Convert.ToString(dr["Product_name"]);
                    objProduct.CategoryId = Convert.ToInt32(dr["categoryId"]);
                 }

            }
            catch (Exception)
            {

                throw;
            }

            return objProduct;
        }


        
    }
}