USE Lunch2Go
GO

IF OBJECT_ID('order_item') IS NOT NULL
DROP TABLE order_item

IF OBJECT_ID('order') IS NOT NULL
DROP TABLE [order]

IF OBJECT_ID('customer') IS NOT NULL
DROP TABLE customer

IF OBJECT_ID('product') IS NOT NULL
DROP TABLE product

IF OBJECT_ID('credit_card') IS NOT NULL
DROP TABLE credit_card

CREATE TABLE credit_card(
	card_id INT NOT NULL,
	card_type VARCHAR(30),

	CONSTRAINT cred_id_pk PRIMARY KEY(card_id)
)

CREATE TABLE product(
	product_id INT NOT NULL,
	name VARCHAR(50),
	[description] VARCHAR(150),
	category VARCHAR(50),
	price DECIMAL (5, 2),
	[image] VARCHAR(250),
	unit_measure VARCHAR(10),
	size VARCHAR(10)

	CONSTRAINT prod_id_pk PRIMARY KEY(product_id)
)

CREATE TABLE customer(
	customer_id INT NOT NULL,
	card_id INT NOT NULL,
	[password] VARCHAR(250) NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	phone_number INT,
	birthday DATETIME,
	email_notification TINYINT,
	sms_notification TINYINT,

	CONSTRAINT cust_id_pk PRIMARY KEY(customer_id),
	CONSTRAINT cust_id_fk FOREIGN KEY(card_id) REFERENCES credit_card(card_id)
)

CREATE TABLE [order](
	order_id INT NOT NULL,
	customer_id INT NOT NULL,
	order_date DATETIME NOT NULL,
	total_price DECIMAL(6,2) NOT NULL,
	delivery_time DATETIME NOT NULL,
	delivery_region VARCHAR(50) NOT NULL,
	delivery_street	VARCHAR(50) NOT NULL,

	CONSTRAINT order_id_pk PRIMARY KEY(order_id),
	CONSTRAINT order_id_fk FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
)

CREATE TABLE order_item(
	order_id INT NOT NULL,
	product_id INT NOT NULL,
	qty INT

	PRIMARY KEY(order_id, product_id)
	CONSTRAINT orditem_order_id_fk FOREIGN KEY(order_id) REFERENCES [order](order_id),
	CONSTRAINT orditem_product_id_fk FOREIGN KEY(product_id) REFERENCES product(product_id)
)
