
USE stormrider;


-- Products_and_groups
-- -----------------------------------------------------------------------------------------------------

-- TRUNCATE variable_type;
INSERT INTO variable_type VALUES
(1),
(2),
(3),
(4),
(5);

-- TRUNCATE variable;
INSERT INTO variable VALUES 
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 3),
(8, 3),
(9, 3),
(10, 4),
(11, 4),
(12, 4),
(13, 5),
(14, 5);

-- TRUNCATE category;
INSERT INTO category VALUES
(1),
(2);

-- TRUNCATE subcategory;
INSERT INTO subcategory VALUES
(1),
(2),
(3);

-- TRUNCATE subcategory_has_category;
INSERT INTO subcategory_has_category VALUES
(1, 1),
(2, 1),
(3, 2);

-- TRUNCATE product_image;
INSERT INTO product_group_image VALUES
(1, 'saddle1.png', 'Saddle 1'),
(2, 'saddle2.jpg', 'Saddle 2'),
(3, 'bridle.png', 'Bridle'),
(4, 'horseshoes.jpg', 'Horseshoes');

-- TRUNCATE product_group;
INSERT INTO product_group VALUES
(1, 1, 1000, 100),
(2, 2, 1500, 150),
(3, 3, 500, 50),
(4, 4, 700, 70);

-- TRUNCATE product_group_has_subcategory;
INSERT INTO product_group_has_subcategory VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3);

-- TRUNCATE product;
INSERT INTO product VALUES
(1, 10, 1, '2020-12-11'),
(2, 15, 1, '2020-11-10'),
(3, 5, 1, '2020-10-09'),
(4, 12, 1, '2020-09-08'),
(5, 7, 2, '2020-08-07'),
(6, 11, 2, '2020-07-06'),
(7, 21, 3, '2020-06-05'),
(8, 3, 4, '2020-05-04');

-- TRUNCATE product_image;
INSERT INTO product_image VALUES
(1, 1, 'saddle1-black-wool.png', 'Saddle 1, color - black, filling - wool'),
(2, 2, 'saddle1-black-foam.png', 'Saddle 1, color - black, filling - foam'),
(3, 3, 'saddle1-brown-wool.png', 'Saddle 1, color - brown, filling - wool'),
(4, 4, 'saddle1-brown-foam.png', 'Saddle 1, color - brown, filling - foam'),
(5, 5, 'saddle2-16.png', 'Saddle 1, size - 16 inches'),
(6, 6, 'saddle2-16,5.png', 'Saddle 1, size - 16,5 inches'),
(7, 7, 'bridle.png', 'Bridle'),
(8, 8, 'horseshoes.jpg', 'Horseshoes');

-- TRUNCATE product_has_variable;
INSERT INTO product_has_variable VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(1, 12),
(2, 12),
(3, 12),
(4, 12),
(1, 7),
(2, 7),
(3, 9),
(4, 9),
(1, 13),
(3, 13),
(2, 14),
(4, 14),
(5, 2),
(6, 3),
(5, 12),
(6, 12),
(5, 7),
(6, 7),
(5, 13),
(6, 13),
(7, 4),
(7, 7),
(7, 12),
(8, 8),
(8, 12);


-- Language_Selection 
-- -----------------------------------------------------------------------------------------------------

-- TRUNCATE app_language;
INSERT INTO app_language VALUES
('en', 'English'),
('is', 'Icelandic');

-- TRUNCATE variable_type_language;
INSERT INTO variable_type_language VALUES
(1, 'en', 'Size (inches)', 'Measure in inches', 1),
(2, 'is', 'Inchinch', 'Bulbulbul inches', 1),
(3, 'en', 'Size (EU)', 'European sizes (from XS to XXL)', 2),
(4, 'is', 'Euroeuro', 'Bulbulbul european (XS-XXL)', 2),
(5, 'en', 'Color', 'Color of the product', 3),
(6, 'is', 'Colcolor', 'Bulbulbul color', 3),
(7, 'en', 'Gender', 'Gender of the product', 4),
(8, 'is', 'Gendgend', 'Bulbulbul gender', 4),
(9, 'en', 'Filling', 'Filling of the product', 5),
(10, 'is', 'Fillfill', 'Bulbulbul filling', 5);

-- TRUNCATE variable_language;
INSERT INTO variable_language VALUES 
(1, 'en', '15', '15-inch', 1),
(2, 'is', '15', '15-inch (is)', 1),
(3, 'en', '16', '16-inch', 2),
(4, 'is', '16', '16-inch (is)', 2),
(5, 'en', '16,5', '16,5-inch', 3),
(6, 'is', '16,5', '16,5-inch (is)', 3),
(7, 'en', 'S', 'Size S', 4),
(8, 'is', 'S', 'Size S (is)', 4),
(9, 'en', 'M', 'Size M', 5),
(10, 'is', 'M', 'Size M (is)', 5),
(11, 'en', 'L', 'Size L', 6),
(12, 'is', 'L', 'Size L (is)', 6),
(13, 'en', 'Black', 'Black color', 7),
(14, 'is', 'Black', 'Black (is)', 7),
(15, 'en', 'Silver', 'Silver color', 8),
(16, 'is', 'Silver', 'Silver (is)', 8),
(17, 'en', 'Brown', 'Brown color', 9),
(18, 'is', 'Brown', 'Brown (is)', 9),
(19, 'en', 'Female', 'Female gender', 10),
(20, 'is', 'Female', 'Female (is)', 10),
(21, 'en', 'Male', 'Male gender', 11),
(22, 'is', 'Male', 'Male (is)', 11),
(23, 'en', 'Unisex', 'Unisex gender', 12),
(24, 'is', 'Unisex', 'Unisex (is)', 12),
(25, 'en', 'Wool', 'Wool filling', 13),
(26, 'is', 'Wool', 'Wool (is)', 13),
(27, 'en', 'Foam', 'Foam filling', 14),
(28, 'is', 'Foam', 'Foam (is)', 14);

-- TRUNCATE category_language;
INSERT INTO category_language VALUES
(1, 'en', 1, 'Riding Gear'),
(2, 'is', 1, 'Riding Gear (is)'),
(3, 'en', 2, 'Metal Equipment'),
(4, 'is', 2, 'Metal Equipment (is)');

-- TRUNCATE subcategory_language;
INSERT INTO subcategory_language VALUES
(1, 'en', 1, 'Saddles'),
(2, 'is', 1, 'Saddles (is)'),
(3, 'en', 2, 'Bridles'),
(4, 'is', 2, 'Bridles (is)'),
(5, 'en', 3, 'Horseshoes'),
(6, 'is', 3, 'Horseshoes (is)');

-- TRUNCATE product_group_language;
INSERT INTO product_group_language VALUES
(1, 'en', 1, 'Saddle #1', 'Very nice saddle #1'),
(2, 'is', 1, 'Bulbul saddle #1', 'Bulbulbul saddle #1'),
(3, 'en', 2, 'Saddle #2', 'Very nice saddle #2'),
(4, 'is', 2, 'Bulbul saddle #2', 'Bulbulbul saddle #2'),
(5, 'en', 3, 'Bridle', 'Very nice bridle'),
(6, 'is', 3, 'Bulbul bridle', 'Bulbulbul bridle'),
(7, 'en', 4, 'Horseshoes', 'Very nice horseshoes'),
(8, 'is', 4, 'Bulbul horseshoes', 'Bulbulbul horseshoes');


-- Vouchers_Discounts 
-- -----------------------------------------------------------------------------------------------------

-- TRUNCATE voucher;
INSERT INTO voucher VALUES
(1, 'AGT2OU8', '2020-11-01', '2020-11-30', 3, 10, 0, 'Voucher for Saddles only', 10, 1),
(2, 'SUMMER2020', '2020-06-01', '2020-08-31', 10, 50, 0, 'Voucher for Summer', 15, 0);

-- TRUNCATE voucher_has_group;
INSERT INTO voucher_has_group VALUES
(1, NULL, NULL, NULL, 1, 1),
(2, NULL, NULL, NULL, 2, 1),
(3, NULL, NULL, 1, NULL, 2);


-- Cart_payment_shippment 
-- -----------------------------------------------------------------------------------------------------alter

-- TRUNCATE address;
INSERT INTO address VALUES 
(1, 'Address a', '1111', 'City a', 'Country a', 'County a'),
(2, 'Address b', '2222', 'City b', 'Country b', 'County b'),
(3, 'Address c', '3333', 'City c', 'Country c', 'County c');

-- TRUNCATE customer;
INSERT INTO customer VALUES
(1, 'John', 'Smith', 'john.smith@gmail.com', '+45 65 78 34 12', NULL, NULL),
(2, 'Caren', 'Jones', 'caren.jones@company.com', '34343434', '0000000000', 'Company'),
(3, 'Thomas', 'Collins', 'tcollins@yahoo.com', '+4567328132', NULL, NULL);

-- TRUNCATE cart;
INSERT INTO cart VALUES
(1, 'processed', 2700, 270, 0, 1, 1, 1, '2020-10-10', NULL, 'AHRT563OSHF3'); 

-- TRUNCATE cart_has_products;
INSERT INTO cart_has_products VALUES
(1, 1, 2, 1),
(2, 8, 1, 1); 

-- TRUNCATE invoice;
INSERT INTO invoice VALUES
(1, '2020-10-10', 1, 'shipped', 'mastercard', 1);

-- TRUNCATE receipt;
INSERT INTO receipt VALUES
(1, 'Receipt for order', 1);


-- Admin_backend 
-- -----------------------------------------------------------------------------------------------------

-- TRUNCATE admin;
INSERT INTO admin VALUES
(1, 'admin', '1234', 'admin@dummy.com');

-- TRUNCATE product_order;
INSERT INTO product_order VALUES
(1, 'received', 1, 500, 10, 10, 100, '2020-08-06', '2020-08-20', 'Order of black saddles with wool filling', 'ESG435346HD');