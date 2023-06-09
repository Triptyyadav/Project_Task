

CREATE DATABASE NIMAP;



/****** Object:  Table [dbo].[category_master]    Script Date: 5/16/2023 11:04:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_master](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Master]    Script Date: 5/16/2023 11:04:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Master](
	[Product_Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [varchar](50) NOT NULL,
	[categoryId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product_Master]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[category_master] ([categoryId])
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 5/16/2023 11:04:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCategory]
	@CategoryName varchar(50) = ''
	
AS
	Insert into category_master (category_name)
	values (@CategoryName)
RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 5/16/2023 11:04:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddProduct]
	@ProductName varchar(50) = '',
	@categoryId int =0
AS
	Insert into Product_Master(Product_Name ,categoryId)
	values (@ProductName,@categoryId)
RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 5/16/2023 11:04:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCategory]
	@CategoryId int = 0
	
AS
	Delete from category_master
	where CategoryId =@CategoryId
RETURN 1
GO

/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 5/16/2023 11:04:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProduct]
	@ProductId int = 0
	
AS
	Delete from Product_Master
	where Product_Id =@ProductId
RETURN 1
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProductDetails]
 @page INT = 0,
 @size INT = 10
AS

--DECLARE @offset INT
--DECLARE @newsize INT

--SET @size = 9999999;
--IF(@page=0)
--      BEGIN
--        SET @offset = @page
--        SET @newsize = @size
--       END
--    ELSE 
--      BEGIN
--        SET @offset = @page*@size
--        SET @newsize = @size
--      END



SELECT Product_Id,Product_Name,a.categoryId ,b.category_name from Product_Master a
inner join category_master b on a.categoryId = b.categoryId
ORDER BY Product_Id
--OFFSET @offset ROWS FETCH NEXT @newsize ROWS ONLY;

select count(*) as TotalRecord from Product_Master
GO
/****** Object:  StoredProcedure [dbo].[GetProductById]    Script Date: 5/16/2023 11:04:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductById]
	@ProductId int = 0
	
AS
	SELECT * from Product_Master
	where Product_Id = @ProductId
GO
/****** Object:  StoredProcedure [dbo].[UpdateCategoryDetails]    Script Date: 5/16/2023 11:04:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCategoryDetails]
	@CategoryId int = 0,
	@CategoryName varchar(50) =''
As


UPDATE category_master
SET category_name = @CategoryName
Where categoryId = @CategoryId

RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[UpdateProductDetails]    Script Date: 5/16/2023 11:04:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProductDetails]
	@ProductId int = 0,
	@ProductName varchar(50) ='',
	@CategoryId int = 0

As


UPDATE Product_Master
SET Product_name = @ProductName,
categoryId = @CategoryId
Where Product_Id = @ProductId

RETURN 1
GO

/**********************************************************/



SET IDENTITY_INSERT [dbo].[category_master] ON 

INSERT [dbo].[category_master] ([categoryId], [category_name]) VALUES (1, N'Mobiles')
INSERT [dbo].[category_master] ([categoryId], [category_name]) VALUES (2, N'Mobile Accessories')
INSERT [dbo].[category_master] ([categoryId], [category_name]) VALUES (3, N'Laptops')
INSERT [dbo].[category_master] ([categoryId], [category_name]) VALUES (4, N'Television')
INSERT [dbo].[category_master] ([categoryId], [category_name]) VALUES (5, N'Kitchen Appliances')
INSERT [dbo].[category_master] ([categoryId], [category_name]) VALUES (6, N'Home Appliances')
INSERT [dbo].[category_master] ([categoryId], [category_name]) VALUES (7, N'Office Appliances')
INSERT [dbo].[category_master] ([categoryId], [category_name]) VALUES (8, N'Travel Bag')
INSERT [dbo].[category_master] ([categoryId], [category_name]) VALUES (9, N'Footwear')
INSERT [dbo].[category_master] ([categoryId], [category_name]) VALUES (10, N'Travel Food')
INSERT [dbo].[category_master] ([categoryId], [category_name]) VALUES (11, N'personal care')
INSERT [dbo].[category_master] ([categoryId], [category_name]) VALUES (12, N'Toys&Baby')
INSERT [dbo].[category_master] ([categoryId], [category_name]) VALUES (13, N'Nutrition&more')
INSERT [dbo].[category_master] ([categoryId], [category_name]) VALUES (14, N'Flight&Hotels')
INSERT [dbo].[category_master] ([categoryId], [category_name]) VALUES (15, N'Bikes&Cars')
SET IDENTITY_INSERT [dbo].[category_master] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Master] ON 

INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (1, N'Samsung M15', 1)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (2, N'Vivo', 1)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (3, N'Poco', 1)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (4, N'Realme', 1)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (5, N'Apple', 1)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (6, N'Xiaomi', 1)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (7, N'Oppo', 1)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (8, N'Micromax', 1)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (9, N'Redmi 10', 1)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (10, N'Poco C 50', 1)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (11, N'Cases', 2)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (12, N'Anti-loss-devices', 2)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (13, N'phone charms', 2)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (14, N'Mass storage', 2)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (15, N'Chargers', 2)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (16, N'External Battery', 2)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (17, N'Photo accessories', 2)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (18, N'Selfie stick', 2)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (19, N'Cam cart', 2)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (20, N'USB charger', 2)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (21, N'Wireless neckban', 2)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (22, N'Earphones', 2)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (23, N'Apple MacBook Air', 3)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (24, N'Hp pavilion', 3)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (25, N'Lenovo Ideapad', 3)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (26, N'Elitebook', 3)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (27, N'Acer Aspire', 3)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (28, N'Lenovo Yoga', 3)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (29, N'ASUS', 3)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (30, N'Dell XPS', 3)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (31, N'VICTUS', 3)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (32, N'Honor MagicBook', 3)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (33, N'Xiaomi', 3)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (34, N'Acer Chromebook', 3)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (35, N'Vaio', 3)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (36, N'Asus VivoBook', 3)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (37, N'HP stream', 3)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (38, N'Xiaomi smart tv', 4)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (39, N'Xiaomi mi tv', 4)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (40, N'TCL  LED tv', 4)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (41, N'Thomson Alpha LED ', 4)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (42, N'Oneplus LED TV', 4)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (43, N'Haier Smart LED TV', 4)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (44, N'Kodak Smart TV', 4)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (45, N'Blaupinkt 40Sigma', 4)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (46, N'Motorola Revou TV', 4)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (47, N'Micromax Smart LED', 4)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (49, N'Food processor', 5)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (50, N'Microwave', 5)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (51, N'Blender', 5)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (52, N'Mixer', 5)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (53, N'Toaster', 5)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (54, N'Slow cooker', 5)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (55, N'Air fryer', 5)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (56, N'Cofee Maker', 5)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (57, N'Juicer', 5)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (58, N'Freezers', 6)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (59, N'washing machine', 6)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (60, N'Air condition', 6)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (61, N'Water heaters', 6)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (62, N'Refrigerators', 6)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (63, N'clothes dryers', 6)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (64, N'Computer', 7)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (65, N'Printer', 7)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (66, N'Paper shredder', 7)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (67, N'Photocopier', 7)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (68, N'Mouse', 7)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (69, N'Router', 7)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (70, N'Mouse pad', 7)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (71, N'Dictation machine', 7)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (72, N'American Tourister', 8)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (73, N'Samsonite', 8)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (74, N'Tumi Inc', 8)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (75, N'Skybags', 8)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (76, N'Safari', 8)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (77, N'Wildcraft', 8)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (78, N'Carlton', 8)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (79, N'Vip', 8)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (80, N'Gucci', 8)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (81, N'Eagle Creek', 8)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (82, N'Hartmann', 8)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (83, N'Sneakers', 9)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (84, N'Boot', 9)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (85, N'Shoes', 9)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (86, N'Sandal', 9)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (87, N'Loafer', 9)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (88, N'Platform shoe', 9)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (89, N'Chole Masala', 10)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (90, N'Paneer Bhurji', 10)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (91, N'Fruits', 10)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (92, N'Bread Dhokla', 10)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (93, N'Banana Chips', 10)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (94, N'Chakli', 10)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (95, N'Perfume', 11)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (96, N'Deodrant', 11)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (97, N'Sunscreen', 11)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (98, N'Toothpaste', 11)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (99, N'Cosmetics', 11)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (100, N'Baby Food', 12)
GO
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (101, N'Baby Lotion', 12)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (102, N'Baby oil', 12)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (103, N'Outdoors Toy', 12)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (104, N'Soft Toys', 12)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (105, N'Doraemon', 12)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (106, N'Nuts', 13)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (107, N'Cookies', 13)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (108, N'Food Combo', 13)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (109, N'Ghee', 13)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (110, N'Honey', 13)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (111, N'Tea', 13)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (112, N'Almonds', 13)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (113, N'Air India', 14)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (114, N'Indigo', 14)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (115, N'Vistara', 14)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (116, N'Airasia', 14)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (117, N'Helmet', 15)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (118, N'Engine Oils', 15)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (119, N'Car&bike Tyres', 15)
INSERT [dbo].[Product_Master] ([Product_Id], [Product_Name], [categoryId]) VALUES (120, N'Car Chargers', 15)
SET IDENTITY_INSERT [dbo].[Product_Master] OFF
GO

