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
    (1, 'dress','image.png',1),
    (2, 'coats','image.png',1),
    (3, 'sports coart','image.png',1),
    (4, 'gift','image.png',1),
    (5, 'chudidar','image.png',1),
    (6, 'sares ','image.png',1),
    (7, 'jeans  ','image.png',2),
    (8, 'formals  ','image.png',2),
    (9, 'shirts ','image.png',2),
    (11, 'pants ','image.png',2),
    (12, 'boy shorts ','image.png',2);
    
-- fetching all data from product_category

select *  from product_category;

-- fetching data by gender  wise if productGenderId=1 then it will be WOMEN and if productGenderId=2 then it will be MAN

select *  from product_category where productGenderId=1;