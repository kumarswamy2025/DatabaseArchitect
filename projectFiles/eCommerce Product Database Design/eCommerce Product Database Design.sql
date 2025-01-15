-- product gender table 
create table
    product_Gender (
        product_gender_id int,
        gender_name varchar(20),
        -- This is the name of the  primary key constraint.
        constraint pk_productGender primary key (product_gender_id)
    );

-- inserting data in to product_Gender table 
insert into
    product_Gender
values
    (1, 'WOMEN'),
    (2, 'MEN');

-- fetching  product_Gender table values 
select
    *
from
    product_Gender;

-- creating product category table 
create table
    product_category (
        product_categoryId int,
        categoryName varchar(100),
        categoryImage varchar(600),
        productGenderId int,
        -- This is the name of the  primary key constraint.
        constraint pk_product_category primary key (product_categoryId),
        -- This is the name of the  foreign key constraint.
        constraint fk_productGenderId foreign key (productGenderId) references product_Gender (product_gender_id)
    );

-- inserting data to product_category table 
insert into
    product_category (
        product_categoryId,
        categoryName,
        categoryImage,
        productGenderId
    )
values
    (1, 'dress', 'image.png', 1),
    (2, 'coats', 'image.png', 1),
    (3, 'sports coart', 'image.png', 1),
    (4, 'gift', 'image.png', 1),
    (5, 'chudidar', 'image.png', 1),
    (6, 'sares ', 'image.png', 1),
    (7, 'jeans  ', 'image.png', 2),
    (8, 'formals  ', 'image.png', 2),
    (9, 'shirts ', 'image.png', 2),
    (11, 'pants ', 'image.png', 2),
    (12, 'boy shorts ', 'image.png', 2);

-- fetching all data from product_category
select
    *
from
    product_category;

-- fetching data by gender  wise if productGenderId=1 then it will be WOMEN and if productGenderId=2 then it will be MAN
select
    *
from
    product_category
where
    productGenderId = 1;

select
    *
from
    product_category
where
    productGenderId = 2;

-- creating product table 
create table
    product (
        productID int,
        productName varchar(300),
        orginalPrice int,
        salePrice int,
        productCategoryId int,
        -- This is the name of the  primary key constraint.
        constraint pk_productID primary key (productID),
        -- This is the name of the  foreign key constraint.
        constraint fk_productCategoryId foreign key (productCategoryId) references product_category (product_categoryId)
    );


--  inserting data in the product table 
insert into
    product (
        productID,
        productName,
        orginalPrice,
        salePrice,
        productCategoryId
    )
values
    (1, 'black jacket s', 1500, 1200, 7),
    (2, 'black jacket m', 1800, 1500, 7),
    (3, 'black jacket l', 1900, 1700, 7),
    (4, 'black jacket xl', 2000, 1800, 7),
    (5, 'black jacket xxl', 3000, 2500, 7),
    (6, 'black jacket xxl', 4000, 3500, 7),
    (7, 'red jacket s', 5000, 4500, 7),
    (8, 'black jacket m', 6000, 5500, 7),
    (9, 'black jacket l', 7000, 6500, 7),
    (10, 'black jacket lx', 8000, 7500, 7);

--  fetching data from the product
select
    *
from
    product;

-- creating product image table 
create table
    productImage (
        imageID int,
        productID int,
        imageFileName varchar(300),
        -- This is the name of the  primary key constraint.
        constraint pk_imageID primary key (imageID),
        -- This is the name of the  foreign key constraint.
        constraint fk_productID foreign key (productID) references product (productID)
    );

-- inserting data  into productImage
insert into
    productImage (imageID, productID, imageFileName)
values
    (1, 1, 'image1.png'),
    (2, 1, 'image1.png'),
    (3, 2, 'image1.png'),
    (4, 2, 'image1.png'),
    (5, 3, 'image1.png'),
    (6, 3, 'image1.png'),
    (7, 4, 'image1.png'),
    (8, 4, 'image1.png'),
    (9, 5, 'image1.png'),
    (10, 5, 'image1.png'),
    (11, 6, 'image1.png'),
    (12, 6, 'image1.png'),
    (13, 7, 'image1.png'),
    (14, 7, 'image1.png'),
    (15, 8, 'image1.png'),
    (16, 8, 'image1.png'),
    (17, 9, 'image1.png'),
    (18, 9, 'image1.png'),
    (19, 10, 'image1.png'),
    (20, 10, 'image1.png');
 
--  fetching data from productImage
select * from productImage;


--  inner join the product table and product category table 

select p.productID , p.productName,p.orginalPrice,p.salePrice from product p inner join product_category c  on p.productCategoryId=c.product_categoryId;




