-- product gender table 
create table product_Gender(
	product_gender_id int,
    gender_name varchar(20),
    -- This is the name of the  primary key constraint.
    constraint pk_productGender
    primary key(product_gender_id)
    
    
);
-- inserting data in to product_Gender table 
insert into product_Gender values(1,'WOMEN'),(2,'MEN');

-- fetching  product_Gender table values 
select * from product_Gender;






