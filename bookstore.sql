PRAGMA foreign_keys = TRUE; 

CREATE TABLE customers (
	cust_id  CHAR(5) NOT NULL,
	name	  VARCHAR(15) ,
	email 	  VARCHAR(30) ,
	street    VARCHAR(30) ,
	city 	  VARCHAR(20) ,
	postcode  VARCHAR(10),
	country   VARCHAR(30) ,
	PRIMARY KEY (cust_id));

CREATE TABLE cust_phone (
	cust_id CHAR(5) NOT NULL,
	phone_type 	CHAR(6),
	phone_number VARCHAR(13) NOT NULL,
	PRIMARY KEY (phone_number, cust_id, phone_type));

CREATE TABLE book (
	book_id   VARCHAR(17) NOT NULL,
	title  VARCHAR(30) NOT NULL,
	author VARCHAR(30),
	genre  VARCHAR(30),
	publisher VARCHAR(40),
	PRIMARY KEY (book_id));

 CREATE TABLE edition (
	edition INT,
 	book_id   VARCHAR(17) NOT NULL,
	edition_type VARCHAR(10),
	order_id CHAR(12) NOT NULL,
	price  NUMERIC(6,2),
	quantity_in_stock INT, 
	PRIMARY KEY (order_id, edition, edition_type),
	FOREIGN KEY (book_id) REFERENCES book);
	

CREATE TABLE supplier (
	supplier_id CHAR(7) NOT NULL,
	supplier_name VARCHAR(30) NOT NULL,
	account_number VARCHAR(15) NOT NULL,
	PRIMARY KEY (supplier_id));

CREATE TABLE orders(
	order_id CHAR(12),
	street VARCHAR(30),
	city VARCHAR(20),
	postcode VARCHAR(10),
	country VARCHAR(30),
	date_ordered DATE,
	date_delivered DATE,
	cust_id CHAR(5),
	PRIMARY KEY (order_id),
	FOREIGN KEY (cust_id) REFERENCES customers);
	
	
CREATE TABLE reviews(
	cust_id CHAR(5),
	book_id CHAR(17) NOT NULL,
	rating 	NUMERIC(2,2),
	PRIMARY KEY(cust_id book_id));
	
CREATE TABLE containing(
	order_id CHAR(12),
	edition INT,
	edition_type VARCHAR(10),
	amount INT,
	PRIMARY KEY(order_id, edition, edition_type, amount));
	
CREATE TABLE supplies(
	supplier_id CHAR(7),
	edition INT,
	supply_price NUMERIC(8,2),
	PRIMARY KEY(supplier_id, edition));


CREATE TABLE genre(
	genre_name VARCHAR(20) NOT NULL,
	book_id CHAR(5) NOT NULL,
	PRIMARY KEY (genre_name, book_id),
	FOREIGN KEY (book_id) REFERENCES book);

CREATE TABLE supplierphone(
	phone_number VARCHAR(13) NOT NULL,
	supplier_id CHAR(7),
	PRIMARY KEY (phone_number),
	FOREIGN KEY (supplier_id) REFERENCES supplier);

INSERT or REPLACE INTO book VALUES
	('1234456780', '50 SHADES OF GREY', 'E.L James', 'Novel', 'Vintage Books'),
	('431324325', 'Flight of Passage', 'Rinker Buck', 'Novel', 'Hachette Books'),
	('5453431642', 'Outliers', 'Malcom Gladwell', 'Non-fiction', 'Little,Brown and Company'),
	('789034567', 'Star Trek', 'Gene Roddenberry', 'Science Fiction', 'Bantam'),
	('123456432', 'The Bible', 'Kobe Bryant', 'Science Fiction', 'Ultimate Books'),
	('345628292', 'The Last Dance', 'Michael Jordan', 'Non-fiction', 'Ultimate Books'),
	('099233132', 'Introduction to SQL', 'Sean Dube', 'Science and Technology', 'Ultimate Books'),
	('123245325', 'Introducton to Data Analysis', 'Murray Irvine', 'Science and Technology', 'Ultimate Books'),
	('278456789', 'How to Play Football', 'Lionel Messi', 'Non-fiction', 'Bantam'),
	('234554241', 'How to fake SQL data', 'Sean Dube', 'Science and Technology', 'Ultimate Books'),
	('247897892', 'Wenger: My Life and Lessons in Red & White', 'Arsene Wenger', 'Autobiography', 'W&N'),
	('675433984', 'Behind EA Sports', 'Sean Dube', 'Detective Story', 'Ultimate Books'),
	('453902421', 'How did I end up in America?', 'Christopher Dube', 'Novel', 'Dube Mercantile'),
	('828236245', 'Burn the boats', 'Sean Dube', 'Novel', 'Dube Mercantile'),
	('343248972', 'Arsenal could do the double', 'Antonio Conte', 'Non-fiction', 'Ultimate Books'),
	('088767642', 'The Younger Brother', 'Kyle Dube', 'Novel', 'Dube Mercantile');


INSERT or REPLACE INTO customers 
VALUES ('12345', 'Saquon Barkley', 'sbarkley@standrews.co.uk', 'Giant Street', 'New York', '10001', 'United States of America'),
('12346', 'LeBron James', 'ljames@standrews.co.uk', 'Lakers Street', 'Los Angeles', '90001', 'United States of America'),
('12347', 'Reiss Nelson', 'rnelson@st.andrews.co.uk', 'Arsenal Street', 'Islington', 'N7 7AJ', 'United Kingdom'),
('12348', 'Liz Trust', 'ltrust@ukgov.co.uk', '10 Downing Street', 'London', 'SW1A 2AA', 'United Kingdom'),
('12349', 'Gabriel Jesus', 'gjesus@standrews.co.uk', 'Arsenal Street', 'Islington', 'N7 7AJ', 'United Kingdom'),
('12350', 'Kyrie Irving', 'kivring@bnets.com', 'Atlantic Avenue', 'Brooklyn', '11217', 'United States of America'),
('12351', 'Kevin Durant', 'kdurant@bnets.com', 'Atlantic Avenue', 'Brooklyn', '11217', 'United States of America'),
('12352', 'Mikel Arteta', 'marteta@standrews.co.uk', 'Arsenal Street', 'Islington', 'N7 7AJ', 'United Kingdom'),
('12353', 'Abou Diaby', 'injuryprone@hospital.co.uk', 'Arsenal Street', 'Islington', 'N7 7AJ', 'United Kingdom'),
('12354', 'Karim Benzema', 'kbenzema@madrid.eu', 'Ashton New Road', 'Manchester', 'M11 3FF', 'United Kingdom'),
('12355', 'King Henry', 'khenry@edinburgh.edu', 'Castlehill', 'Edinburgh', 'EH1 2NG', 'United Kingdom'),
('12356', 'Damon Pierce', 'dpierce@titans.edu', 'Castlehill', 'Edinburgh', 'EH1 2NG', 'United Kingdom'),
('12357', 'Barack Obama', 'boabama@goat.edu', '10 Route 59', 'Naperville', '60540', 'United States of America');

INSERT or REPLACE INTO  cust_phone
VALUES ('12345', 'Cell', '6304567890'),
('12346', 'Cell', '7653452290'),
('12347', 'Home', '02084565558'),
('12348', 'Cell', '02083133321'),
('12349', 'Home', '02085432241'),
('12350', 'Cell', '07932343243'),
('12351', 'Home', '02083454431'),
('12352', 'Cell', '07945673234'),
('12353', 'Home', '02089933123'),
('12354', 'Cell', '07824332231');

INSERT or REPLACE INTO  edition 
VALUES (2, '1234456780', 'Hardcover', '567999345667', 43.56, 10),
(5, '431324325', 'Paperback', '567777090945', 23.99, 3),
(4, '5453431642', 'Hardcover', '443565234123', 34.50, 7),
(3, '789034567', 'Audiobook', '22210004312', 45.90, 2),
(1, '123456432', 'Paperback', '4564323121', 78.50, 5),
(3, '345628292', 'Hardcover', '765532432', 67.90, 1),
(11, '099233132', 'Audiobook', '091231231', 23.50, 3),
(9, '123245325', 'Hardcover', '123212341', 49.99, 9),
(6, '278456789', 'Paperback', '323342123', 23.99, 9),
(7, '234554241', 'Audiobook', '395323411', 16.99, 3);

INSERT or REPLACE INTO  orders 
VALUES ('567999345667', 'Lakers Street', 'Los Angeles', '90001', 'United States of America', '2022-09-14', '2022-09-16', '12346'),
('56777709045', 'Giant Street', 'New York', '10001', 'United States of America', '2022-09-23', '2022-09-25', '12345'),
('443565234123', 'Arsenal Street', 'Islington', 'N7 7AJ', 'United Kingdom','2022-10-01', '2022-10-03', '12347'),
('22210004312', 'Ashton New Road', 'Manchester', 'M11 3FF', 'United Kingdom', '2022-10-03', '2022-10-05', '12354'),
('4564323121',  'Arsenal Street', 'Islington', 'N7 7AJ', 'United Kingdom', '2022-10-03', '2022-10-05', '12353'),
('765532432', 'Atlantic Avenue', 'Brooklyn', '11217', 'United States of America', '2022-10-05', '2022-10-07', '12350'),
('091231231',  '10 Downing Street', 'London', 'SW1A 2AA', 'United Kingdom', '2022-10-07', '2022-10-09', '12348'),
('123212341', 'Arsenal Street', 'Islington', 'N7 7AJ', 'United Kingdom', '2022-10-08', '2022-10-10', '12349'),
('323342123', 'Arsenal Street', 'Islington', 'N7 7AJ', 'United Kingdom', '2022-10-10', '2022-10-12', '12352'),
('395323411', 'Atlantic Avenue', 'Brooklyn', '11217', 'United States of America', '2022-10-12', '2022-10-14', '12351'),
('542342934', 'Castlehill', 'Edinburgh', 'EH1 2NG', 'United Kingdom', '2022-10-14', '2022-10-16', '12355'),
('234234231', 'Castlehill', 'Edinburgh', 'EH1 2NG', 'United Kingdom', '2022-10-15', '2022-10-17', '12355'),
('332443112', 'Castlehill', 'Edinburgh', 'EH1 2NG', 'United Kingdom', '2022-10-18', '2022-10-19', '12356');
INSERT or REPLACE INTO  reviews 
VALUES ('12346', '1234456780', 1),
('12345', '431324325', 4),
('12347', '5453431642', 5),
('12354', '789034567', 3),
('12353', '123456432', 2),
('12350', '345628292', 3),
('12348', '099233132', 5),
('12349', '123245325', 4),
('12352', '278456789', 3),
('12351', '234554241', 5);

INSERT or REPLACE INTO  genre 
VALUES ('Novel', '1234456780'),
('Novel', '431324325'),
('Non-Fiction', '5453431642'),
('Science Fiction', '789034567'),
('Science Fiction', '123456432'),
('Non-Fiction', '345628292'),
('Science and Technology', '099233132'),
('Science and Technology', '123245325'),
('Non-Fiction', '278456789'),
('Science and Technology', '234554241');

INSERT or REPLACE INTO  containing 
VALUES ('567999345667',2, 'Hardcover', 43.56),
('567777090945',5, 'Paper Cover', 23.99),
('443565234123',4, 'Hardcover', 34.50),
('22210004312',3, 'Audiobook', 45.90),
('4564323121',1,'Paperback', 78.50),
('765532432',3,'Hardcover', 67.90),
('091231231',11,'Audiobook', 23.50),
('123212341',9, 'Hardcover', 49.99),
('323342123',6, 'Paperback', 23.99),
('395323411',7, 'Audiobook', 16.99);

INSERT or REPLACE INTO  supplier 
VALUES ('7855322', 'Amazon', '4322216'),
('4567211', 'WHSMITH', '3845562'),
('6722344', 'Bobs Books', '8374321'),
('8231111', 'Gins Books', '321314'),
('5462422', 'Walmart', '452341'),
('1231233', 'Waterstones', '544131'),
('3423111', 'Barnes and Noble', '132132'),
('2313111', 'Argos', '1232322'),
('3413411', 'Marks and Spencer', '431312'),
('9090111', 'Big Lots', '942312');

INSERT or REPLACE INTO  supplierphone 
VALUES ('6304985621', '7855322'),
('02086921432', '4567211'),
('3016581234', '6722344'),
('3012413211', '8231111'),
('6302231091', '5462422'),
('02087431231', '1231233'),
('6304541321', '3423111'),
('02087113321', '2313111'),
('02089913341', '3413411'),
('6304562341', '9090111');

INSERT or REPLACE INTO  supplies 
VALUES ('7855322', 2, 43.56),
('4567211', 4, 34.50),
('6722344', 5, 23.99),
('8231111', 3, 45.90),
('5462422', 1, 78.50),
('1231233', 3, 67.90),
('3423111', 11, 23.50),
('2313111', 9, 49.99),
('3413411', 6, 23.99),
('9090111', 7, 16.99);


SELECT title FROM book
	WHERE publisher = 'Ultimate Books' AND genre = 'Science Fiction';

SELECT title, rating FROM book, reviews 
	WHERE genre = 'Science and Technology'
		ORDER BY rating DESC, title ;
	
SELECT order_id, city, date_ordered FROM orders 
WHERE city = 'Edinburgh' AND date_ordered >= '2020-01-01' ORDER BY date_ordered DESC;

SELECT DISTINCT edition, title, account_number, price FROM (SELECT * FROM book, supplier NATURAL JOIN edition)
	WHERE quantity_in_stock < 5;
		
SELECT edition_type, amount, date_ordered FROM (SELECT * FROM containing NATURAL JOIN orders);


SELECT SUM(amount) FROM(SELECT date_ordered, edition_type, amount, publisher FROM (SELECT * FROM orders, containing, edition NATURAL JOIN book)
	WHERE date_ordered >= '2020-01-01' AND edition_type = 'Audiobook') GROUP BY publisher;

SELECT cust_id, name, email FROM customers 
WHERE street = "Arsenal Street" ;

SELECT title, publisher, author FROM book
WHERE author LIKE '%S%';

SELECT book_id, quantity_in_stock FROM edition
	WHERE edition > 5 and price > 10.00;
	
CREATE VIEW book_total_inventory(edition, total_stock) AS
	SELECT edition_type, SUM(quantity_in_stock)
		FROM edition 
		GROUP BY edition_type;
		
CREATE VIEW supplierDetail AS
	SELECT supplier_id, supplier_name, phone_number FROM (SELECT * FROM supplier NATURAL JOIN supplierphone);