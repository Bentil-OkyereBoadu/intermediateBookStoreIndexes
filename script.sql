SELECT * FROM customers LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM books LIMIT 10;

SELECT * FROM pg_Indexes WHERE tablename = 'customers';
SELECT * FROM pg_Indexes WHERE tablename = 'books';
SELECT * FROM pg_Indexes WHERE tablename = 'orders';

EXPLAIN ANALYZE  SELECT customer_id, quantity FROM orders WHERE quantity > 18;

CREATE INDEX customer_id_quantity_idx ON orders(customer_id, quantity > 18);

EXPLAIN ANALYZE  SELECT customer_id, quantity FROM orders WHERE quantity > 18;

EXPLAIN ANALYZE SELECT * FROM customers WHERE customer_id = 67569;

ALTER TABLE customers 
ADD PRIMARY KEY (customer_id);

EXPLAIN ANALYZE SELECT * FROM customers WHERE customer_id = 67569;

CREATE INDEX customer_id_idx ON customers(customer_id);
CLUSTER customers USING customer_id_idx;
SELECT * FROM customers LIMIT 10;

CREATE INDEX books_author_books_title_idx ON books(books_author, books_title);

EXPLAIN ANALYZE SELECT * FROM orders WHERE (quantity * price_base) > 100;

CREATE INDEX calc_total_price_idx ON orders ((quantity * price_base)> 100);

EXPLAIN ANALYZE SELECT * FROM orders WHERE (quantity * price_base) > 100;
