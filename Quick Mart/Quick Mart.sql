CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    sku_code VARCHAR(20) UNIQUE NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    stock_quantity INT NOT NULL);

**Task 1: Data Insertion**

INSERT INTO products (product_name, sku_code, price, stock_quantity) VALUES
('Wireless Mouse', 'SKU-101', 25.50, 120),
('Gaming Keyboard', 'SKU-102', 85.00, 45),
('USB-C Cable', 'SKU-103', 12.00, 250),
('HD Monitor', 'SKU-104', 199.99, 15),
('Mechanical Pencil', 'SKU-105', 3.50, 0);

**Task 2: Data Filtering (READ)**
** Find all products where the price is greater than 50.00 AND stock_quantity is less than 100.

  SELECT * FROM products 
  WHERE price > 50.00 AND stock_quantity < 100;

** Find all products where price is less than 20.00 OR stock_quantity is greater than 200
  SELECT * FROM products 
  WHERE price < 20.00 OR stock_quantity > 200;

**Tasks (Alteration, Foreign Keys & Maintenance)**

**Task 3: Schema Alteration - ALTER & DROP**

1. Add the `category` column with a default value to safely populate existing records
   ALTER TABLE products 
   ADD COLUMN category VARCHAR(50) NOT NULL DEFAULT 'Uncategorized';

2. Drop the `sku_code` column:

   ALTER TABLE products 
   DROP COLUMN sku_code;

**Task 4: Secondary Keys & Table Relationships**

1. Create the `suppliers` table:

   CREATE TABLE suppliers (
       supplier_id SERIAL PRIMARY KEY,
       supplier_name VARCHAR(100) NOT NULL);

2. Add the foreign key reference to the `products` table:

   ALTER TABLE products 
   ADD COLUMN supplier_id INT,
   ADD CONSTRAINT fk_supplier 
       FOREIGN KEY (supplier_id) 
       REFERENCES suppliers(supplier_id);

**Task 5: Maintenance Operations (UPDATE & DELETE)**

1. **UPDATE:** Increase the price by 10% for products where 
     `stock_quantity` is greater than 100.
   UPDATE products SET price = price * 1.10 
   WHERE stock_quantity > 100;

2. **DELETE:** Remove out-of-stock items where price is less than 10.00.

   DELETE FROM products 
   WHERE stock_quantity = 0 AND price < 10.00;