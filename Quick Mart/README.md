# QuickMart Inventory Tracking System - PostgreSQL Tasks

This repository contains the complete SQL script and solutions for the QuickMart inventory management system database tasks, implemented using **PostgreSQL**.

---

## 📋 Scenario Context
**QuickMart** is a growing retail store. As a Junior Database Administrator, this project involves building, altering, and maintaining the store's product and inventory tracking system using PostgreSQL schema management, CRUD operations, constraints, and relational database design.

---

## 🛠️ Project Structure & Tasks

### Part 1: Low-Level Tasks (Basic Schema & CRUD)
* **Task 1.1: Schema Creation**
  * Created the `products` table with appropriate data types (`SERIAL`, `VARCHAR`, `NUMERIC(10,2)`, `INT`), primary key, unique constraints, and non-null rules.
* **Task 1.2: Data Insertion (CREATE)**
  * Inserted initial inventory records including products like *Wireless Mouse*, *Gaming Keyboard*, *USB-C Cable*, *HD Monitor*, and *Mechanical Pencil*.
* **Task 1.3: Data Filtering (READ)**
  * Wrote `SELECT` queries utilizing logical operators (`AND`, `OR`) for complex inventory filtering based on price and stock quantities.

### Part 2: Medium-Level Tasks (Alteration, Foreign Keys & Maintenance)
* **Task 2.1: Schema Alteration (ALTER & DROP)**
  * Added a mandatory `category` column with a default value to existing records using `ALTER TABLE`.
  * Dropped the obsolete `sku_code` column.
* **Task 2.2: Secondary Keys & Table Relationships**
  * Created a related `suppliers` table with a primary key (`supplier_id`).
  * Linked the `products` table to `suppliers` using a Foreign Key constraint (`supplier_id`).
* **Task 2.3: Maintenance Operations (UPDATE & DELETE)**
  * Executed bulk update operations to increase prices by 10% for items with high stock (`stock_quantity > 100`).
  * Performed clean-up operations to delete discontinued out-of-stock items under a specific price threshold.

---

## 🚀 How to Run the SQL Script

1. Open your PostgreSQL terminal (psql) or a tool like **pgAdmin**.
2. Create a new database for the project:
   ```sql
   CREATE DATABASE quickmart_db;
