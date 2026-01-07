# sql-final-project
The goal of this project is to use SQL to explore and extract insights from data in a database. Made for a final project.

## About the Data
The datasets I used in my database came from Kaggle user [siddharth0935](https://www.kaggle.com/datasets/siddharth0935/toy-store-e-commerce-database) and contains data about the sales of a fictional toy e-commerce store.

There are 4 tables in the database:
* orders
  * PK: order_id
  * FK: primary_product_id
* order_items
  * PK: order_item_id
  * FK: order_id, product_id
* order_item_refunds
  * PK: order_item_refund_id
  * FK: order_item_id, order_id
* products
  * PK: product_id

## Summary of Findings
The questions I used to guide my queries (questions are included as comments in the code):
* How many items are usually purchased in an order?
* What items are most frequently refunded?
* What is the profit made on each item sold?
* What months have the highest revenue?
* What percentage of total orders are refunded?

### How many items are usually purchased in an order?
I used the orders table and grouped by items_purchased to find the most frequent number of items ordered. The output showed that most customers order one item at a time. This insight could be used to create incentives to buy more than one item in an order. 

### What items are most frequently refunded?
I joined multiple tables to be able to count the frequency of items being refunded as well as the product_id and product_name. The output showed that The Original Mr. Fuzzy is the most refunded item by far. This could mean that the company should make changes to the product in order to reduce refunds.

### What is the profit made on each item sold?
I subtracted the cogs_usd column from the price_usd column to create a profit_usd column. Then I grouped the results by product to show the profit made on each individual item. The Forever Love Bear is the most profitable item. This makes sense because it is also the most expensive item sold. 

### What months have the highest revenue?
I extracted the year and month from the created_at column and took the sum of the price_usd column as revnue_per_month. I then grouped the results by year and month to show the revenue earned each month. The output showed the monthly revenue has grown over the past 2 years. This is a sign that the company is moving in the right direction. It also revealed a pattern of revenue dropping after December each year. This is expected because Christmas affects consumer habits.

### What percentage of total orders are refunded?
I used a Common Table Expression (CTE) create a count of how many items are refunded. Then I divided that number by the count of total orders and converted it to a percentage. The output showed a 5.4% refunded rate. This is a very good rate for e-commerce. The company should try to keep a low refund rate.
