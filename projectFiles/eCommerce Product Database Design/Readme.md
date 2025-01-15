# ECommerce Product Database Design

This document outlines the schema, relationships, and operations for an eCommerce product database. The design includes tables for product categories, gender, products, images, colors, sizes, and product items.

---
## Entity-Relationship Diagram
![Entity-Relationship Diagram](ERDiagram.png)
## Tables and Queries

### 1. `product_Gender` Table
**Schema:**
```sql
CREATE TABLE product_Gender (
    product_gender_id INT,
    gender_name VARCHAR(20),
    CONSTRAINT pk_productGender PRIMARY KEY (product_gender_id)
);
```

**Insert Data:**
```sql
INSERT INTO product_Gender
VALUES
    (1, 'WOMEN'),
    (2, 'MEN');
```

**Fetch Data:**
```sql
SELECT * FROM product_Gender;
```

---

### 2. `product_category` Table
**Schema:**
```sql
CREATE TABLE product_category (
    product_categoryId INT,
    categoryName VARCHAR(100),
    categoryImage VARCHAR(600),
    productGenderId INT,
    CONSTRAINT pk_product_category PRIMARY KEY (product_categoryId),
    CONSTRAINT fk_productGenderId FOREIGN KEY (productGenderId) REFERENCES product_Gender (product_gender_id)
);
```

**Insert Data:**
```sql
INSERT INTO product_category (product_categoryId, categoryName, categoryImage, productGenderId)
VALUES
    (1, 'dress', 'image.png', 1),
    (2, 'coats', 'image.png', 1),
    (3, 'sports coat', 'image.png', 1),
    (4, 'gift', 'image.png', 1),
    (5, 'chudidar', 'image.png', 1),
    (6, 'sarees', 'image.png', 1),
    (7, 'jeans', 'image.png', 2),
    (8, 'formals', 'image.png', 2),
    (9, 'shirts', 'image.png', 2),
    (11, 'pants', 'image.png', 2),
    (12, 'boy shorts', 'image.png', 2);
```

**Fetch Data:**
```sql
SELECT * FROM product_category;
SELECT * FROM product_category WHERE productGenderId = 1;
SELECT * FROM product_category WHERE productGenderId = 2;
```

---

### 3. `product` Table
**Schema:**
```sql
CREATE TABLE product (
    productID INT,
    productName VARCHAR(300),
    orginalPrice INT,
    salePrice INT,
    productCategoryId INT,
    CONSTRAINT pk_productID PRIMARY KEY (productID),
    CONSTRAINT fk_productCategoryId FOREIGN KEY (productCategoryId) REFERENCES product_category (product_categoryId)
);
```

**Insert Data:**
```sql
INSERT INTO product (productID, productName, orginalPrice, salePrice, productCategoryId)
VALUES
    (1, 'black jacket s', 1500, 1200, 7),
    (2, 'black jacket m', 1800, 1500, 7),
    (3, 'black jacket l', 1900, 1700, 7),
    (4, 'black jacket xl', 2000, 1800, 7),
    (5, 'black jacket xxl', 3000, 2500, 7);
```

**Fetch Data:**
```sql
SELECT * FROM product;
```

---

### 4. `productImage` Table
**Schema:**
```sql
CREATE TABLE productImage (
    imageID INT,
    productID INT,
    imageFileName VARCHAR(300),
    CONSTRAINT pk_imageID PRIMARY KEY (imageID),
    CONSTRAINT fk_productID FOREIGN KEY (productID) REFERENCES product (productID)
);
```

**Insert Data:**
```sql
INSERT INTO productImage (imageID, productID, imageFileName)
VALUES
    (1, 1, 'image1.png'),
    (2, 1, 'image1.png');
```

**Fetch Data:**
```sql
SELECT * FROM productImage;
```

---

### 5. `color` Table
**Schema:**
```sql
CREATE TABLE color (
    colorID INT,
    colorName VARCHAR(300),
    CONSTRAINT pk_colorID PRIMARY KEY (colorID)
);
```

**Insert Data:**
```sql
INSERT INTO color (colorID, colorName)
VALUES
    (1, 'green'),
    (2, 'red'),
    (3, 'blue'),
    (4, 'yellow'),
    (5, 'pink');
```

---

### 6. `productItem` Table
**Schema:**
```sql
CREATE TABLE productItem (
    productyItemID INT,
    productID INT,
    colorID INT,
    originalPrice INT,
    salePrice INT,
    CONSTRAINT pk_productyItemID PRIMARY KEY (productyItemID),
    CONSTRAINT fk_productID2 FOREIGN KEY (productID) REFERENCES product (productID),
    CONSTRAINT fk_colorID FOREIGN KEY (colorID) REFERENCES color (colorID)
);
```

**Insert Data:**
```sql
INSERT INTO productItem (productyItemID, productID, colorID, originalPrice, salePrice)
VALUES
    (1, 1, 1, 1200, 1000),
    (2, 1, 2, 2500, 1800);
```

---

### 7. `sizeTable` Table
**Schema:**
```sql
CREATE TABLE sizeTable (
    sizeID INT,
    sizeName VARCHAR(200),
    sortOrder INT,
    CONSTRAINT pk_sizeID PRIMARY KEY (sizeID)
);
```

**Insert Data:**
```sql
INSERT INTO sizeTable (sizeID, sizeName, sortOrder)
VALUES
    (1, 's', 1),
    (2, 'm', 2);
```

**Alterations:**
```sql
ALTER TABLE productItem ADD COLUMN sizeID INT;
ALTER TABLE productItem ADD CONSTRAINT fk_sizeID FOREIGN KEY (sizeID) REFERENCES sizeTable (sizeID);
ALTER TABLE productItem ADD COLUMN stock_qty INT;
UPDATE productItem SET stock_qty = 50, sizeID = 1;
```

---

## Joins and Queries

**Inner Join:**
```sql
SELECT
    p.productID,
    p.productName,
    p.orginalPrice,
    p.salePrice,
    p.productCategoryId,
    c.product_categoryId
FROM
    product p
    INNER JOIN product_category c ON c.product_categoryId = p.productCategoryId;
```

---

This concludes the eCommerce product database design with SQL queries.
