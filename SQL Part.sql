CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;
SHOW DATABASES;

-- Creating Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    gender VARCHAR(10),
    registration_date DATE
);

-- ================================================================================================================================================================================
-- Creating Addresses Table
CREATE TABLE Addresses (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    address_type VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10),
    country VARCHAR(50),

    CONSTRAINT fk_address_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);
SHOW TABLES;
-- ================================================================================================================================================================================
-- Creating Categories Table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255)
);

-- Creating Suppliers Table
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

-- ================================================================================================================================================================================
-- Creating Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    supplier_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    product_rating DECIMAL(3,2),
    product_status VARCHAR(20),

    CONSTRAINT fk_product_category
        FOREIGN KEY (category_id)
        REFERENCES Categories(category_id),

    CONSTRAINT fk_product_supplier
        FOREIGN KEY (supplier_id)
        REFERENCES Suppliers(supplier_id)
);
-- ================================================================================================================================================================================

-- Creating Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(30) NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL,

    CONSTRAINT fk_order_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);
-- ===========================================================================================================================================================================
-- Creating Order_Details Table
CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    discount DECIMAL(10,2) DEFAULT 0,

    CONSTRAINT fk_orderdetail_order
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),

    CONSTRAINT fk_orderdetail_product
        FOREIGN KEY (product_id)
        REFERENCES Products(product_id)
);
-- ===========================================================================================================================================================================
-- Creating Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_date DATE,
    payment_method VARCHAR(30),
    payment_status VARCHAR(30),
    amount DECIMAL(12,2),

    CONSTRAINT fk_payment_order
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
);
-- ===========================================================================================================================================================================
-- Creating Shipping Table
CREATE TABLE Shipping (
    shipping_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    shipping_date DATE,
    delivery_date DATE,
    shipping_method VARCHAR(30),
    shipping_status VARCHAR(30),
    shipping_cost DECIMAL(10,2),

    CONSTRAINT fk_shipping_order
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
);

-- ===========================================================================================================================================================================
-- Checking the count number
SELECT COUNT(*) AS customer_count FROM Customers;
SELECT COUNT(*) AS address_count FROM Addresses;
-- ===========================================================================================================================================================================
-- Checking the count of Rows
SELECT COUNT(*) AS total_customers
FROM Customers;
-- ===========================================================================================================================================================================
-- Usually used Commands
SELECT 'Customers' AS table_name, COUNT(*) AS row_count FROM Customers
UNION ALL
SELECT 'Addresses', COUNT(*) FROM Addresses
UNION ALL
SELECT 'Categories', COUNT(*) FROM Categories
UNION ALL
SELECT 'Suppliers', COUNT(*) FROM Suppliers
UNION ALL
SELECT 'Products', COUNT(*) FROM Products
UNION ALL
SELECT 'Orders', COUNT(*) FROM Orders
UNION ALL
SELECT 'Order_Details', COUNT(*) FROM Order_Details
UNION ALL
SELECT 'Payments', COUNT(*) FROM Payments
UNION ALL
SELECT 'Shipping', COUNT(*) FROM Shipping;
-- ===========================================================================================================================================================================
-- Usually used Commands
SELECT COUNT(*) AS customer_count
FROM Customers;

-- ===========================================================================================================================================================================
-- Inserting the values of Custumers Table
INSERT INTO Customers
(first_name, last_name, email, phone, gender, registration_date)
VALUES
('Aarav','Sharma','aarav.sharma001@gmail.com','9876500001','Male','2024-01-05'),
('Ananya','Reddy','ananya.reddy002@gmail.com','9876500002','Female','2024-01-12'),
('Rohan','Mehta','rohan.mehta003@gmail.com','9876500003','Male','2024-01-20'),
('Sneha','Patel','sneha.patel004@gmail.com','9876500004','Female','2024-01-28'),
('Arjun','Kumar','arjun.kumar005@gmail.com','9876500005','Male','2024-02-05'),
('Priya','Nair','priya.nair006@gmail.com','9876500006','Female','2024-02-13'),
('Rahul','Verma','rahul.verma007@gmail.com','9876500007','Male','2024-02-21'),
('Kavya','Rao','kavya.rao008@gmail.com','9876500008','Female','2024-02-29'),
('Aditya','Singh','aditya.singh009@gmail.com','9876500009','Male','2024-03-08'),
('Neha','Gupta','neha.gupta010@gmail.com','9876500010','Female','2024-03-16'),
('Vikram','Joshi','vikram.joshi011@gmail.com','9876500011','Male','2024-03-24'),
('Divya','Iyer','divya.iyer012@gmail.com','9876500012','Female','2024-04-01'),
('Karthik','Menon','karthik.menon013@gmail.com','9876500013','Male','2024-04-09'),
('Pooja','Shah','pooja.shah014@gmail.com','9876500014','Female','2024-04-17'),
('Siddharth','Kapoor','siddharth.kapoor015@gmail.com','9876500015','Male','2024-04-25'),
('Meera','Krishnan','meera.krishnan016@gmail.com','9876500016','Female','2024-05-03'),
('Nikhil','Malhotra','nikhil.malhotra017@gmail.com','9876500017','Male','2024-05-11'),
('Ishita','Desai','ishita.desai018@gmail.com','9876500018','Female','2024-05-19'),
('Varun','Bhat','varun.bhat019@gmail.com','9876500019','Male','2024-05-27'),
('Shreya','Agarwal','shreya.agarwal020@gmail.com','9876500020','Female','2024-06-04'),
('Manish','Chopra','manish.chopra021@gmail.com','9876500021','Male','2024-06-12'),
('Riya','Saxena','riya.saxena022@gmail.com','9876500022','Female','2024-06-20'),
('Abhishek','Mishra','abhishek.mishra023@gmail.com','9876500023','Male','2024-06-28'),
('Nandini','Rao','nandini.rao024@gmail.com','9876500024','Female','2024-07-06'),
('Suresh','Reddy','suresh.reddy025@gmail.com','9876500025','Male','2024-07-14'),
('Aditi','Kulkarni','aditi.kulkarni026@gmail.com','9876500026','Female','2024-07-22'),
('Harish','Yadav','harish.yadav027@gmail.com','9876500027','Male','2024-07-30'),
('Tanvi','Jain','tanvi.jain028@gmail.com','9876500028','Female','2024-08-07'),
('Rakesh','Naidu','rakesh.naidu029@gmail.com','9876500029','Male','2024-08-15'),
('Swati','Mishra','swati.mishra030@gmail.com','9876500030','Female','2024-08-23'),
('Akash','Pandey','akash.pandey031@gmail.com','9876500031','Male','2024-08-31'),
('Lakshmi','Krishna','lakshmi.krishna032@gmail.com','9876500032','Female','2024-09-08'),
('Rohit','Saini','rohit.saini033@gmail.com','9876500033','Male','2024-09-16'),
('Deepika','Rao','deepika.rao034@gmail.com','9876500034','Female','2024-09-24'),
('Vivek','Goyal','vivek.goyal035@gmail.com','9876500035','Male','2024-10-02'),
('Harini','Reddy','harini.reddy036@gmail.com','9876500036','Female','2024-10-10'),
('Sanjay','Kumar','sanjay.kumar037@gmail.com','9876500037','Male','2024-10-18'),
('Madhuri','Patel','madhuri.patel038@gmail.com','9876500038','Female','2024-10-26'),
('Yash','Sharma','yash.sharma039@gmail.com','9876500039','Male','2024-11-03'),
('Pallavi','Nair','pallavi.nair040@gmail.com','9876500040','Female','2024-11-11'),
('Mohit','Bansal','mohit.bansal041@gmail.com','9876500041','Male','2024-11-19'),
('Keerthi','Iyer','keerthi.iyer042@gmail.com','9876500042','Female','2024-11-27'),
('Tarun','Rao','tarun.rao043@gmail.com','9876500043','Male','2024-12-05'),
('Nisha','Gupta','nisha.gupta044@gmail.com','9876500044','Female','2024-12-13'),
('Sahil','Arora','sahil.arora045@gmail.com','9876500045','Male','2024-12-21'),
('Komal','Verma','komal.verma046@gmail.com','9876500046','Female','2024-12-29'),
('Dev','Choudhary','dev.choudhary047@gmail.com','9876500047','Male','2025-01-06'),
('Bhavana','Reddy','bhavana.reddy048@gmail.com','9876500048','Female','2025-01-14'),
('Ajay','Shetty','ajay.shetty049@gmail.com','9876500049','Male','2025-01-22'),
('Sonia','Mehta','sonia.mehta050@gmail.com','9876500050','Female','2025-01-30'),
('Ishaan','Kapoor','ishaan.kapoor051@gmail.com','9876500051','Male','2025-02-07'),
('Aishwarya','Rao','aishwarya.rao052@gmail.com','9876500052','Female','2025-02-15'),
('Kunal','Aggarwal','kunal.aggarwal053@gmail.com','9876500053','Male','2025-02-23'),
('Isha','Rathore','isha.rathore054@gmail.com','9876500054','Female','2025-03-03'),
('Tarun','Chauhan','tarun.chauhan055@gmail.com','9876500055','Male','2025-03-11'),
('Muskan','Sethi','muskan.sethi056@gmail.com','9876500056','Female','2025-03-19'),
('Rajat','Ahuja','rajat.ahuja057@gmail.com','9876500057','Male','2025-03-27'),
('Payal','Goyal','payal.goyal058@gmail.com','9876500058','Female','2025-04-04'),
('Ankit','Soni','ankit.soni059@gmail.com','9876500059','Male','2025-04-12'),
('Kritika','Jha','kritika.jha060@gmail.com','9876500060','Female','2025-04-20'),
('Aman','Bhardwaj','aman.bhardwaj061@gmail.com','9876500061','Male','2025-04-28'),
('Pavithra','Rao','pavithra.rao062@gmail.com','9876500062','Female','2025-05-06'),
('Rakesh','Pawar','rakesh.pawar063@gmail.com','9876500063','Male','2025-05-14'),
('Nandini','Mishra','nandini.mishra064@gmail.com','9876500064','Female','2025-05-22'),
('Harsh','Vyas','harsh.vyas065@gmail.com','9876500065','Male','2025-05-30'),
('Sonal','Sharma','sonal.sharma066@gmail.com','9876500066','Female','2025-06-07'),
('Varun','Joshi','varun.joshi067@gmail.com','9876500067','Male','2025-06-15'),
('Priti','Kulkarni','priti.kulkarni068@gmail.com','9876500068','Female','2025-06-23'),
('Sahil','Verma','sahil.verma069@gmail.com','9876500069','Male','2025-07-01'),
('Radhika','Menon','radhika.menon070@gmail.com','9876500070','Female','2025-07-09'),
('Ayush','Saxena','ayush.saxena071@gmail.com','9876500071','Male','2025-07-17'),
('Preeti','Shah','preeti.shah072@gmail.com','9876500072','Female','2025-07-25'),
('Vishal','Bhatia','vishal.bhatia073@gmail.com','9876500073','Male','2025-08-02'),
('Renu','Kaur','renu.kaur074@gmail.com','9876500074','Female','2025-08-10'),
('Sanjay','Reddy','sanjay.reddy075@gmail.com','9876500075','Male','2025-08-18'),
('Chaitra','Shetty','chaitra.shetty076@gmail.com','9876500076','Female','2025-08-26'),
('Nitin','Yadav','nitin.yadav077@gmail.com','9876500077','Male','2025-09-03'),
('Keerthi','Rajan','keerthi.rajan078@gmail.com','9876500078','Female','2025-09-11'),
('Ravi','Kumar','ravi.kumar079@gmail.com','9876500079','Male','2025-09-19'),
('Shalini','Das','shalini.das080@gmail.com','9876500080','Female','2025-09-27'),
('Naveen','Patel','naveen.patel081@gmail.com','9876500081','Male','2025-10-05'),
('Jyothi','Naidu','jyothi.naidu082@gmail.com','9876500082','Female','2025-10-13'),
('Manoj','Iyer','manoj.iyer083@gmail.com','9876500083','Male','2025-10-21'),
('Sowmya','Reddy','sowmya.reddy084@gmail.com','9876500084','Female','2025-10-29'),
('Karthik','Rao','karthik.rao085@gmail.com','9876500085','Male','2025-11-06'),
('Archana','Pillai','archana.pillai086@gmail.com','9876500086','Female','2025-11-14'),
('Dinesh','Nair','dinesh.nair087@gmail.com','9876500087','Male','2025-11-22'),
('Mahalakshmi','Krishnan','mahalakshmi.krishnan088@gmail.com','9876500088','Female','2025-11-30'),
('Sandeep','Mohan','sandeep.mohan089@gmail.com','9876500089','Male','2025-12-08'),
('Lavanya','Rao','lavanya.rao090@gmail.com','9876500090','Female','2025-12-16'),
('Prakash','Naik','prakash.naik091@gmail.com','9876500091','Male','2025-12-24'),
('Asha','Menon','asha.menon092@gmail.com','9876500092','Female','2026-01-01'),
('Lokesh','Gowda','lokesh.gowda093@gmail.com','9876500093','Male','2026-01-09'),
('Shilpa','Bhat','shilpa.bhat094@gmail.com','9876500094','Female','2026-01-17'),
('Mahesh','Patil','mahesh.patil095@gmail.com','9876500095','Male','2026-01-25'),
('Rashmi','Khan','rashmi.khan096@gmail.com','9876500096','Female','2026-02-02'),
('Surya','Reddy','surya.reddy097@gmail.com','9876500097','Male','2026-02-10'),
('Anusha','Rao','anusha.rao098@gmail.com','9876500098','Female','2026-02-18'),
('Srinivas','Chandra','srinivas.chandra099@gmail.com','9876500099','Male','2026-02-26'),
('Harshita','Aggarwal','harshita.aggarwal100@gmail.com','9876500100','Female','2026-03-06'),
('Vikas','Choudhary','vikas.choudhary101@gmail.com','9876500101','Male','2026-03-14'),
('Navya','Joshi','navya.joshi102@gmail.com','9876500102','Female','2026-03-22'),
('Vikram','Rastogi','vikram.rastogi103@gmail.com','9876500103','Male','2026-03-30'),
('Gayathri','Rastogi','gayathri.rastogi104@gmail.com','9876500104','Female','2026-04-07'),
('Vineet','Aggarwal','vineet.aggarwal105@gmail.com','9876500105','Male','2026-04-15'),
('Disha','Choudhary','disha.choudhary106@gmail.com','9876500106','Female','2026-04-23'),
('Vishal','Kohli','vishal.kohli107@gmail.com','9876500107','Male','2026-05-01'),
('Riya','Bajaj','riya.bajaj108@gmail.com','9876500108','Female','2026-05-09'),
('Vivek','Mathur','vivek.mathur109@gmail.com','9876500109','Male','2026-05-17'),
('Shraddha','Sinha','shraddha.sinha110@gmail.com','9876500110','Female','2026-05-25'),
('Yash','Sood','yash.sood111@gmail.com','9876500111','Male','2026-06-02'),
('Manya','Tiwari','manya.tiwari112@gmail.com','9876500112','Female','2026-06-10'),
('Yogesh','Tripathi','yogesh.tripathi113@gmail.com','9876500113','Male','2026-06-18'),
('Shreya','Arora','shreya.arora114@gmail.com','9876500114','Female','2026-06-26'),
('Abhishek','Pandey','abhishek.pandey115@gmail.com','9876500115','Male','2026-07-04'),
('Sneha','Rathore','sneha.rathore116@gmail.com','9876500116','Female','2026-07-12'),
('Akhil','Tandon','akhil.tandon117@gmail.com','9876500117','Male','2026-07-20'),
('Tanvi','Bose','tanvi.bose118@gmail.com','9876500118','Female','2026-07-28'),
('Pranav','Khan','pranav.khan119@gmail.com','9876500119','Male','2026-08-05'),
('Aparna','Nair','aparna.nair120@gmail.com','9876500120','Female','2026-08-13'),
('Raghav','Bajaj','raghav.bajaj121@gmail.com','9876500121','Male','2026-08-21'),
('Swathi','Reddy','swathi.reddy122@gmail.com','9876500122','Female','2026-08-29'),
('Siddharth','Gupta','siddharth.gupta123@gmail.com','9876500123','Male','2026-09-01'),
('Neha','Verma','neha.verma124@gmail.com','9876500124','Female','2026-09-02'),
('Manish','Singh','manish.singh125@gmail.com','9876500125','Male','2026-09-03'),
('Riya','Deshmukh','riya.deshmukh126@gmail.com','9876500126','Female','2026-09-04'),
('Varun','Kumar','varun.kumar127@gmail.com','9876500127','Male','2026-09-05'),
('Anjali','Shah','anjali.shah128@gmail.com','9876500128','Female','2026-09-06'),
('Naveen','Rao','naveen.rao129@gmail.com','9876500129','Male','2026-09-07'),
('Harini','Krishnan','harini.krishnan130@gmail.com','9876500130','Female','2026-09-08'),
('Mohit','Arora','mohit.arora131@gmail.com','9876500131','Male','2026-09-09'),
('Lakshmi','Iyer','lakshmi.iyer132@gmail.com','9876500132','Female','2026-09-10'),
('Suresh','Naidu','suresh.naidu133@gmail.com','9876500133','Male','2026-09-11'),
('Priyanka','Das','priyanka.das134@gmail.com','9876500134','Female','2026-09-12'),
('Rohit','Jain','rohit.jain135@gmail.com','9876500135','Male','2026-09-13'),
('Deepika','Mohan','deepika.mohan136@gmail.com','9876500136','Female','2026-09-14'),
('Amit','Bansal','amit.bansal137@gmail.com','9876500137','Male','2026-09-15'),
('Pallavi','Joshi','pallavi.joshi138@gmail.com','9876500138','Female','2026-09-16'),
('Nikhil','Shetty','nikhil.shetty139@gmail.com','9876500139','Male','2026-09-17'),
('Sweta','Banerjee','sweta.banerjee140@gmail.com','9876500140','Female','2026-09-18'),
('Raj','Menon','raj.menon141@gmail.com','9876500141','Male','2026-09-19'),
('Tanvi','Bose','tanvi.bose142@gmail.com','9876500142','Female','2026-09-20'),
('Pranav','Mehta','pranav.mehta143@gmail.com','9876500143','Male','2026-09-21'),
('Madhuri','Rajan','madhuri.rajan144@gmail.com','9876500144','Female','2026-09-22'),
('Sameer','Sethi','sameer.sethi145@gmail.com','9876500145','Male','2026-09-23'),
('Aparna','Shah','aparna.shah146@gmail.com','9876500146','Female','2026-09-24'),
('Vivek','Rana','vivek.rana147@gmail.com','9876500147','Male','2026-09-25'),
('Komal','Ahuja','komal.ahuja148@gmail.com','9876500148','Female','2026-09-26'),
('Rajat','Bajaj','rajat.bajaj149@gmail.com','9876500149','Male','2026-09-27'),
('Bhavana','Iyer','bhavana.iyer150@gmail.com','9876500150','Female','2026-09-28');

SELECT COUNT(*) AS customer_count
FROM Customers;

SELECT * FROM Customers;

SELECT 
    COUNT(*) AS total_customers,
    MIN(customer_id) AS first_id,
    MAX(customer_id) AS last_id
FROM Customers;
-- ===========================================================================================================================================================================
-- Inserting the values of Addressess Table
INSERT INTO Addresses
(customer_id, address_type, city, state, pincode, country)
VALUES
(151,'Home','Bengaluru','Karnataka','560001','India'),
(152,'Home','Hyderabad','Telangana','500001','India'),
(153,'Work','Mumbai','Maharashtra','400001','India'),
(154,'Home','Chennai','Tamil Nadu','600001','India'),
(155,'Home','Pune','Maharashtra','411001','India'),
(156,'Work','Delhi','Delhi','110001','India'),
(157,'Home','Kochi','Kerala','682001','India'),
(158,'Home','Ahmedabad','Gujarat','380001','India'),
(159,'Work','Jaipur','Rajasthan','302001','India'),
(160,'Home','Bengaluru','Karnataka','560034','India'),
(161,'Home','Hyderabad','Telangana','500032','India'),
(162,'Work','Mumbai','Maharashtra','400050','India'),
(163,'Home','Chennai','Tamil Nadu','600018','India'),
(164,'Home','Pune','Maharashtra','411038','India'),
(165,'Work','Delhi','Delhi','110017','India'),
(166,'Home','Kochi','Kerala','682016','India'),
(167,'Home','Ahmedabad','Gujarat','380015','India'),
(168,'Work','Jaipur','Rajasthan','302017','India'),
(169,'Home','Bengaluru','Karnataka','560076','India'),
(170,'Home','Hyderabad','Telangana','500081','India'),
(171,'Work','Mumbai','Maharashtra','400076','India'),
(172,'Home','Chennai','Tamil Nadu','600040','India'),
(173,'Home','Pune','Maharashtra','411045','India'),
(174,'Work','Delhi','Delhi','110025','India'),
(175,'Home','Kochi','Kerala','682030','India'),
(176,'Home','Ahmedabad','Gujarat','380054','India'),
(177,'Work','Jaipur','Rajasthan','302020','India'),
(178,'Home','Bengaluru','Karnataka','560100','India'),
(179,'Home','Hyderabad','Telangana','500090','India'),
(180,'Work','Mumbai','Maharashtra','400093','India'),
(181,'Home','Chennai','Tamil Nadu','600096','India'),
(182,'Home','Pune','Maharashtra','411057','India'),
(183,'Work','Delhi','Delhi','110085','India'),
(184,'Home','Kochi','Kerala','682037','India'),
(185,'Home','Ahmedabad','Gujarat','380061','India'),
(186,'Work','Jaipur','Rajasthan','302018','India'),
(187,'Home','Bengaluru','Karnataka','560103','India'),
(188,'Home','Hyderabad','Telangana','500084','India'),
(189,'Work','Mumbai','Maharashtra','400076','India'),
(190,'Home','Chennai','Tamil Nadu','600119','India'),
(191,'Home','Pune','Maharashtra','411014','India'),
(192,'Work','Delhi','Delhi','110092','India'),
(193,'Home','Kochi','Kerala','682022','India'),
(194,'Home','Ahmedabad','Gujarat','380058','India'),
(195,'Work','Jaipur','Rajasthan','302016','India'),
(196,'Home','Bengaluru','Karnataka','560068','India'),
(197,'Home','Hyderabad','Telangana','500034','India'),
(198,'Work','Mumbai','Maharashtra','400070','India'),
(199,'Home','Chennai','Tamil Nadu','600042','India'),
(200,'Home','Pune','Maharashtra','411028','India'),
(201,'Work','Delhi','Delhi','110044','India'),
(202,'Home','Kochi','Kerala','682018','India'),
(203,'Home','Ahmedabad','Gujarat','380009','India'),
(204,'Work','Jaipur','Rajasthan','302004','India'),
(205,'Home','Bengaluru','Karnataka','560040','India'),
(206,'Home','Hyderabad','Telangana','500072','India'),
(207,'Work','Mumbai','Maharashtra','400037','India'),
(208,'Home','Chennai','Tamil Nadu','600032','India'),
(209,'Home','Pune','Maharashtra','411018','India'),
(210,'Work','Delhi','Delhi','110029','India'),
(211,'Home','Kochi','Kerala','682020','India'),
(212,'Home','Ahmedabad','Gujarat','380013','India'),
(213,'Work','Jaipur','Rajasthan','302006','India'),
(214,'Home','Bengaluru','Karnataka','560078','India'),
(215,'Home','Hyderabad','Telangana','500016','India'),
(216,'Work','Mumbai','Maharashtra','400071','India'),
(217,'Home','Chennai','Tamil Nadu','600028','India'),
(218,'Home','Pune','Maharashtra','411005','India'),
(219,'Work','Delhi','Delhi','110048','India'),
(220,'Home','Kochi','Kerala','682024','India'),
(221,'Home','Ahmedabad','Gujarat','380052','India'),
(222,'Work','Jaipur','Rajasthan','302012','India'),
(223,'Home','Bengaluru','Karnataka','560043','India'),
(224,'Home','Hyderabad','Telangana','500038','India'),
(225,'Work','Mumbai','Maharashtra','400014','India'),
(226,'Home','Chennai','Tamil Nadu','600041','India'),
(227,'Home','Pune','Maharashtra','411033','India'),
(228,'Work','Delhi','Delhi','110075','India'),
(229,'Home','Kochi','Kerala','682028','India'),
(230,'Home','Ahmedabad','Gujarat','380022','India'),
(231,'Work','Jaipur','Rajasthan','302019','India'),
(232,'Home','Bengaluru','Karnataka','560085','India'),
(233,'Home','Hyderabad','Telangana','500048','India'),
(234,'Work','Mumbai','Maharashtra','400058','India'),
(235,'Home','Chennai','Tamil Nadu','600073','India'),
(236,'Home','Pune','Maharashtra','411041','India'),
(237,'Work','Delhi','Delhi','110078','India'),
(238,'Home','Kochi','Kerala','682011','India'),
(239,'Home','Ahmedabad','Gujarat','380006','India'),
(240,'Work','Jaipur','Rajasthan','302015','India'),
(241,'Home','Bengaluru','Karnataka','560011','India'),
(242,'Home','Hyderabad','Telangana','500018','India'),
(243,'Work','Mumbai','Maharashtra','400086','India'),
(244,'Home','Chennai','Tamil Nadu','600020','India'),
(245,'Home','Pune','Maharashtra','411037','India'),
(246,'Work','Delhi','Delhi','110058','India'),
(247,'Home','Kochi','Kerala','682009','India'),
(248,'Home','Ahmedabad','Gujarat','380019','India'),
(249,'Work','Jaipur','Rajasthan','302021','India'),
(250,'Home','Bengaluru','Karnataka','560064','India'),
(251,'Home','Hyderabad','Telangana','500035','India'),
(252,'Work','Mumbai','Maharashtra','400067','India'),
(253,'Home','Chennai','Tamil Nadu','600087','India'),
(254,'Home','Pune','Maharashtra','411052','India'),
(255,'Work','Delhi','Delhi','110034','India'),
(256,'Home','Kochi','Kerala','682017','India'),
(257,'Home','Ahmedabad','Gujarat','380026','India'),
(258,'Work','Jaipur','Rajasthan','302022','India'),
(259,'Home','Bengaluru','Karnataka','560066','India'),
(260,'Home','Hyderabad','Telangana','500049','India'),
(261,'Work','Mumbai','Maharashtra','400101','India'),
(262,'Home','Chennai','Tamil Nadu','600100','India'),
(263,'Home','Pune','Maharashtra','411057','India'),
(264,'Work','Delhi','Delhi','110063','India'),
(265,'Home','Kochi','Kerala','682036','India'),
(266,'Home','Ahmedabad','Gujarat','380028','India'),
(267,'Work','Jaipur','Rajasthan','302023','India'),
(268,'Home','Bengaluru','Karnataka','560037','India'),
(269,'Home','Hyderabad','Telangana','500068','India'),
(270,'Work','Mumbai','Maharashtra','400092','India'),
(271,'Home','Chennai','Tamil Nadu','600034','India'),
(272,'Home','Pune','Maharashtra','411007','India'),
(273,'Work','Delhi','Delhi','110016','India'),
(274,'Home','Kochi','Kerala','682015','India'),
(275,'Home','Ahmedabad','Gujarat','380007','India'),
(276,'Work','Jaipur','Rajasthan','302029','India'),
(277,'Home','Bengaluru','Karnataka','560038','India'),
(278,'Home','Hyderabad','Telangana','500047','India'),
(279,'Work','Mumbai','Maharashtra','400049','India'),
(280,'Home','Chennai','Tamil Nadu','600033','India'),
(281,'Home','Pune','Maharashtra','411016','India'),
(282,'Work','Delhi','Delhi','110019','India'),
(283,'Home','Kochi','Kerala','682035','India'),
(284,'Home','Ahmedabad','Gujarat','380016','India'),
(285,'Work','Jaipur','Rajasthan','302033','India'),
(286,'Home','Bengaluru','Karnataka','560095','India'),
(287,'Home','Hyderabad','Telangana','500085','India'),
(288,'Work','Mumbai','Maharashtra','400078','India'),
(289,'Home','Chennai','Tamil Nadu','600017','India'),
(290,'Home','Pune','Maharashtra','411021','India'),
(291,'Work','Delhi','Delhi','110030','India'),
(292,'Home','Kochi','Kerala','682001','India'),
(293,'Home','Ahmedabad','Gujarat','380015','India'),
(294,'Work','Jaipur','Rajasthan','302002','India'),
(295,'Home','Bengaluru','Karnataka','560070','India'),
(296,'Home','Hyderabad','Telangana','500033','India'),
(297,'Work','Mumbai','Maharashtra','400018','India'),
(298,'Home','Chennai','Tamil Nadu','600024','India'),
(299,'Home','Pune','Maharashtra','411038','India'),
(300,'Work','Delhi','Delhi','110067','India');

-- Checking the count of rows
SELECT COUNT(*) AS address_count
FROM Addresses;

-- Checking the excuteion and  Limit command
 SELECT 
    a.address_id,
    a.customer_id,
    c.first_name,
    c.last_name,
    a.city,
    a.state
FROM Addresses a
INNER JOIN Customers c
    ON a.customer_id = c.customer_id
LIMIT 10;
show tables;


-- Select Command
select * from customers;

-- Normal Checking Command
SELECT COUNT(*) AS total_categories
FROM Categories;
ALTER TABLE Categories AUTO_INCREMENT = 1;

-- ===========================================================================================================================================================================
-- Inserting the values of Categories Table
INSERT INTO Categories (category_name, description) VALUES
('Smartphones', 'Mobile phones and smartphones'),
('Mobile Accessories', 'Accessories for mobile phones'),
('Feature Phones', 'Basic mobile phones'),
('Phone Cases', 'Protective cases for smartphones'),
('Screen Protectors', 'Protective screens for mobile devices'),
('Power Banks', 'Portable charging devices'),
('Chargers', 'Mobile and electronic chargers'),
('USB Cables', 'USB charging and data cables'),
('Bluetooth Earphones', 'Wireless Bluetooth earphones'),
('Wired Earphones', 'Wired earphones and headsets'),
('Laptops', 'Personal and business laptops'),
('Laptop Accessories', 'Accessories for laptops'),
('Laptop Bags', 'Bags and backpacks for laptops'),
('Laptop Stands', 'Laptop stands and holders'),
('Computer Monitors', 'Computer and display monitors'),
('Desktop Computers', 'Desktop computer systems'),
('Computer Components', 'Internal computer hardware'),
('Graphics Cards', 'Graphics processing units'),
('Computer Memory', 'RAM and memory modules'),
('Storage Devices', 'Computer storage products'),
('Hard Disk Drives', 'Internal and external hard drives'),
('Solid State Drives', 'SSD storage devices'),
('USB Flash Drives', 'Portable USB storage devices'),
('Memory Cards', 'SD and microSD memory cards'),
('Keyboards', 'Computer keyboards'),
('Computer Mice', 'Wired and wireless computer mice'),
('Webcams', 'Computer webcams'),
('Printers', 'Home and office printers'),
('Printer Accessories', 'Printer supplies and accessories'),
('Scanners', 'Document and photo scanners'),
('Tablets', 'Tablet computers'),
('Tablet Accessories', 'Accessories for tablets'),
('Tablet Cases', 'Protective tablet cases'),
('Smartwatches', 'Smart wearable watches'),
('Fitness Trackers', 'Fitness and activity tracking devices'),
('Bluetooth Speakers', 'Portable Bluetooth speakers'),
('Home Audio', 'Home audio equipment'),
('Headphones', 'Over-ear and on-ear headphones'),
('Gaming Headsets', 'Headsets designed for gaming'),
('Soundbars', 'Audio soundbars for televisions'),
('Televisions', 'Smart and LED televisions'),
('TV Accessories', 'Television accessories'),
('Streaming Devices', 'Streaming and media devices'),
('Projectors', 'Home and business projectors'),
('Cameras', 'Digital cameras'),
('Camera Lenses', 'Camera lenses and optics'),
('Camera Accessories', 'Accessories for cameras'),
('Tripods', 'Camera and mobile tripods'),
('Drones', 'Consumer drones'),
('Drone Accessories', 'Accessories for drones'),
('Refrigerators', 'Home refrigerators'),
('Washing Machines', 'Washing machines and laundry appliances'),
('Air Conditioners', 'Home air conditioning systems'),
('Air Coolers', 'Air cooling appliances'),
('Microwave Ovens', 'Microwave cooking appliances'),
('Electric Ovens', 'Electric ovens'),
('Dishwashers', 'Home dishwashing appliances'),
('Vacuum Cleaners', 'Vacuum cleaning appliances'),
('Water Purifiers', 'Water purification systems'),
('Room Heaters', 'Electric room heating appliances'),
('Kitchen Appliances', 'Small kitchen appliances'),
('Electric Kettles', 'Electric water kettles'),
('Coffee Makers', 'Coffee preparation machines'),
('Mixers and Grinders', 'Kitchen mixers and grinders'),
('Toasters', 'Bread toasting appliances'),
('Air Fryers', 'Oil-free cooking appliances'),
('Induction Cooktops', 'Induction cooking appliances'),
('Rice Cookers', 'Electric rice cooking appliances'),
('Juicers', 'Fruit and vegetable juicers'),
('Hand Blenders', 'Handheld blending appliances'),
('Cookware', 'Pots pans and cooking utensils'),
('Dinnerware', 'Plates bowls and dining sets'),
('Glassware', 'Drinking glasses and sets'),
('Kitchen Storage', 'Food storage containers'),
('Kitchen Tools', 'General kitchen tools'),
('Cutlery', 'Knives forks and spoons'),
('Bakeware', 'Baking trays and accessories'),
('Food Containers', 'Food storage containers'),
('Water Bottles', 'Reusable water bottles'),
('Lunch Boxes', 'Lunch boxes and food carriers'),
('Men Shirts', 'Shirts for men'),
('Men T Shirts', 'T-shirts for men'),
('Men Jeans', 'Jeans and denim for men'),
('Men Trousers', 'Trousers and formal pants for men'),
('Men Jackets', 'Jackets and outerwear for men'),
('Men Ethnic Wear', 'Traditional clothing for men'),
('Women Dresses', 'Dresses for women'),
('Women Tops', 'Tops and casual wear for women'),
('Women Sarees', 'Sarees and traditional clothing'),
('Women Kurtas', 'Kurtas and ethnic wear for women'),
('Women Jeans', 'Jeans and denim for women'),
('Women Trousers', 'Trousers and formal pants for women'),
('Women Jackets', 'Jackets and outerwear for women'),
('Kids Clothing', 'Clothing for children'),
('Baby Clothing', 'Clothing for babies'),
('Mens Footwear', 'Shoes and footwear for men'),
('Womens Footwear', 'Shoes and footwear for women'),
('Kids Footwear', 'Shoes and footwear for children'),
('Sports Shoes', 'Shoes designed for sports activities'),
('Casual Shoes', 'Casual everyday footwear'),
('Sandals', 'Sandals and open footwear'),
('Slippers', 'Indoor and casual slippers'),
('Handbags', 'Handbags and fashion bags'),
('Backpacks', 'Backpacks for travel and daily use'),
('Wallets', 'Men and women wallets'),
('Belts', 'Fashion and formal belts'),
('Sunglasses', 'Fashion and protective sunglasses'),
('Watches', 'Traditional wrist watches'),
('Fashion Accessories', 'General fashion accessories'),
('Jewelry', 'Fashion and precious jewelry'),
('Skincare', 'Skin care products'),
('Hair Care', 'Hair care products'),
('Makeup', 'Cosmetics and makeup products'),
('Perfumes', 'Perfumes and fragrances'),
('Personal Care', 'Personal hygiene products'),
('Bath and Body', 'Bath and body care products'),
('Grooming Products', 'Personal grooming products'),
('Beauty Accessories', 'Beauty tools and accessories'),
('Oral Care', 'Toothbrushes toothpaste and oral products'),
('Shaving Products', 'Shaving and beard care products'),
('Sports Equipment', 'General sports equipment'),
('Fitness Equipment', 'Exercise and fitness equipment'),
('Yoga Products', 'Yoga mats and accessories'),
('Cricket Equipment', 'Cricket bats balls and accessories'),
('Football Equipment', 'Football equipment and accessories'),
('Badminton Equipment', 'Badminton rackets and accessories'),
('Tennis Equipment', 'Tennis rackets and accessories'),
('Cycling Equipment', 'Bicycles and cycling accessories'),
('Running Accessories', 'Running gear and accessories'),
('Outdoor Sports', 'Outdoor sports equipment'),
('Books', 'General books and reading materials'),
('Educational Books', 'Educational and academic books'),
('Fiction Books', 'Fiction novels and stories'),
('Non Fiction Books', 'Non-fiction books'),
('Children Books', 'Books for children'),
('Exam Preparation Books', 'Competitive exam preparation books'),
('Office Supplies', 'Office and workplace supplies'),
('Stationery', 'Pens notebooks and stationery'),
('Art Supplies', 'Drawing and painting supplies'),
('School Supplies', 'School-related products'),
('Video Games', 'Video games for different platforms'),
('Gaming Consoles', 'Gaming consoles'),
('Gaming Accessories', 'Accessories for gaming'),
('Gaming Controllers', 'Gaming controllers and gamepads'),
('Board Games', 'Traditional board games'),
('Puzzles', 'Jigsaw and educational puzzles'),
('Toys', 'Toys for children'),
('Baby Toys', 'Toys for babies'),
('Remote Control Toys', 'Remote controlled toys'),
('Dolls and Doll Accessories', 'Dolls and related accessories'),
('Groceries', 'General grocery products'),
('Snacks', 'Packaged snacks and food'),
('Beverages', 'Drinks and beverage products'),
('Tea and Coffee', 'Tea coffee and related products'),
('Cooking Ingredients', 'Cooking ingredients and essentials'),
('Packaged Foods', 'Packaged food products'),
('Pet Food', 'Food products for pets'),
('Pet Accessories', 'Accessories for pets'),
('Car Accessories', 'Accessories for automobiles'),
('Automotive Care', 'Vehicle cleaning and maintenance products');

SELECT COUNT(*) AS total_categories
FROM Categories;
-- ===========================================================================================================================================================================
-- Deleted the extra Rows
DELETE FROM Categories
WHERE category_id BETWEEN 151 AND 160;
-- ===========================================================================================================================================================================
-- Select Command
SELECT COUNT(*) AS total_categories
FROM Categories;

-- Normal Command
SELECT MIN(category_id) AS first_id,
       MAX(category_id) AS last_id,
       COUNT(*) AS total_records
FROM Categories;

-- Select Command
select * from categories;
-- ===========================================================================================================================================================================
-- Suppliers
SELECT COUNT(*) AS total_suppliers
FROM Suppliers;
ALTER TABLE Suppliers AUTO_INCREMENT = 1;


-- ===========================================================================================================================================================================
-- Inserting the values of Suppliers Table
INSERT INTO Suppliers
(supplier_name, contact_person, phone, email, city, state)
VALUES
('TechNova Solutions', 'Rajesh Kumar', '9876501001', 'rajesh@technova.com', 'Bengaluru', 'Karnataka'),
('Digital World India', 'Amit Sharma', '9876501002', 'amit@digitalworld.com', 'Delhi', 'Delhi'),
('Smart Electronics Hub', 'Vikram Singh', '9876501003', 'vikram@smarthub.com', 'Mumbai', 'Maharashtra'),
('Prime Tech Distributors', 'Suresh Reddy', '9876501004', 'suresh@primetech.com', 'Hyderabad', 'Telangana'),
('ElectroMart Supplies', 'Kiran Patel', '9876501005', 'kiran@electromart.com', 'Ahmedabad', 'Gujarat'),
('Future Gadgets India', 'Arun Nair', '9876501006', 'arun@futuregadgets.com', 'Kochi', 'Kerala'),
('Global Electronics Co', 'Manoj Verma', '9876501007', 'manoj@globalelectronics.com', 'Pune', 'Maharashtra'),
('NextGen Devices', 'Rohit Gupta', '9876501008', 'rohit@nextgen.com', 'Jaipur', 'Rajasthan'),
('TechBridge Distributors', 'Deepak Rao', '9876501009', 'deepak@techbridge.com', 'Chennai', 'Tamil Nadu'),
('Digital Plus Traders', 'Naveen Kumar', '9876501010', 'naveen@digitalplus.com', 'Bengaluru', 'Karnataka'),
('Urban Electronics', 'Sanjay Mehta', '9876501011', 'sanjay@urbanelectronics.com', 'Mumbai', 'Maharashtra'),
('Galaxy Tech Supplies', 'Ramesh Iyer', '9876501012', 'ramesh@galaxytech.com', 'Chennai', 'Tamil Nadu'),
('Metro Digital Solutions', 'Harish Joshi', '9876501013', 'harish@metrodigital.com', 'Delhi', 'Delhi'),
('Innovative Gadgets', 'Prakash Rao', '9876501014', 'prakash@innovativegadgets.com', 'Hyderabad', 'Telangana'),
('Reliable Tech Traders', 'Mohan Das', '9876501015', 'mohan@reliabletech.com', 'Kolkata', 'West Bengal'),
('Bright Electronics', 'Ajay Shah', '9876501016', 'ajay@brightelectronics.com', 'Surat', 'Gujarat'),
('TechSource India', 'Vijay Menon', '9876501017', 'vijay@techsource.com', 'Kochi', 'Kerala'),
('Digital Planet', 'Abhishek Jain', '9876501018', 'abhishek@digitalplanet.com', 'Indore', 'Madhya Pradesh'),
('SmartBuy Distributors', 'Gaurav Singh', '9876501019', 'gaurav@smartbuy.com', 'Lucknow', 'Uttar Pradesh'),
('ElectroLink India', 'Ravi Kumar', '9876501020', 'ravi@electrolink.com', 'Noida', 'Uttar Pradesh'),
('HomeTech Appliances', 'Vishal Kapoor', '9876501021', 'vishal@hometech.com', 'Delhi', 'Delhi'),
('KitchenPro Supplies', 'Sunil Bhat', '9876501022', 'sunil@kitchenpro.com', 'Bengaluru', 'Karnataka'),
('HomeStyle Distributors', 'Anil Thomas', '9876501023', 'anil@homestyle.com', 'Kochi', 'Kerala'),
('Comfort Home Products', 'Joseph Mathew', '9876501024', 'joseph@comforthome.com', 'Kochi', 'Kerala'),
('Appliance World', 'Sathish Kumar', '9876501025', 'sathish@applianceworld.com', 'Chennai', 'Tamil Nadu'),
('Modern Home Supplies', 'Dinesh Patel', '9876501026', 'dinesh@modernhome.com', 'Ahmedabad', 'Gujarat'),
('HomeNeeds India', 'Rakesh Yadav', '9876501027', 'rakesh@homeneeds.com', 'Lucknow', 'Uttar Pradesh'),
('EasyLiving Products', 'Nikhil Jain', '9876501028', 'nikhil@easyliving.com', 'Jaipur', 'Rajasthan'),
('Household Mart', 'Tarun Gupta', '9876501029', 'tarun@householdmart.com', 'Delhi', 'Delhi'),
('HomeCare Traders', 'Mahesh Rao', '9876501030', 'mahesh@homecare.com', 'Hyderabad', 'Telangana'),
('FashionFirst India', 'Rahul Malhotra', '9876501031', 'rahul@fashionfirst.com', 'Mumbai', 'Maharashtra'),
('StyleHub Distributors', 'Varun Arora', '9876501032', 'varun@stylehub.com', 'Delhi', 'Delhi'),
('TrendLine Fashion', 'Karthik Reddy', '9876501033', 'karthik@trendline.com', 'Hyderabad', 'Telangana'),
('UrbanStyle Suppliers', 'Akash Mehta', '9876501034', 'akash@urbanstyle.com', 'Pune', 'Maharashtra'),
('Fashion Avenue', 'Ravi Sharma', '9876501035', 'ravi@fashionavenue.com', 'Jaipur', 'Rajasthan'),
('Clothing Corner', 'Pankaj Soni', '9876501036', 'pankaj@clothingcorner.com', 'Surat', 'Gujarat'),
('Classic Wear India', 'Mukul Jain', '9876501037', 'mukul@classicwear.com', 'Delhi', 'Delhi'),
('StyleCraft Traders', 'Aakash Verma', '9876501038', 'aakash@stylecraft.com', 'Lucknow', 'Uttar Pradesh'),
('Fashion Street Supplies', 'Nitin Kapoor', '9876501039', 'nitin@fashionstreet.com', 'Mumbai', 'Maharashtra'),
('Modern Wear Distributors', 'Rohit Bansal', '9876501040', 'rohit@modernwear.com', 'Chandigarh', 'Chandigarh'),
('FootStyle India', 'Sandeep Kumar', '9876501041', 'sandeep@footstyle.com', 'Delhi', 'Delhi'),
('ShoeMart Distributors', 'Yash Patel', '9876501042', 'yash@shoemart.com', 'Ahmedabad', 'Gujarat'),
('WalkEasy Supplies', 'Naveen Shah', '9876501043', 'naveen@walkeasy.com', 'Mumbai', 'Maharashtra'),
('ComfortStep Traders', 'Imran Khan', '9876501044', 'imran@comfortstep.com', 'Hyderabad', 'Telangana'),
('SportsFoot India', 'Manish Rao', '9876501045', 'manish@sportsfoot.com', 'Bengaluru', 'Karnataka'),
('ShoeWorld India', 'Rakesh Singh', '9876501046', 'rakesh@shoeworld.com', 'Kolkata', 'West Bengal'),
('UrbanFootwear', 'Siddharth Jain', '9876501047', 'siddharth@urbanfootwear.com', 'Pune', 'Maharashtra'),
('StepUp Distributors', 'Ashwin Kumar', '9876501048', 'ashwin@stepup.com', 'Chennai', 'Tamil Nadu'),
('Classic Shoes India', 'Rajiv Menon', '9876501049', 'rajiv@classicshoes.com', 'Kochi', 'Kerala'),
('FootCare Traders', 'Vivek Sharma', '9876501050', 'vivek@footcare.com', 'Jaipur', 'Rajasthan'),
('BeautyGlow Supplies', 'Neha Sharma', '9876501051', 'neha@beautyglow.com', 'Delhi', 'Delhi'),
('CosmoCare India', 'Pooja Mehta', '9876501052', 'pooja@cosmocare.com', 'Mumbai', 'Maharashtra'),
('PureBeauty Traders', 'Sneha Kapoor', '9876501053', 'sneha@purebeauty.com', 'Bengaluru', 'Karnataka'),
('GlowCare Distributors', 'Anjali Rao', '9876501054', 'anjali@glowcare.com', 'Hyderabad', 'Telangana'),
('Natural Beauty Products', 'Divya Nair', '9876501055', 'divya@naturalbeauty.com', 'Kochi', 'Kerala'),
('BeautyPlus India', 'Ritu Gupta', '9876501056', 'ritu@beautyplus.com', 'Jaipur', 'Rajasthan'),
('SkinCare Hub', 'Meena Patel', '9876501057', 'meena@skincarehub.com', 'Ahmedabad', 'Gujarat'),
('HairCare Solutions', 'Swati Jain', '9876501058', 'swati@haircare.com', 'Pune', 'Maharashtra'),
('PersonalCare India', 'Kavitha Rao', '9876501059', 'kavitha@personalcare.com', 'Chennai', 'Tamil Nadu'),
('Beauty Essentials', 'Shalini Verma', '9876501060', 'shalini@beautyessentials.com', 'Lucknow', 'Uttar Pradesh'),
('SportZone India', 'Arjun Mehta', '9876501061', 'arjun@sportzone.com', 'Mumbai', 'Maharashtra'),
('FitnessWorld Supplies', 'Rakesh Kumar', '9876501062', 'rakesh@fitnessworld.com', 'Bengaluru', 'Karnataka'),
('ActiveLife Traders', 'Suresh Babu', '9876501063', 'suresh@activelife.com', 'Chennai', 'Tamil Nadu'),
('CricketPro India', 'Sachin Rao', '9876501064', 'sachin@cricketpro.com', 'Hyderabad', 'Telangana'),
('FootballHub Suppliers', 'Vijay Singh', '9876501065', 'vijay@footballhub.com', 'Kolkata', 'West Bengal'),
('Badminton World', 'Kunal Sharma', '9876501066', 'kunal@badmintonworld.com', 'Delhi', 'Delhi'),
('TennisPoint India', 'Rohan Mehta', '9876501067', 'rohan@tennispoint.com', 'Pune', 'Maharashtra'),
('CyclingZone', 'Nikhil Rao', '9876501068', 'nikhil@cyclingzone.com', 'Bengaluru', 'Karnataka'),
('OutdoorLife Supplies', 'Amit Verma', '9876501069', 'amit@outdoorlife.com', 'Dehradun', 'Uttarakhand'),
('SportsGear India', 'Deepak Singh', '9876501070', 'deepak@sportsgear.com', 'Jaipur', 'Rajasthan'),
('BookWorld Distributors', 'Manoj Sharma', '9876501071', 'manoj@bookworld.com', 'Delhi', 'Delhi'),
('ReadersPoint India', 'Asha Nair', '9876501072', 'asha@readerspoint.com', 'Kochi', 'Kerala'),
('KnowledgeHub Books', 'Ramesh Gupta', '9876501073', 'ramesh@knowledgehub.com', 'Pune', 'Maharashtra'),
('Academic Books India', 'Sanjay Rao', '9876501074', 'sanjay@academicbooks.com', 'Chennai', 'Tamil Nadu'),
('Fiction House', 'Vivek Jain', '9876501075', 'vivek@fictionhouse.com', 'Mumbai', 'Maharashtra'),
('LearningTree Supplies', 'Priya Shah', '9876501076', 'priya@learningtree.com', 'Ahmedabad', 'Gujarat'),
('Stationery World', 'Mohan Kumar', '9876501077', 'mohan@stationeryworld.com', 'Bengaluru', 'Karnataka'),
('OfficeNeeds India', 'Ashok Patel', '9876501078', 'ashok@officeneeds.com', 'Surat', 'Gujarat'),
('SchoolSupplies Hub', 'Geeta Rao', '9876501079', 'geeta@schoolsupplies.com', 'Hyderabad', 'Telangana'),
('ArtCraft Distributors', 'Kiran Singh', '9876501080', 'kiran@artcraft.com', 'Jaipur', 'Rajasthan'),
('GameZone India', 'Aman Gupta', '9876501081', 'aman@gamezone.com', 'Delhi', 'Delhi'),
('GamingWorld Supplies', 'Rohit Sharma', '9876501082', 'rohit@gamingworld.com', 'Mumbai', 'Maharashtra'),
('ConsoleHub India', 'Vikas Rao', '9876501083', 'vikas@consolehub.com', 'Bengaluru', 'Karnataka'),
('GameTech Distributors', 'Harish Kumar', '9876501084', 'harish@gametech.com', 'Hyderabad', 'Telangana'),
('PlayZone Traders', 'Sahil Jain', '9876501085', 'sahil@playzone.com', 'Pune', 'Maharashtra'),
('ToyWorld India', 'Rajesh Mehta', '9876501086', 'rajesh@toyworld.com', 'Chennai', 'Tamil Nadu'),
('KidsFun Supplies', 'Vijay Gupta', '9876501087', 'vijay@kidsfun.com', 'Delhi', 'Delhi'),
('PuzzleHouse India', 'Ankit Sharma', '9876501088', 'ankit@puzzlehouse.com', 'Kolkata', 'West Bengal'),
('BoardGame Traders', 'Suresh Jain', '9876501089', 'suresh@boardgames.com', 'Jaipur', 'Rajasthan'),
('FunWorld Distributors', 'Manish Patel', '9876501090', 'manish@funworld.com', 'Ahmedabad', 'Gujarat'),
('FreshMart Suppliers', 'Ravi Kumar', '9876501091', 'ravi@freshmart.com', 'Bengaluru', 'Karnataka'),
('DailyNeeds India', 'Sunil Sharma', '9876501092', 'sunil@dailyneeds.com', 'Delhi', 'Delhi'),
('FoodBasket Distributors', 'Arun Gupta', '9876501093', 'arun@foodbasket.com', 'Mumbai', 'Maharashtra'),
('GroceryHub India', 'Raj Kumar', '9876501094', 'raj@groceryhub.com', 'Hyderabad', 'Telangana'),
('FreshFoods Traders', 'Mohan Rao', '9876501095', 'mohan@freshfoods.com', 'Chennai', 'Tamil Nadu'),
('DailyFresh Supplies', 'Karthik Nair', '9876501096', 'karthik@dailyfresh.com', 'Kochi', 'Kerala'),
('SuperMart Suppliers', 'Naveen Kumar', '9876501097', 'naveen@supermart.com', 'Pune', 'Maharashtra'),
('FoodPlus India', 'Deepak Jain', '9876501098', 'deepak@foodplus.com', 'Jaipur', 'Rajasthan'),
('EssentialFoods', 'Pankaj Verma', '9876501099', 'pankaj@essentialfoods.com', 'Lucknow', 'Uttar Pradesh'),
('GrocerEase Distributors', 'Amit Shah', '9876501100', 'amit@grocerease.com', 'Ahmedabad', 'Gujarat'),
('PetCare India', 'Ravi Menon', '9876501101', 'ravi@petcare.com', 'Kochi', 'Kerala'),
('PetWorld Supplies', 'Sanjay Kumar', '9876501102', 'sanjay@petworld.com', 'Bengaluru', 'Karnataka'),
('AnimalNeeds India', 'Vivek Rao', '9876501103', 'vivek@animalneeds.com', 'Chennai', 'Tamil Nadu'),
('PetPlus Distributors', 'Rahul Jain', '9876501104', 'rahul@petplus.com', 'Delhi', 'Delhi'),
('HappyPets Traders', 'Arun Patel', '9876501105', 'arun@happypets.com', 'Ahmedabad', 'Gujarat'),
('PetEssentials India', 'Manoj Singh', '9876501106', 'manoj@petessentials.com', 'Jaipur', 'Rajasthan'),
('PawsCare Supplies', 'Kunal Mehta', '9876501107', 'kunal@pawscare.com', 'Mumbai', 'Maharashtra'),
('PetChoice India', 'Nitin Rao', '9876501108', 'nitin@petchoice.com', 'Hyderabad', 'Telangana'),
('AnimalCare Traders', 'Ashwin Kumar', '9876501109', 'ashwin@animalcare.com', 'Pune', 'Maharashtra'),
('PetStore Distributors', 'Ramesh Gupta', '9876501110', 'ramesh@petstore.com', 'Kolkata', 'West Bengal'),
('AutoCare India', 'Vikas Sharma', '9876501111', 'vikas@autocare.com', 'Delhi', 'Delhi'),
('CarZone Supplies', 'Amit Kumar', '9876501112', 'amit@carzone.com', 'Mumbai', 'Maharashtra'),
('MotorMart India', 'Rajiv Patel', '9876501113', 'rajiv@motormart.com', 'Ahmedabad', 'Gujarat'),
('AutoParts Distributors', 'Suresh Mehta', '9876501114', 'suresh@autoparts.com', 'Pune', 'Maharashtra'),
('DriveCare Traders', 'Rohan Singh', '9876501115', 'rohan@drivecare.com', 'Bengaluru', 'Karnataka'),
('CarAccessories Hub', 'Manish Rao', '9876501116', 'manish@caraccessories.com', 'Hyderabad', 'Telangana'),
('VehicleNeeds India', 'Deepak Kumar', '9876501117', 'deepak@vehicleneeds.com', 'Chennai', 'Tamil Nadu'),
('RoadReady Supplies', 'Nikhil Gupta', '9876501118', 'nikhil@roadready.com', 'Jaipur', 'Rajasthan'),
('AutoPlus India', 'Karan Shah', '9876501119', 'karan@autoplus.com', 'Surat', 'Gujarat'),
('MotorCare Distributors', 'Vijay Verma', '9876501120', 'vijay@motorcare.com', 'Lucknow', 'Uttar Pradesh'),
('Lifestyle Products India', 'Aditya Sharma', '9876501121', 'aditya@lifestyleproducts.com', 'Mumbai', 'Maharashtra'),
('Premium Living Supplies', 'Rohit Kumar', '9876501122', 'rohit@premiumliving.com', 'Bengaluru', 'Karnataka'),
('Everyday Essentials', 'Sanjay Patel', '9876501123', 'sanjay@everydayessentials.com', 'Ahmedabad', 'Gujarat'),
('ValueMart Distributors', 'Ajay Kumar', '9876501124', 'ajay@valuemart.com', 'Delhi', 'Delhi'),
('ChoicePoint India', 'Vishal Rao', '9876501125', 'vishal@choicepoint.com', 'Hyderabad', 'Telangana'),
('QualityGoods India', 'Pradeep Sharma', '9876501126', 'pradeep@qualitygoods.com', 'Chennai', 'Tamil Nadu'),
('PrimeChoice Suppliers', 'Rakesh Mehta', '9876501127', 'rakesh@primechoice.com', 'Pune', 'Maharashtra'),
('TrustedGoods India', 'Naveen Singh', '9876501128', 'naveen@trustedgoods.com', 'Jaipur', 'Rajasthan'),
('MarketLink India', 'Siddharth Gupta', '9876501129', 'siddharth@marketlink.com', 'Kolkata', 'West Bengal'),
('RetailSource India', 'Manish Jain', '9876501130', 'manish@retailsource.com', 'Lucknow', 'Uttar Pradesh'),
('IndiaTrade Supplies', 'Arvind Kumar', '9876501131', 'arvind@indiatrade.com', 'Delhi', 'Delhi'),
('National Distributors', 'Mukul Sharma', '9876501132', 'mukul@nationaldistributors.com', 'Mumbai', 'Maharashtra'),
('ReliableSource India', 'Tarun Rao', '9876501133', 'tarun@reliablesource.com', 'Bengaluru', 'Karnataka'),
('WholesaleHub India', 'Puneet Gupta', '9876501134', 'puneet@wholesalehub.com', 'Hyderabad', 'Telangana'),
('PrimeWholesale Traders', 'Sandeep Patel', '9876501135', 'sandeep@primewholesale.com', 'Ahmedabad', 'Gujarat'),
('RetailConnect India', 'Kishore Kumar', '9876501136', 'kishore@retailconnect.com', 'Chennai', 'Tamil Nadu'),
('BusinessSupply India', 'Anil Sharma', '9876501137', 'anil@businesssupply.com', 'Pune', 'Maharashtra'),
('TradePoint Distributors', 'Harish Singh', '9876501138', 'harish@tradepoint.com', 'Jaipur', 'Rajasthan'),
('SupplyChain Traders', 'Vijay Rao', '9876501139', 'vijay@supplychaintraders.com', 'Kolkata', 'West Bengal'),
('DirectSource India', 'Ramesh Patel', '9876501140', 'ramesh@directsource.com', 'Surat', 'Gujarat'),
('EcomSource India', 'Akhil Kumar', '9876501141', 'akhil@ecomsource.com', 'Bengaluru', 'Karnataka'),
('OnlineTrade Supplies', 'Nitin Sharma', '9876501142', 'nitin@onlinetrade.com', 'Delhi', 'Delhi'),
('DigitalSupply India', 'Karan Mehta', '9876501143', 'karan@digitalsupply.com', 'Mumbai', 'Maharashtra'),
('Ecommerce Distributors', 'Varun Kumar', '9876501144', 'varun@ecomdistributors.com', 'Hyderabad', 'Telangana'),
('MarketSupply India', 'Ashok Rao', '9876501145', 'ashok@marketsupply.com', 'Chennai', 'Tamil Nadu'),
('RetailPro India', 'Girish Kumar', '9876501146', 'girish@retailpro.com', 'Pune', 'Maharashtra'),
('CommerceHub India', 'Ravi Shah', '9876501147', 'ravi@commercehub.com', 'Ahmedabad', 'Gujarat'),
('OnlineMart Suppliers', 'Sahil Gupta', '9876501148', 'sahil@onlinemart.com', 'Jaipur', 'Rajasthan'),
('EcomWorld Traders', 'Kunal Verma', '9876501149', 'kunal@ecomworld.com', 'Lucknow', 'Uttar Pradesh'),
('DigitalMart India', 'Prakash Jain', '9876501150', 'prakash@digitalmart.com', 'Kolkata', 'West Bengal');

-- Count Command
SELECT COUNT(*) AS total_suppliers
FROM Suppliers;

-- Select Command
SELECT 
    MIN(supplier_id) AS first_id,
    MAX(supplier_id) AS last_id,
    COUNT(*) AS total_records
FROM Suppliers;
-- ===========================================================================================================================================================================
-- Checking the count
SELECT COUNT(*) AS total_categories FROM Categories;
SELECT COUNT(*) AS total_suppliers FROM Suppliers;

ALTER TABLE Products AUTO_INCREMENT = 1;

-- Products
-- Inserting the values of Product Table
INSERT INTO Products
(product_name, category_id, supplier_id, price, stock_quantity, product_rating, product_status)
VALUES
('Samsung Galaxy A55 5G', 1, 1, 34999.00, 85, 4.50, 'Active'),
('Apple iPhone 15', 1, 2, 69999.00, 42, 4.70, 'Active'),
('OnePlus Nord CE 4', 1, 3, 24999.00, 120, 4.40, 'Active'),
('Realme Narzo 70', 1, 4, 15999.00, 95, 4.20, 'Active'),
('Google Pixel 8a', 1, 5, 52999.00, 38, 4.60, 'Active'),
('Nothing Phone 2a', 1, 6, 23999.00, 76, 4.30, 'Active'),
('Redmi Note 13 Pro', 1, 7, 26999.00, 110, 4.40, 'Active'),
('Vivo V30', 1, 8, 31999.00, 64, 4.30, 'Active'),
('Motorola Edge 50 Fusion', 1, 9, 22999.00, 88, 4.20, 'Active'),
('Oppo Reno 11', 1, 10, 28999.00, 51, 4.40, 'Active'),
('Dell Inspiron 15', 11, 11, 58999.00, 35, 4.30, 'Active'),
('HP Pavilion 14', 11, 12, 64999.00, 28, 4.40, 'Active'),
('Lenovo IdeaPad Slim 5', 11, 13, 61999.00, 45, 4.50, 'Active'),
('ASUS Vivobook 15', 11, 14, 55999.00, 52, 4.30, 'Active'),
('Acer Aspire 5', 11, 15, 52999.00, 41, 4.20, 'Active'),
('MacBook Air M2', 11, 16, 89999.00, 22, 4.80, 'Active'),
('MSI Modern 14', 11, 17, 69999.00, 19, 4.40, 'Active'),
('Samsung Galaxy Book 4', 11, 18, 74999.00, 31, 4.50, 'Active'),
('HP 15s Laptop', 11, 19, 48999.00, 60, 4.10, 'Active'),
('Lenovo ThinkPad E14', 11, 20, 72999.00, 24, 4.60, 'Active'),
('Apple Magic Keyboard', 12, 21, 10999.00, 70, 4.60, 'Active'),
('Logitech K380 Keyboard', 12, 22, 3299.00, 125, 4.50, 'Active'),
('HP Wireless Keyboard', 12, 23, 1999.00, 90, 4.20, 'Active'),
('Dell Wireless Keyboard', 12, 24, 2499.00, 82, 4.30, 'Active'),
('Logitech MX Keys Mini', 12, 25, 8999.00, 45, 4.70, 'Active'),
('AmazonBasics Laptop Stand', 12, 26, 1499.00, 115, 4.20, 'Active'),
('Portronics Laptop Stand', 12, 27, 1299.00, 140, 4.10, 'Active'),
('Tukzer Laptop Stand', 12, 28, 1799.00, 78, 4.40, 'Active'),
('Zebronics Laptop Backpack', 13, 29, 1599.00, 105, 4.20, 'Active'),
('American Tourister Laptop Bag', 13, 30, 2499.00, 67, 4.50, 'Active'),
('LG 24 Inch Monitor', 15, 31, 11999.00, 54, 4.30, 'Active'),
('Samsung 24 Inch Monitor', 15, 32, 13999.00, 48, 4.50, 'Active'),
('Acer 27 Inch Monitor', 15, 33, 17999.00, 36, 4.40, 'Active'),
('Dell 27 Inch Monitor', 15, 34, 22999.00, 29, 4.60, 'Active'),
('BenQ 24 Inch Monitor', 15, 35, 15999.00, 44, 4.50, 'Active'),
('Logitech C920 Webcam', 27, 36, 6999.00, 58, 4.60, 'Active'),
('HP HD Webcam', 27, 37, 3299.00, 82, 4.10, 'Active'),
('Dell Full HD Webcam', 27, 38, 5499.00, 63, 4.30, 'Active'),
('Canon Pixma Printer', 28, 39, 8999.00, 47, 4.40, 'Active'),
('HP DeskJet Printer', 28, 40, 7499.00, 55, 4.20, 'Active'),
('WD 1TB External Hard Drive', 21, 41, 5499.00, 72, 4.50, 'Active'),
('Seagate 2TB External Hard Drive', 21, 42, 6899.00, 61, 4.60, 'Active'),
('Samsung 1TB SSD', 22, 43, 7999.00, 49, 4.70, 'Active'),
('Crucial 500GB SSD', 22, 44, 4299.00, 85, 4.50, 'Active'),
('Kingston 256GB SSD', 22, 45, 2999.00, 110, 4.40, 'Active'),
('SanDisk 128GB Pen Drive', 23, 46, 899.00, 150, 4.40, 'Active'),
('HP 64GB Pen Drive', 23, 47, 699.00, 180, 4.20, 'Active'),
('Samsung 128GB Memory Card', 24, 48, 1299.00, 130, 4.50, 'Active'),
('SanDisk 256GB Memory Card', 24, 49, 2299.00, 95, 4.60, 'Active'),
('Kingston 128GB Memory Card', 24, 50, 999.00, 145, 4.30, 'Active'),
('Apple iPad 10th Gen', 31, 51, 39999.00, 32, 4.70, 'Active'),
('Samsung Galaxy Tab S9', 31, 52, 54999.00, 27, 4.60, 'Active'),
('OnePlus Pad Go', 31, 53, 19999.00, 54, 4.40, 'Active'),
('Lenovo Tab M11', 31, 54, 17999.00, 66, 4.30, 'Active'),
('Redmi Pad SE', 31, 55, 14999.00, 74, 4.30, 'Active'),
('Apple Watch SE', 34, 56, 29999.00, 39, 4.60, 'Active'),
('Samsung Galaxy Watch 6', 34, 57, 24999.00, 45, 4.50, 'Active'),
('Noise ColorFit Ultra', 34, 58, 3999.00, 120, 4.20, 'Active'),
('boAt Wave Sigma', 34, 59, 1499.00, 160, 4.10, 'Active'),
('Fire-Boltt Phoenix', 34, 60, 1799.00, 135, 4.20, 'Active'),
('JBL Flip 6 Speaker', 36, 61, 9999.00, 52, 4.70, 'Active'),
('Sony SRS-XB100 Speaker', 36, 62, 4499.00, 68, 4.60, 'Active'),
('boAt Stone 1200', 36, 63, 2999.00, 105, 4.30, 'Active'),
('Marshall Emberton II', 36, 64, 16999.00, 24, 4.80, 'Active'),
('Sony WH-1000XM5', 38, 65, 29999.00, 31, 4.80, 'Active'),
('JBL Tune 760NC', 38, 66, 6999.00, 65, 4.50, 'Active'),
('boAt Rockerz 550', 38, 67, 1999.00, 130, 4.20, 'Active'),
('Sennheiser HD 450BT', 38, 68, 9999.00, 47, 4.60, 'Active'),
('Apple AirPods Pro 2', 9, 69, 24999.00, 44, 4.80, 'Active'),
('Samsung Galaxy Buds FE', 9, 70, 7999.00, 73, 4.50, 'Active'),
('LG 55 Inch Smart TV', 41, 71, 54999.00, 25, 4.50, 'Active'),
('Samsung 55 Inch QLED TV', 41, 72, 69999.00, 18, 4.70, 'Active'),
('Sony Bravia 50 Inch TV', 41, 73, 59999.00, 21, 4.60, 'Active'),
('OnePlus 43 Inch TV', 41, 74, 29999.00, 42, 4.30, 'Active'),
('TCL 55 Inch Smart TV', 41, 75, 39999.00, 36, 4.40, 'Active'),
('Amazon Fire TV Stick 4K', 43, 76, 5999.00, 92, 4.50, 'Active'),
('Google Chromecast', 43, 77, 4499.00, 80, 4.40, 'Active'),
('Epson Home Projector', 44, 78, 42999.00, 17, 4.30, 'Active'),
('Canon EOS R50 Camera', 45, 79, 69999.00, 15, 4.70, 'Active'),
('Sony Alpha ZV-E10', 45, 80, 67999.00, 19, 4.60, 'Active'),
('Samsung 253L Refrigerator', 51, 81, 28999.00, 26, 4.40, 'Active'),
('LG 260L Refrigerator', 51, 82, 31999.00, 22, 4.50, 'Active'),
('Whirlpool 265L Refrigerator', 51, 83, 29999.00, 30, 4.30, 'Active'),
('IFB 7KG Washing Machine', 52, 84, 29999.00, 24, 4.40, 'Active'),
('LG 8KG Washing Machine', 52, 85, 34999.00, 20, 4.60, 'Active'),
('Samsung 7KG Washing Machine', 52, 86, 31999.00, 27, 4.50, 'Active'),
('Voltas 1.5 Ton AC', 53, 87, 36999.00, 18, 4.40, 'Active'),
('LG 1.5 Ton Split AC', 53, 88, 42999.00, 15, 4.60, 'Active'),
('Daikin 1.5 Ton AC', 53, 89, 45999.00, 14, 4.70, 'Active'),
('Blue Star Air Cooler', 54, 90, 8999.00, 40, 4.20, 'Active'),
('Samsung Microwave Oven', 55, 91, 11999.00, 35, 4.30, 'Active'),
('LG Convection Microwave', 55, 92, 14999.00, 29, 4.50, 'Active'),
('Philips Air Fryer', 66, 93, 7999.00, 68, 4.50, 'Active'),
('Prestige Air Fryer', 66, 94, 5999.00, 75, 4.30, 'Active'),
('Bajaj Electric Kettle', 62, 95, 1499.00, 120, 4.30, 'Active'),
('Philips Electric Kettle', 62, 96, 1899.00, 105, 4.50, 'Active'),
('Prestige Mixer Grinder', 64, 97, 4999.00, 72, 4.40, 'Active'),
('Bajaj Hand Blender', 70, 98, 1799.00, 95, 4.20, 'Active'),
('Pigeon Toaster', 65, 99, 1699.00, 110, 4.30, 'Active'),
('Morphy Richards Coffee Maker', 63, 100, 7499.00, 42, 4.50, 'Active'),
('Prestige Cookware Set', 71, 101, 3999.00, 60, 4.40, 'Active'),
('Milton Dinner Set', 72, 102, 2499.00, 80, 4.30, 'Active'),
('Borosil Glass Set', 73, 103, 999.00, 125, 4.50, 'Active'),
('Tupperware Storage Set', 74, 104, 1799.00, 90, 4.40, 'Active'),
('Cello Kitchen Tool Set', 75, 105, 1299.00, 100, 4.20, 'Active'),
('Vinod Stainless Steel Cutlery', 76, 106, 1499.00, 75, 4.30, 'Active'),
('Wonderchef Bakeware Set', 77, 107, 1999.00, 58, 4.40, 'Active'),
('Milton Water Bottle', 79, 108, 699.00, 160, 4.40, 'Active'),
('Cello Lunch Box', 80, 109, 899.00, 145, 4.30, 'Active'),
('Borosil Lunch Box Set', 80, 110, 1299.00, 95, 4.50, 'Active'),
('Levis Mens T Shirt', 82, 111, 1499.00, 85, 4.40, 'Active'),
('Allen Solly Mens Shirt', 81, 112, 2299.00, 65, 4.50, 'Active'),
('Peter England Mens Trousers', 84, 113, 1999.00, 72, 4.30, 'Active'),
('Van Heusen Mens Jacket', 85, 114, 3999.00, 38, 4.40, 'Active'),
('Manyavar Mens Kurta', 86, 115, 2499.00, 45, 4.50, 'Active'),
('Biba Womens Dress', 87, 116, 2999.00, 52, 4.50, 'Active'),
('W Womens Top', 88, 117, 1799.00, 76, 4.30, 'Active'),
('FabIndia Womens Saree', 89, 118, 3499.00, 34, 4.60, 'Active'),
('Aurelia Womens Kurta', 90, 119, 1999.00, 69, 4.40, 'Active'),
('Levis Womens Jeans', 91, 120, 2799.00, 58, 4.40, 'Active'),
('Nike Mens Running Shoes', 96, 121, 6999.00, 45, 4.60, 'Active'),
('Adidas Womens Sports Shoes', 97, 122, 5999.00, 52, 4.50, 'Active'),
('Puma Kids Shoes', 98, 123, 2499.00, 70, 4.40, 'Active'),
('Skechers Sports Shoes', 99, 124, 7999.00, 31, 4.70, 'Active'),
('Bata Casual Shoes', 100, 125, 1999.00, 85, 4.30, 'Active'),
('Metro Sandals', 101, 126, 1299.00, 95, 4.30, 'Active'),
('Paragon Slippers', 102, 127, 599.00, 150, 4.20, 'Active'),
('Lavie Handbag', 103, 128, 2999.00, 48, 4.50, 'Active'),
('Skybags Backpack', 104, 129, 1999.00, 82, 4.40, 'Active'),
('Fastrack Watch', 108, 130, 2499.00, 65, 4.50, 'Active'),
('Titan Analog Watch', 108, 131, 5999.00, 42, 4.60, 'Active'),
('Ray-Ban Sunglasses', 107, 132, 8999.00, 28, 4.70, 'Active'),
('Fossil Leather Wallet', 105, 133, 2999.00, 55, 4.50, 'Active'),
('Levis Mens Belt', 106, 134, 1499.00, 90, 4.30, 'Active'),
('Mia Fashion Necklace', 109, 135, 4999.00, 25, 4.60, 'Active'),
('Lakme Face Foundation', 112, 136, 799.00, 120, 4.40, 'Active'),
('Maybelline Makeup Kit', 112, 137, 1499.00, 88, 4.50, 'Active'),
('L''Oreal Shampoo', 111, 138, 699.00, 135, 4.30, 'Active'),
('Nivea Body Lotion', 115, 139, 499.00, 150, 4.40, 'Active'),
('Gillette Shaving Kit', 119, 140, 899.00, 105, 4.50, 'Active'),
('Yonex Badminton Racket', 124, 141, 2999.00, 55, 4.60, 'Active'),
('SS Cricket Bat', 123, 142, 4999.00, 35, 4.50, 'Active'),
('Cosco Football', 124, 143, 1299.00, 75, 4.30, 'Active'),
('Nivia Basketball', 125, 144, 1499.00, 65, 4.40, 'Active'),
('Strauss Yoga Mat', 122, 145, 999.00, 110, 4.50, 'Active'),
('Adidas Fitness Dumbbells', 121, 146, 2499.00, 48, 4.40, 'Active'),
('Firefox Bicycle', 128, 147, 15999.00, 20, 4.60, 'Active'),
('Decathlon Running Belt', 129, 148, 799.00, 85, 4.30, 'Active'),
('Wildcraft Outdoor Backpack', 130, 149, 2499.00, 60, 4.50, 'Active'),
('Nike Sports Bag', 130, 150, 2999.00, 44, 4.60, 'Active');

-- ===========================================================================================================================================================================
-- Checking the  realtionships
SELECT COUNT(*) AS total_products
FROM Products;
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    s.supplier_name,
    p.price,
    p.stock_quantity,
    p.product_rating,
    p.product_status
FROM Products p
INNER JOIN Categories c
    ON p.category_id = c.category_id
INNER JOIN Suppliers s
    ON p.supplier_id = s.supplier_id
LIMIT 10;
-- ===========================================================================================================================================================================
-- Checking the count
SELECT COUNT(*) AS total_products
FROM Products;

-- ===========================================================================================================================================================================
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    s.supplier_name,
    p.price,
    p.stock_quantity
FROM Products p
INNER JOIN Categories c
    ON p.category_id = c.category_id
INNER JOIN Suppliers s
    ON p.supplier_id = s.supplier_id
LIMIT 10;
ALTER TABLE Orders AUTO_INCREMENT = 1;
-- ===========================================================================================================================================================================

-- Inserting the values of Orders Table
INSERT INTO Orders
(customer_id, order_date, order_status, total_amount)
VALUES
(151, '2025-01-05', 'Delivered', 34999.00),
(152, '2025-01-08', 'Delivered', 58999.00),
(153, '2025-01-12', 'Delivered', 24999.00),
(154, '2025-01-15', 'Shipped', 15999.00),
(155, '2025-01-18', 'Delivered', 69999.00),
(156, '2025-01-22', 'Delivered', 10999.00),
(157, '2025-01-25', 'Cancelled', 3299.00),
(158, '2025-01-28', 'Delivered', 52999.00),
(159, '2025-02-02', 'Delivered', 2999.00),
(160, '2025-02-05', 'Shipped', 17999.00),
(161, '2025-02-08', 'Delivered', 39999.00),
(162, '2025-02-11', 'Delivered', 24999.00),
(163, '2025-02-15', 'Delivered', 7999.00),
(164, '2025-02-18', 'Delivered', 13999.00),
(165, '2025-02-21', 'Shipped', 31999.00),
(166, '2025-02-25', 'Delivered', 1499.00),
(167, '2025-02-28', 'Cancelled', 6999.00),
(168, '2025-03-03', 'Delivered', 54999.00),
(169, '2025-03-07', 'Delivered', 8999.00),
(170, '2025-03-10', 'Shipped', 29999.00),
(171, '2025-03-14', 'Delivered', 7499.00),
(172, '2025-03-18', 'Delivered', 15999.00),
(173, '2025-03-21', 'Delivered', 2499.00),
(174, '2025-03-25', 'Delivered', 69999.00),
(175, '2025-03-28', 'Shipped', 19999.00),
(176, '2025-04-02', 'Delivered', 42999.00),
(177, '2025-04-05', 'Delivered', 899.00),
(178, '2025-04-08', 'Cancelled', 5999.00),
(179, '2025-04-12', 'Delivered', 31999.00),
(180, '2025-04-15', 'Shipped', 24999.00),
(181, '2025-04-18', 'Delivered', 11999.00),
(182, '2025-04-22', 'Delivered', 6999.00),
(183, '2025-04-25', 'Delivered', 14999.00),
(184, '2025-04-29', 'Delivered', 3999.00),
(185, '2025-05-03', 'Shipped', 28999.00),
(186, '2025-05-07', 'Delivered', 54999.00),
(187, '2025-05-10', 'Delivered', 7999.00),
(188, '2025-05-14', 'Delivered', 1999.00),
(189, '2025-05-18', 'Cancelled', 34999.00),
(190, '2025-05-21', 'Delivered', 42999.00),
(191, '2025-05-25', 'Delivered', 2499.00),
(192, '2025-05-29', 'Shipped', 15999.00),
(193, '2025-06-02', 'Delivered', 8999.00),
(194, '2025-06-06', 'Delivered', 69999.00),
(195, '2025-06-10', 'Delivered', 31999.00),
(196, '2025-06-14', 'Delivered', 4999.00),
(197, '2025-06-18', 'Shipped', 29999.00),
(198, '2025-06-22', 'Delivered', 17999.00),
(199, '2025-06-26', 'Delivered', 5999.00),
(200, '2025-06-30', 'Cancelled', 22999.00),
(201, '2025-07-04', 'Delivered', 52999.00),
(202, '2025-07-08', 'Delivered', 1499.00),
(203, '2025-07-12', 'Shipped', 39999.00),
(204, '2025-07-16', 'Delivered', 24999.00),
(205, '2025-07-20', 'Delivered', 7999.00),
(206, '2025-07-24', 'Delivered', 6999.00),
(207, '2025-07-28', 'Cancelled', 15999.00),
(208, '2025-08-01', 'Delivered', 29999.00),
(209, '2025-08-05', 'Delivered', 10999.00),
(210, '2025-08-09', 'Shipped', 34999.00),
(211, '2025-08-13', 'Delivered', 58999.00),
(212, '2025-08-17', 'Delivered', 1999.00),
(213, '2025-08-21', 'Delivered', 7499.00),
(214, '2025-08-25', 'Shipped', 31999.00),
(215, '2025-08-29', 'Delivered', 3999.00),
(216, '2025-09-02', 'Delivered', 54999.00),
(217, '2025-09-06', 'Cancelled', 8999.00),
(218, '2025-09-10', 'Delivered', 24999.00),
(219, '2025-09-14', 'Delivered', 6999.00),
(220, '2025-09-18', 'Shipped', 42999.00),
(221, '2025-09-22', 'Delivered', 17999.00),
(222, '2025-09-26', 'Delivered', 11999.00),
(223, '2025-09-30', 'Delivered', 2999.00),
(224, '2025-10-04', 'Delivered', 69999.00),
(225, '2025-10-08', 'Shipped', 28999.00),
(226, '2025-10-12', 'Delivered', 15999.00),
(227, '2025-10-16', 'Delivered', 2499.00),
(228, '2025-10-20', 'Cancelled', 5999.00),
(229, '2025-10-24', 'Delivered', 31999.00),
(230, '2025-10-28', 'Delivered', 7999.00),
(231, '2025-11-01', 'Shipped', 54999.00),
(232, '2025-11-05', 'Delivered', 9999.00),
(233, '2025-11-09', 'Delivered', 1999.00),
(234, '2025-11-13', 'Delivered', 39999.00),
(235, '2025-11-17', 'Delivered', 14999.00),
(236, '2025-11-21', 'Shipped', 6999.00),
(237, '2025-11-25', 'Delivered', 24999.00),
(238, '2025-11-29', 'Cancelled', 17999.00),
(239, '2025-12-03', 'Delivered', 42999.00),
(240, '2025-12-07', 'Delivered', 8999.00),
(241, '2025-12-11', 'Delivered', 31999.00),
(242, '2025-12-15', 'Shipped', 69999.00),
(243, '2025-12-19', 'Delivered', 2499.00),
(244, '2025-12-23', 'Delivered', 15999.00),
(245, '2025-12-27', 'Cancelled', 54999.00),
(246, '2026-01-03', 'Delivered', 7999.00),
(247, '2026-01-07', 'Delivered', 29999.00),
(248, '2026-01-11', 'Shipped', 11999.00),
(249, '2026-01-15', 'Delivered', 34999.00),
(250, '2026-01-19', 'Delivered', 4999.00),
(251, '2026-01-23', 'Delivered', 58999.00),
(252, '2026-01-27', 'Shipped', 24999.00),
(253, '2026-01-31', 'Delivered', 8999.00),
(254, '2026-02-04', 'Delivered', 6999.00),
(255, '2026-02-08', 'Cancelled', 31999.00),
(256, '2026-02-12', 'Delivered', 17999.00),
(257, '2026-02-16', 'Delivered', 54999.00),
(258, '2026-02-20', 'Shipped', 3999.00),
(259, '2026-02-24', 'Delivered', 1499.00),
(260, '2026-02-28', 'Delivered', 42999.00),
(261, '2026-03-04', 'Delivered', 24999.00),
(262, '2026-03-08', 'Shipped', 7999.00),
(263, '2026-03-12', 'Delivered', 29999.00),
(264, '2026-03-16', 'Delivered', 15999.00),
(265, '2026-03-20', 'Cancelled', 6999.00),
(266, '2026-03-24', 'Delivered', 52999.00),
(267, '2026-03-28', 'Delivered', 11999.00),
(268, '2026-04-01', 'Shipped', 34999.00),
(269, '2026-04-05', 'Delivered', 1999.00),
(270, '2026-04-09', 'Delivered', 28999.00),
(271, '2026-04-13', 'Delivered', 7499.00),
(272, '2026-04-17', 'Shipped', 54999.00),
(273, '2026-04-21', 'Delivered', 2499.00),
(274, '2026-04-25', 'Delivered', 31999.00),
(275, '2026-04-29', 'Cancelled', 8999.00),
(276, '2026-05-03', 'Delivered', 6999.00),
(277, '2026-05-07', 'Delivered', 39999.00),
(278, '2026-05-11', 'Shipped', 17999.00),
(279, '2026-05-15', 'Delivered', 15999.00),
(280, '2026-05-19', 'Delivered', 29999.00),
(281, '2026-05-23', 'Delivered', 5999.00),
(282, '2026-05-27', 'Shipped', 42999.00),
(283, '2026-05-31', 'Delivered', 10999.00),
(284, '2026-06-04', 'Delivered', 24999.00),
(285, '2026-06-08', 'Cancelled', 69999.00),
(286, '2026-06-12', 'Delivered', 7999.00),
(287, '2026-06-16', 'Delivered', 31999.00),
(288, '2026-06-20', 'Shipped', 14999.00),
(289, '2026-06-24', 'Delivered', 4999.00),
(290, '2026-06-28', 'Delivered', 54999.00),
(291, '2026-07-02', 'Delivered', 8999.00),
(292, '2026-07-06', 'Shipped', 24999.00),
(293, '2026-07-10', 'Delivered', 3999.00),
(294, '2026-07-14', 'Delivered', 6999.00),
(295, '2026-07-18', 'Cancelled', 15999.00),
(296, '2026-07-22', 'Delivered', 29999.00),
(297, '2026-07-26', 'Delivered', 17999.00),
(298, '2026-07-30', 'Shipped', 42999.00),
(299, '2026-08-03', 'Delivered', 7499.00),
(300, '2026-08-07', 'Delivered', 52999.00);


-- Checking the count
SELECT COUNT(*) AS total_orders
FROM Orders;

-- CHecking the rows through joins
SELECT
    o.order_id,
    o.customer_id,
    c.first_name,
    c.last_name,
    o.order_date,
    o.order_status,
    o.total_amount
FROM Orders o
INNER JOIN Customers c
    ON o.customer_id = c.customer_id
LIMIT 10;
-- ===========================================================================================================================================================================
show tables;

-- Order_Details
SELECT COUNT(*) AS total_products FROM Products;
SELECT COUNT(*) AS total_orders FROM Orders; 


-- Inserting the values of Orders_Details Table
INSERT INTO Order_Details
(order_id, product_id, quantity, unit_price, discount)
VALUES
(1,1,2,499.00,20.00),
(2,2,1,799.00,30.00),
(3,3,3,299.00,15.00),
(4,4,1,1299.00,50.00),
(5,5,2,599.00,25.00),
(6,6,1,899.00,40.00),
(7,7,2,349.00,10.00),
(8,8,1,1499.00,75.00),
(9,9,3,249.00,15.00),
(10,10,1,999.00,50.00),
(11,11,2,699.00,20.00),
(12,12,1,1199.00,60.00),
(13,13,2,449.00,15.00),
(14,14,1,1599.00,80.00),
(15,15,3,199.00,10.00),
(16,16,1,749.00,25.00),
(17,17,2,549.00,20.00),
(18,18,1,899.00,45.00),
(19,19,2,399.00,15.00),
(20,20,1,1299.00,55.00),
(21,21,2,599.00,20.00),
(22,22,1,999.00,40.00),
(23,23,3,299.00,15.00),
(24,24,1,1499.00,70.00),
(25,25,2,449.00,20.00),
(26,26,1,799.00,30.00),
(27,27,2,349.00,10.00),
(28,28,1,1199.00,50.00),
(29,29,3,249.00,15.00),
(30,30,1,899.00,35.00),
(31,31,2,699.00,25.00),
(32,32,1,1299.00,60.00),
(33,33,2,499.00,20.00),
(34,34,1,1599.00,80.00),
(35,35,3,199.00,10.00),
(36,36,1,749.00,25.00),
(37,37,2,549.00,20.00),
(38,38,1,899.00,40.00),
(39,39,2,399.00,15.00),
(40,40,1,1299.00,55.00),
(41,41,2,599.00,20.00),
(42,42,1,999.00,45.00),
(43,43,3,299.00,15.00),
(44,44,1,1499.00,75.00),
(45,45,2,449.00,20.00),
(46,46,1,799.00,30.00),
(47,47,2,349.00,10.00),
(48,48,1,1199.00,50.00),
(49,49,3,249.00,15.00),
(50,50,1,899.00,40.00),
(51,51,2,699.00,25.00),
(52,52,1,1299.00,60.00),
(53,53,2,499.00,20.00),
(54,54,1,1599.00,80.00),
(55,55,3,199.00,10.00),
(56,56,1,749.00,25.00),
(57,57,2,549.00,20.00),
(58,58,1,899.00,40.00),
(59,59,2,399.00,15.00),
(60,60,1,1299.00,55.00),
(61,61,2,599.00,20.00),
(62,62,1,999.00,45.00),
(63,63,3,299.00,15.00),
(64,64,1,1499.00,75.00),
(65,65,2,449.00,20.00),
(66,66,1,799.00,30.00),
(67,67,2,349.00,10.00),
(68,68,1,1199.00,50.00),
(69,69,3,249.00,15.00),
(70,70,1,899.00,40.00),
(71,71,2,699.00,25.00),
(72,72,1,1299.00,60.00),
(73,73,2,499.00,20.00),
(74,74,1,1599.00,80.00),
(75,75,3,199.00,10.00),
(76,76,1,749.00,25.00),
(77,77,2,549.00,20.00),
(78,78,1,899.00,40.00),
(79,79,2,399.00,15.00),
(80,80,1,1299.00,55.00),
(81,81,2,599.00,20.00),
(82,82,1,999.00,45.00),
(83,83,3,299.00,15.00),
(84,84,1,1499.00,75.00),
(85,85,2,449.00,20.00),
(86,86,1,799.00,30.00),
(87,87,2,349.00,10.00),
(88,88,1,1199.00,50.00),
(89,89,3,249.00,15.00),
(90,90,1,899.00,40.00),
(91,91,2,699.00,25.00),
(92,92,1,1299.00,60.00),
(93,93,2,499.00,20.00),
(94,94,1,1599.00,80.00),
(95,95,3,199.00,10.00),
(96,96,1,749.00,25.00),
(97,97,2,549.00,20.00),
(98,98,1,899.00,40.00),
(99,99,2,399.00,15.00),
(100,100,1,1299.00,55.00),
(101,101,2,599.00,20.00),
(102,102,1,999.00,45.00),
(103,103,3,299.00,15.00),
(104,104,1,1499.00,75.00),
(105,105,2,449.00,20.00),
(106,106,1,799.00,30.00),
(107,107,2,349.00,10.00),
(108,108,1,1199.00,50.00),
(109,109,3,249.00,15.00),
(110,110,1,899.00,40.00),
(111,111,2,699.00,25.00),
(112,112,1,1299.00,60.00),
(113,113,2,499.00,20.00),
(114,114,1,1599.00,80.00),
(115,115,3,199.00,10.00),
(116,116,1,749.00,25.00),
(117,117,2,549.00,20.00),
(118,118,1,899.00,40.00),
(119,119,2,399.00,15.00),
(120,120,1,1299.00,55.00),
(121,121,2,599.00,20.00),
(122,122,1,999.00,45.00),
(123,123,3,299.00,15.00),
(124,124,1,1499.00,75.00),
(125,125,2,449.00,20.00),
(126,126,1,799.00,30.00),
(127,127,2,349.00,10.00),
(128,128,1,1199.00,50.00),
(129,129,3,249.00,15.00),
(130,130,1,899.00,40.00),
(131,131,2,699.00,25.00),
(132,132,1,1299.00,60.00),
(133,133,2,499.00,20.00),
(134,134,1,1599.00,80.00),
(135,135,3,199.00,10.00),
(136,136,1,749.00,25.00),
(137,137,2,549.00,20.00),
(138,138,1,899.00,40.00),
(139,139,2,399.00,15.00),
(140,140,1,1299.00,55.00),
(141,141,2,599.00,20.00),
(142,142,1,999.00,45.00),
(143,143,3,299.00,15.00),
(144,144,1,1499.00,75.00),
(145,145,2,449.00,20.00),
(146,146,1,799.00,30.00),
(147,147,2,349.00,10.00),
(148,148,1,1199.00,50.00),
(149,149,3,249.00,15.00),
(150,150,1,899.00,40.00);

-- Checking count of rows
SELECT COUNT(*) AS total_order_details
FROM Order_Details;

-- Checking the Inner Join Validation
SELECT
    od.order_detail_id,
    od.order_id,
    od.product_id,
    p.product_name,
    od.quantity,
    od.unit_price,
    od.discount
FROM Order_Details od
INNER JOIN Products p
    ON od.product_id = p.product_id limit 10;
 -- ===========================================================================================================================================================================   
-- Payments
USE ecommerce_analytics;

-- Inserting the values of Payments Table
INSERT INTO Payments
(order_id, payment_date, payment_method, payment_status, amount)
VALUES
(1,'2025-01-05','UPI','Paid',978.00),
(2,'2025-01-07','Credit Card','Paid',769.00),
(3,'2025-01-10','Debit Card','Paid',882.00),
(4,'2025-01-15','UPI','Paid',1249.00),
(5,'2025-01-18','Credit Card','Paid',1173.00),
(6,'2025-01-22','Net Banking','Paid',859.00),
(7,'2025-01-25','UPI','Paid',688.00),
(8,'2025-01-28','Credit Card','Paid',1424.00),
(9,'2025-02-02','Debit Card','Paid',732.00),
(10,'2025-02-05','UPI','Paid',949.00),
(11,'2025-02-08','Credit Card','Paid',1378.00),
(12,'2025-02-12','UPI','Paid',1139.00),
(13,'2025-02-15','Debit Card','Paid',883.00),
(14,'2025-02-18','Credit Card','Paid',1519.00),
(15,'2025-02-21','UPI','Paid',587.00),
(16,'2025-02-24','Net Banking','Paid',724.00),
(17,'2025-02-27','UPI','Paid',1078.00),
(18,'2025-03-02','Credit Card','Paid',854.00),
(19,'2025-03-05','Debit Card','Paid',783.00),
(20,'2025-03-08','UPI','Paid',1244.00),
(21,'2025-03-11','Credit Card','Paid',1178.00),
(22,'2025-03-14','UPI','Paid',954.00),
(23,'2025-03-17','Debit Card','Paid',882.00),
(24,'2025-03-20','Credit Card','Paid',1429.00),
(25,'2025-03-23','UPI','Paid',878.00),
(26,'2025-03-26','Net Banking','Paid',769.00),
(27,'2025-03-29','UPI','Paid',688.00),
(28,'2025-04-01','Credit Card','Paid',1149.00),
(29,'2025-04-04','Debit Card','Paid',732.00),
(30,'2025-04-07','UPI','Paid',859.00),
(31,'2025-04-10','Credit Card','Paid',1373.00),
(32,'2025-04-13','UPI','Paid',1239.00),
(33,'2025-04-16','Debit Card','Paid',978.00),
(34,'2025-04-19','Credit Card','Paid',1519.00),
(35,'2025-04-22','UPI','Paid',587.00),
(36,'2025-04-25','Net Banking','Paid',724.00),
(37,'2025-04-28','UPI','Paid',1078.00),
(38,'2025-05-01','Credit Card','Paid',859.00),
(39,'2025-05-04','Debit Card','Paid',783.00),
(40,'2025-05-07','UPI','Paid',1244.00),
(41,'2025-05-10','Credit Card','Paid',1178.00),
(42,'2025-05-13','UPI','Paid',954.00),
(43,'2025-05-16','Debit Card','Paid',882.00),
(44,'2025-05-19','Credit Card','Paid',1424.00),
(45,'2025-05-22','UPI','Paid',878.00),
(46,'2025-05-25','Net Banking','Paid',769.00),
(47,'2025-05-28','UPI','Paid',688.00),
(48,'2025-05-31','Credit Card','Paid',1149.00),
(49,'2025-06-03','Debit Card','Paid',732.00),
(50,'2025-06-06','UPI','Paid',859.00),
(51,'2025-06-09','Credit Card','Paid',1373.00),
(52,'2025-06-12','UPI','Paid',1239.00),
(53,'2025-06-15','Debit Card','Paid',978.00),
(54,'2025-06-18','Credit Card','Paid',1519.00),
(55,'2025-06-21','UPI','Paid',587.00),
(56,'2025-06-24','Net Banking','Paid',724.00),
(57,'2025-06-27','UPI','Paid',1078.00),
(58,'2025-06-30','Credit Card','Paid',859.00),
(59,'2025-07-03','Debit Card','Paid',783.00),
(60,'2025-07-06','UPI','Paid',1244.00),
(61,'2025-07-09','Credit Card','Paid',1178.00),
(62,'2025-07-12','UPI','Paid',954.00),
(63,'2025-07-15','Debit Card','Paid',882.00),
(64,'2025-07-18','Credit Card','Paid',1424.00),
(65,'2025-07-21','UPI','Paid',878.00),
(66,'2025-07-24','Net Banking','Paid',769.00),
(67,'2025-07-27','UPI','Paid',688.00),
(68,'2025-07-30','Credit Card','Paid',1149.00),
(69,'2025-08-02','Debit Card','Paid',732.00),
(70,'2025-08-05','UPI','Paid',859.00),
(71,'2025-08-08','Credit Card','Paid',1373.00),
(72,'2025-08-11','UPI','Paid',1239.00),
(73,'2025-08-14','Debit Card','Paid',978.00),
(74,'2025-08-17','Credit Card','Paid',1519.00),
(75,'2025-08-20','UPI','Paid',587.00),
(76,'2025-08-23','Net Banking','Paid',724.00),
(77,'2025-08-26','UPI','Paid',1078.00),
(78,'2025-08-29','Credit Card','Paid',859.00),
(79,'2025-09-01','Debit Card','Paid',783.00),
(80,'2025-09-04','UPI','Paid',1244.00),
(81,'2025-09-07','Credit Card','Paid',1178.00),
(82,'2025-09-10','UPI','Paid',954.00),
(83,'2025-09-13','Debit Card','Paid',882.00),
(84,'2025-09-16','Credit Card','Paid',1424.00),
(85,'2025-09-19','UPI','Paid',878.00),
(86,'2025-09-22','Net Banking','Paid',769.00),
(87,'2025-09-25','UPI','Paid',688.00),
(88,'2025-09-28','Credit Card','Paid',1149.00),
(89,'2025-10-01','Debit Card','Paid',732.00),
(90,'2025-10-04','UPI','Paid',859.00),
(91,'2025-10-07','Credit Card','Paid',1373.00),
(92,'2025-10-10','UPI','Paid',1239.00),
(93,'2025-10-13','Debit Card','Paid',978.00),
(94,'2025-10-16','Credit Card','Paid',1519.00),
(95,'2025-10-19','UPI','Paid',587.00),
(96,'2025-10-22','Net Banking','Paid',724.00),
(97,'2025-10-25','UPI','Paid',1078.00),
(98,'2025-10-28','Credit Card','Paid',859.00),
(99,'2025-10-31','Debit Card','Paid',783.00),
(100,'2025-11-03','UPI','Paid',1244.00),
(101,'2025-11-06','Credit Card','Paid',1178.00),
(102,'2025-11-09','UPI','Paid',954.00),
(103,'2025-11-12','Debit Card','Paid',882.00),
(104,'2025-11-15','Credit Card','Paid',1424.00),
(105,'2025-11-18','UPI','Paid',878.00),
(106,'2025-11-21','Net Banking','Paid',769.00),
(107,'2025-11-24','UPI','Paid',688.00),
(108,'2025-11-27','Credit Card','Paid',1149.00),
(109,'2025-11-30','Debit Card','Paid',732.00),
(110,'2025-12-03','UPI','Paid',859.00),
(111,'2025-12-06','Credit Card','Paid',1373.00),
(112,'2025-12-09','UPI','Paid',1239.00),
(113,'2025-12-12','Debit Card','Paid',978.00),
(114,'2025-12-15','Credit Card','Paid',1519.00),
(115,'2025-12-18','UPI','Paid',587.00),
(116,'2025-12-21','Net Banking','Paid',724.00),
(117,'2025-12-24','UPI','Paid',1078.00),
(118,'2025-12-27','Credit Card','Paid',859.00),
(119,'2025-12-30','Debit Card','Paid',783.00),
(120,'2026-01-02','UPI','Paid',1244.00),
(121,'2026-01-05','Credit Card','Paid',1178.00),
(122,'2026-01-08','UPI','Paid',954.00),
(123,'2026-01-11','Debit Card','Paid',882.00),
(124,'2026-01-14','Credit Card','Paid',1424.00),
(125,'2026-01-17','UPI','Paid',878.00),
(126,'2026-01-20','Net Banking','Paid',769.00),
(127,'2026-01-23','UPI','Paid',688.00),
(128,'2026-01-26','Credit Card','Paid',1149.00),
(129,'2026-01-29','Debit Card','Paid',732.00),
(130,'2026-02-01','UPI','Paid',859.00),
(131,'2026-02-04','Credit Card','Paid',1373.00),
(132,'2026-02-07','UPI','Paid',1239.00),
(133,'2026-02-10','Debit Card','Paid',978.00),
(134,'2026-02-13','Credit Card','Paid',1519.00),
(135,'2026-02-16','UPI','Paid',587.00),
(136,'2026-02-19','Net Banking','Paid',724.00),
(137,'2026-02-22','UPI','Paid',1078.00),
(138,'2026-02-25','Credit Card','Paid',859.00),
(139,'2026-02-28','Debit Card','Paid',783.00),
(140,'2026-03-03','UPI','Paid',1244.00),
(141,'2026-03-06','Credit Card','Paid',1178.00),
(142,'2026-03-09','UPI','Paid',954.00),
(143,'2026-03-12','Debit Card','Paid',882.00),
(144,'2026-03-15','Credit Card','Paid',1424.00),
(145,'2026-03-18','UPI','Paid',878.00),
(146,'2026-03-21','Net Banking','Paid',769.00),
(147,'2026-03-24','UPI','Paid',688.00),
(148,'2026-03-27','Credit Card','Paid',1149.00),
(149,'2026-03-30','Debit Card','Paid',732.00),
(150,'2026-04-02','UPI','Paid',859.00);

-- Checking the Count of rows
SELECT COUNT(*) AS total_payments
FROM Payments;

-- Checking the Validation of Inner Join
SELECT
    p.payment_id,
    p.order_id,
    o.customer_id,
    o.order_date,
    p.payment_method,
    p.payment_status,
    p.amount
FROM Payments p
INNER JOIN Orders o
    ON p.order_id = o.order_id
LIMIT 10;
-- ===========================================================================================================================================================================
-- Shipping
USE ecommerce_analytics;
-- Inserting the values of Shipping Table
INSERT INTO Shipping
(order_id, shipping_date, delivery_date, shipping_method, shipping_status, shipping_cost)
VALUES
(1,'2025-01-06','2025-01-09','Standard','Delivered',60.00),
(2,'2025-01-08','2025-01-11','Express','Delivered',100.00),
(3,'2025-01-11','2025-01-15','Standard','Delivered',70.00),
(4,'2025-01-16','2025-01-19','Express','Delivered',120.00),
(5,'2025-01-19','2025-01-23','Standard','Delivered',65.00),
(6,'2025-01-23','2025-01-26','Express','Delivered',110.00),
(7,'2025-01-26','2025-01-30','Standard','Delivered',75.00),
(8,'2025-01-29','2025-02-01','Express','Delivered',130.00),
(9,'2025-02-03','2025-02-07','Standard','Delivered',60.00),
(10,'2025-02-06','2025-02-09','Express','Delivered',100.00),
(11,'2025-02-09','2025-02-13','Standard','Delivered',70.00),
(12,'2025-02-13','2025-02-16','Express','Delivered',120.00),
(13,'2025-02-16','2025-02-20','Standard','Delivered',65.00),
(14,'2025-02-19','2025-02-22','Express','Delivered',110.00),
(15,'2025-02-22','2025-02-26','Standard','Delivered',75.00),
(16,'2025-02-25','2025-02-28','Express','Delivered',130.00),
(17,'2025-02-28','2025-03-03','Standard','Delivered',60.00),
(18,'2025-03-03','2025-03-07','Express','Delivered',100.00),
(19,'2025-03-06','2025-03-09','Standard','Delivered',70.00),
(20,'2025-03-09','2025-03-12','Express','Delivered',120.00),
(21,'2025-03-12','2025-03-16','Standard','Delivered',65.00),
(22,'2025-03-15','2025-03-18','Express','Delivered',110.00),
(23,'2025-03-18','2025-03-22','Standard','Delivered',75.00),
(24,'2025-03-21','2025-03-24','Express','Delivered',130.00),
(25,'2025-03-24','2025-03-28','Standard','Delivered',60.00),
(26,'2025-03-27','2025-03-30','Express','Delivered',100.00),
(27,'2025-03-30','2025-04-03','Standard','Delivered',70.00),
(28,'2025-04-02','2025-04-05','Express','Delivered',120.00),
(29,'2025-04-05','2025-04-09','Standard','Delivered',65.00),
(30,'2025-04-08','2025-04-11','Express','Delivered',110.00),
(31,'2025-04-11','2025-04-15','Standard','Delivered',75.00),
(32,'2025-04-14','2025-04-17','Express','Delivered',130.00),
(33,'2025-04-17','2025-04-21','Standard','Delivered',60.00),
(34,'2025-04-20','2025-04-23','Express','Delivered',100.00),
(35,'2025-04-23','2025-04-27','Standard','Delivered',70.00),
(36,'2025-04-26','2025-04-29','Express','Delivered',120.00),
(37,'2025-04-29','2025-05-03','Standard','Delivered',65.00),
(38,'2025-05-02','2025-05-05','Express','Delivered',110.00),
(39,'2025-05-05','2025-05-09','Standard','Delivered',75.00),
(40,'2025-05-08','2025-05-11','Express','Delivered',130.00),
(41,'2025-05-11','2025-05-15','Standard','Delivered',60.00),
(42,'2025-05-14','2025-05-17','Express','Delivered',100.00),
(43,'2025-05-17','2025-05-21','Standard','Delivered',70.00),
(44,'2025-05-20','2025-05-23','Express','Delivered',120.00),
(45,'2025-05-23','2025-05-27','Standard','Delivered',65.00),
(46,'2025-05-26','2025-05-29','Express','Delivered',110.00),
(47,'2025-05-29','2025-06-02','Standard','Delivered',75.00),
(48,'2025-06-01','2025-06-04','Express','Delivered',130.00),
(49,'2025-06-04','2025-06-08','Standard','Delivered',60.00),
(50,'2025-06-07','2025-06-10','Express','Delivered',100.00),
(51,'2025-06-10','2025-06-14','Standard','Delivered',70.00),
(52,'2025-06-13','2025-06-16','Express','Delivered',120.00),
(53,'2025-06-16','2025-06-20','Standard','Delivered',65.00),
(54,'2025-06-19','2025-06-22','Express','Delivered',110.00),
(55,'2025-06-22','2025-06-26','Standard','Delivered',75.00),
(56,'2025-06-25','2025-06-28','Express','Delivered',130.00),
(57,'2025-06-28','2025-07-02','Standard','Delivered',60.00),
(58,'2025-07-01','2025-07-04','Express','Delivered',100.00),
(59,'2025-07-04','2025-07-08','Standard','Delivered',70.00),
(60,'2025-07-07','2025-07-10','Express','Delivered',120.00),
(61,'2025-07-10','2025-07-14','Standard','Delivered',65.00),
(62,'2025-07-13','2025-07-16','Express','Delivered',110.00),
(63,'2025-07-16','2025-07-20','Standard','Delivered',75.00),
(64,'2025-07-19','2025-07-22','Express','Delivered',130.00),
(65,'2025-07-22','2025-07-26','Standard','Delivered',60.00),
(66,'2025-07-25','2025-07-28','Express','Delivered',100.00),
(67,'2025-07-28','2025-08-01','Standard','Delivered',70.00),
(68,'2025-07-31','2025-08-03','Express','Delivered',120.00),
(69,'2025-08-03','2025-08-07','Standard','Delivered',65.00),
(70,'2025-08-06','2025-08-09','Express','Delivered',110.00),
(71,'2025-08-09','2025-08-13','Standard','Delivered',75.00),
(72,'2025-08-12','2025-08-15','Express','Delivered',130.00),
(73,'2025-08-15','2025-08-19','Standard','Delivered',60.00),
(74,'2025-08-18','2025-08-21','Express','Delivered',100.00),
(75,'2025-08-21','2025-08-25','Standard','Delivered',70.00),
(76,'2025-08-24','2025-08-27','Express','Delivered',120.00),
(77,'2025-08-27','2025-08-31','Standard','Delivered',65.00),
(78,'2025-08-30','2025-09-02','Express','Delivered',110.00),
(79,'2025-09-02','2025-09-06','Standard','Delivered',75.00),
(80,'2025-09-05','2025-09-08','Express','Delivered',130.00),
(81,'2025-09-08','2025-09-12','Standard','Delivered',60.00),
(82,'2025-09-11','2025-09-14','Express','Delivered',100.00),
(83,'2025-09-14','2025-09-18','Standard','Delivered',70.00),
(84,'2025-09-17','2025-09-20','Express','Delivered',120.00),
(85,'2025-09-20','2025-09-24','Standard','Delivered',65.00),
(86,'2025-09-23','2025-09-26','Express','Delivered',110.00),
(87,'2025-09-26','2025-09-30','Standard','Delivered',75.00),
(88,'2025-09-29','2025-10-02','Express','Delivered',130.00),
(89,'2025-10-02','2025-10-06','Standard','Delivered',60.00),
(90,'2025-10-05','2025-10-08','Express','Delivered',100.00),
(91,'2025-10-08','2025-10-12','Standard','Delivered',70.00),
(92,'2025-10-11','2025-10-14','Express','Delivered',120.00),
(93,'2025-10-14','2025-10-18','Standard','Delivered',65.00),
(94,'2025-10-17','2025-10-20','Express','Delivered',110.00),
(95,'2025-10-20','2025-10-24','Standard','Delivered',75.00),
(96,'2025-10-23','2025-10-26','Express','Delivered',130.00),
(97,'2025-10-26','2025-10-30','Standard','Delivered',60.00),
(98,'2025-10-29','2025-11-01','Express','Delivered',100.00),
(99,'2025-11-01','2025-11-05','Standard','Delivered',70.00),
(100,'2025-11-04','2025-11-07','Express','Delivered',120.00),
(101,'2025-11-07','2025-11-11','Standard','Delivered',65.00),
(102,'2025-11-10','2025-11-13','Express','Delivered',110.00),
(103,'2025-11-13','2025-11-17','Standard','Delivered',75.00),
(104,'2025-11-16','2025-11-19','Express','Delivered',130.00),
(105,'2025-11-19','2025-11-23','Standard','Delivered',60.00),
(106,'2025-11-22','2025-11-25','Express','Delivered',100.00),
(107,'2025-11-25','2025-11-29','Standard','Delivered',70.00),
(108,'2025-11-28','2025-12-01','Express','Delivered',120.00),
(109,'2025-12-01','2025-12-05','Standard','Delivered',65.00),
(110,'2025-12-04','2025-12-07','Express','Delivered',110.00),
(111,'2025-12-07','2025-12-11','Standard','Delivered',75.00),
(112,'2025-12-10','2025-12-13','Express','Delivered',130.00),
(113,'2025-12-13','2025-12-17','Standard','Delivered',60.00),
(114,'2025-12-16','2025-12-19','Express','Delivered',100.00),
(115,'2025-12-19','2025-12-23','Standard','Delivered',70.00),
(116,'2025-12-22','2025-12-25','Express','Delivered',120.00),
(117,'2025-12-25','2025-12-29','Standard','Delivered',65.00),
(118,'2025-12-28','2025-12-31','Express','Delivered',110.00),
(119,'2025-12-31','2026-01-04','Standard','Delivered',75.00),
(120,'2026-01-03','2026-01-06','Express','Delivered',130.00),
(121,'2026-01-06','2026-01-10','Standard','Delivered',60.00),
(122,'2026-01-09','2026-01-12','Express','Delivered',100.00),
(123,'2026-01-12','2026-01-16','Standard','Delivered',70.00),
(124,'2026-01-15','2026-01-18','Express','Delivered',120.00),
(125,'2026-01-18','2026-01-22','Standard','Delivered',65.00),
(126,'2026-01-21','2026-01-24','Express','Delivered',110.00),
(127,'2026-01-24','2026-01-28','Standard','Delivered',75.00),
(128,'2026-01-27','2026-01-30','Express','Delivered',130.00),
(129,'2026-01-30','2026-02-03','Standard','Delivered',60.00),
(130,'2026-02-02','2026-02-05','Express','Delivered',100.00),
(131,'2026-02-05','2026-02-09','Standard','Delivered',70.00),
(132,'2026-02-08','2026-02-11','Express','Delivered',120.00),
(133,'2026-02-11','2026-02-15','Standard','Delivered',65.00),
(134,'2026-02-14','2026-02-17','Express','Delivered',110.00),
(135,'2026-02-17','2026-02-21','Standard','Delivered',75.00),
(136,'2026-02-20','2026-02-23','Express','Delivered',130.00),
(137,'2026-02-23','2026-02-27','Standard','Delivered',60.00),
(138,'2026-02-26','2026-03-01','Express','Delivered',100.00),
(139,'2026-03-01','2026-03-05','Standard','Delivered',70.00),
(140,'2026-03-04','2026-03-07','Express','Delivered',120.00),
(141,'2026-03-07','2026-03-11','Standard','Delivered',65.00),
(142,'2026-03-10','2026-03-13','Express','Delivered',110.00),
(143,'2026-03-13','2026-03-17','Standard','Delivered',75.00),
(144,'2026-03-16','2026-03-19','Express','Delivered',130.00),
(145,'2026-03-19','2026-03-23','Standard','Delivered',60.00),
(146,'2026-03-22','2026-03-25','Express','Delivered',100.00),
(147,'2026-03-25','2026-03-29','Standard','Delivered',70.00),
(148,'2026-03-28','2026-03-31','Express','Delivered',120.00),
(149,'2026-03-31','2026-04-04','Standard','Delivered',65.00),
(150,'2026-04-03','2026-04-06','Express','Delivered',110.00);

-- Checking the count of Rows
SELECT COUNT(*) AS total_shipping
FROM Shipping;

-- Checking the Validation
SELECT
    s.shipping_id,
    s.order_id,
    o.order_date,
    s.shipping_date,
    s.delivery_date,
    s.shipping_method,
    s.shipping_status,
    s.shipping_cost
FROM Shipping s
INNER JOIN Orders o
    ON s.order_id = o.order_id
LIMIT 10;
-- ===========================================================================================================================================================================
-- Checking all table the rows are correct or not
USE ecommerce_analytics;
SELECT 'Customers' AS table_name, COUNT(*) AS total_rows FROM Customers
UNION ALL
SELECT 'Addresses', COUNT(*) FROM Addresses
UNION ALL
SELECT 'Categories', COUNT(*) FROM Categories
UNION ALL
SELECT 'Suppliers', COUNT(*) FROM Suppliers
UNION ALL
SELECT 'Products', COUNT(*) FROM Products
UNION ALL
SELECT 'Orders', COUNT(*) FROM Orders
UNION ALL
SELECT 'Order_Details', COUNT(*) FROM Order_Details
UNION ALL
SELECT 'Payments', COUNT(*) FROM Payments
UNION ALL
SELECT 'Shipping', COUNT(*) FROM Shipping;

-- ===========================================================================================================================================================================
-- ===========================================================================================================================================================================
-- Queries
-- Inner Join
-- Query 1: Customers and Orders
-- Shows which customer placed each order.
SELECT
    o.order_id,
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_date,
    o.order_status,
    o.total_amount
FROM Orders o
INNER JOIN Customers c
    ON o.customer_id = c.customer_id;
-- ===========================================================================================================================================================================
-- Query 2: Products with Categories and Suppliers
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    s.supplier_name,
    p.price,
    p.stock_quantity
FROM Products p
INNER JOIN Categories c
    ON p.category_id = c.category_id
INNER JOIN Suppliers s
    ON p.supplier_id = s.supplier_id;
-- ===========================================================================================================================================================================  
-- Query 3: Order details with product information
SELECT
    od.order_detail_id,
    od.order_id,
    p.product_name,
    od.quantity,
    od.unit_price,
    od.discount,
    (od.quantity * od.unit_price - od.discount) AS net_amount
FROM Order_Details od
INNER JOIN Products p
    ON od.product_id = p.product_id;
-- ===========================================================================================================================================================================
-- 2.LEFT JOIN Queries:
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.city,
    a.state,
    a.pincode
FROM Customers c
LEFT JOIN Addresses a
    ON c.customer_id = a.customer_id;
-- ===========================================================================================================================================================================    
-- Query: Orders with payment information:
SELECT
    o.order_id,
    o.order_date,
    o.order_status,
    o.total_amount,
    p.payment_method,
    p.payment_status,
    p.amount
FROM Orders o
LEFT JOIN Payments p
    ON o.order_id = p.order_id;
-- ===========================================================================================================================================================================
    
-- RIGHT JOIN — Products and Categories
SELECT
    c.category_id,
    c.category_name,
    p.product_id,
    p.product_name,
    p.price
FROM Products p
RIGHT JOIN Categories c
    ON p.category_id = c.category_id;
-- ===========================================================================================================================================================================
-- ===========================================================================================================================================================================
    
-- Group By
-- Orders by Order Status
SELECT
    order_status,
    COUNT(*) AS order_count
FROM Orders
GROUP BY order_status;
-- ===========================================================================================================================================================================
-- Sales by Order Status
SELECT
    order_status,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_sales,
    AVG(total_amount) AS average_order_value
FROM Orders
GROUP BY order_status;
-- ===========================================================================================================================================================================
-- Products by Category:
SELECT
    c.category_name,
    COUNT(p.product_id) AS total_products
FROM Categories c
LEFT JOIN Products p
    ON c.category_id = p.category_id
GROUP BY
    c.category_id,
    c.category_name
ORDER BY total_products DESC;

-- ===========================================================================================================================================================================
-- ===========================================================================================================================================================================
-- Aggregate Functions:
-- COUNT — Total Orders
SELECT
    COUNT(*) AS total_orders
FROM Orders;
-- ===========================================================================================================================================================================
-- SUM — Total Sales:
SELECT
    SUM(total_amount) AS total_sales
FROM Orders;
-- ===========================================================================================================================================================================
-- AVG — Average Order Value
SELECT
    AVG(total_amount) AS average_order_value
FROM Orders;
-- ===========================================================================================================================================================================
-- MIN and MAX — Order Values
SELECT
    MIN(total_amount) AS minimum_order_value,
    MAX(total_amount) AS maximum_order_value
FROM Orders;
-- ===========================================================================================================================================================================
-- Multiple Aggregations
SELECT
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_sales,
    AVG(total_amount) AS average_order_value,
    MIN(total_amount) AS minimum_order_value,
    MAX(total_amount) AS maximum_order_value
FROM Orders;

-- ===========================================================================================================================================================================
-- ===========================================================================================================================================================================

-- Filtering
-- Orders Above ₹1,000
SELECT
    order_id,
    customer_id,
    order_date,
    order_status,
    total_amount
FROM Orders
WHERE total_amount > 1000;
-- ===========================================================================================================================================================================
-- Delivered Orders
SELECT
    order_id,
    customer_id,
    order_date,
    total_amount
FROM Orders
WHERE order_status = 'Delivered';
-- ===========================================================================================================================================================================
-- Products with Low Stock
SELECT
    product_id,
    product_name,
    stock_quantity,
    price
FROM Products
WHERE stock_quantity < 50
ORDER BY stock_quantity ASC;
-- ===========================================================================================================================================================================
-- Highly Rated Products
SELECT
    product_id,
    product_name,
    product_rating,
    price
FROM Products
WHERE product_rating >= 4.5
ORDER BY product_rating DESC;
-- ===========================================================================================================================================================================
-- ===========================================================================================================================================================================

-- Conditional Logic
SELECT
    product_id,
    product_name,
    price,
    CASE
        WHEN price < 500 THEN 'Budget'
        WHEN price BETWEEN 500 AND 2000 THEN 'Mid Range'
        ELSE 'Premium'
    END AS price_category
FROM Products;
-- ===========================================================================================================================================================================

-- Categorize Stock Level
SELECT
    product_id,
    product_name,
    stock_quantity,
    CASE
        WHEN stock_quantity = 0 THEN 'Out of Stock'
        WHEN stock_quantity < 50 THEN 'Low Stock'
        WHEN stock_quantity <= 100 THEN 'Medium Stock'
        ELSE 'High Stock'
    END AS stock_status
FROM Products;

-- ===========================================================================================================================================================================
-- ===========================================================================================================================================================================
--  Relationship-Based Retrieval:
-- 1.Customer Order Summary
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_spent DESC;
-- ===========================================================================================================================================================================
-- 2. Product Sales Information
SELECT
    p.product_id,
    p.product_name,
    SUM(od.quantity) AS total_quantity_sold,
    SUM(od.quantity * od.unit_price - od.discount) AS total_revenue
FROM Products p
INNER JOIN Order_Details od
    ON p.product_id = od.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_revenue DESC;
-- ===========================================================================================================================================================================
-- 3. Supplier Product Summary
SELECT
    s.supplier_id,
    s.supplier_name,
    COUNT(p.product_id) AS total_products,
    AVG(p.price) AS average_product_price
FROM Suppliers s
LEFT JOIN Products p
    ON s.supplier_id = p.supplier_id
GROUP BY
    s.supplier_id,
    s.supplier_name
ORDER BY total_products DESC;
-- ===========================================================================================================================================================================
-- Payment Analysis
-- 1.Payment Method Analysis
SELECT
    payment_method,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_payment,
    AVG(amount) AS average_payment
FROM Payments
GROUP BY payment_method
ORDER BY total_payment DESC;
-- ===========================================================================================================================================================================
-- 2 .Payment Status Analysis
SELECT
    payment_status,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount
FROM Payments
GROUP BY payment_status;
-- ===========================================================================================================================================================================
-- Shipping Analysis:
-- 1.Shipping Method Analysis
SELECT
    shipping_method,
    COUNT(*) AS total_shipments,
    AVG(shipping_cost) AS average_shipping_cost,
    SUM(shipping_cost) AS total_shipping_cost
FROM Shipping
GROUP BY shipping_method;
-- ===========================================================================================================================================================================
-- Shipping Status Analysis
SELECT
    shipping_status,
    COUNT(*) AS shipment_count
FROM Shipping
GROUP BY shipping_status;
-- ===========================================================================================================================================================================
-- ===========================================================================================================================================================================
-- HAVING Clause:
-- Customers with More Than One Order
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS total_orders
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(o.order_id) > 1;
-- ===========================================================================================================================================================================
-- ORDER BY and LIMIT
-- Top 10 Highest-Value Orders
SELECT
    order_id,
    customer_id,
    order_date,
    total_amount
FROM Orders
ORDER BY total_amount DESC
LIMIT 10;
-- ===========================================================================================================================================================================
-- Top 10 Customers by Spending
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_spent DESC
LIMIT 10;
-- ===========================================================================================================================================================================
-- Checking the all table
SELECT 'Customers' AS table_name, COUNT(*) AS row_count FROM Customers
UNION ALL
SELECT 'Addresses', COUNT(*) FROM Addresses
UNION ALL
SELECT 'Categories', COUNT(*) FROM Categories
UNION ALL
SELECT 'Suppliers', COUNT(*) FROM Suppliers
UNION ALL
SELECT 'Products', COUNT(*) FROM Products
UNION ALL
SELECT 'Orders', COUNT(*) FROM Orders
UNION ALL
SELECT 'Order_Details', COUNT(*) FROM Order_Details
UNION ALL
SELECT 'Payments', COUNT(*) FROM Payments
UNION ALL
SELECT 'Shipping', COUNT(*) FROM Shipping;


-- ===========================================================================================================================================================================
-- ===========================================================================================================================================================================
-- CTE — Common Table Expression
-- Business requirement
-- Find customers who have spent more than ₹10,000.
WITH CustomerSales AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(o.total_amount) AS total_spent
    FROM Customers c
    INNER JOIN Orders o
        ON c.customer_id = o.customer_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name
)
SELECT
    customer_id,
    first_name,
    last_name,
    total_spent
FROM CustomerSales
WHERE total_spent > 10000
ORDER BY total_spent DESC;

-- ===========================================================================================================================================================================
-- ===========================================================================================================================================================================
-- Window Functions
-- RANK() — Customer Ranking
-- Rank customers according to their total spending.
WITH CustomerSales AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(o.total_amount) AS total_spent
    FROM Customers c
    INNER JOIN Orders o
        ON c.customer_id = o.customer_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name
)
SELECT
    customer_id,
    first_name,
    last_name,
    total_spent,
    RANK() OVER (
        ORDER BY total_spent DESC
    ) AS customer_rank
FROM CustomerSales
ORDER BY customer_rank;

-- ===========================================================================================================================================================================
-- DENSE_RANK() — Product Ranking
-- Rank products based on their price.
SELECT
    product_id,
    product_name,
    price,
    DENSE_RANK() OVER (
        ORDER BY price DESC
    ) AS price_rank
FROM Products
ORDER BY price_rank;
-- ===========================================================================================================================================================================
-- ROW_NUMBER()
-- Give every order a sequential number based on order date.
SELECT
    order_id,
    customer_id,
    order_date,
    total_amount,
    ROW_NUMBER() OVER (
        ORDER BY order_date
    ) AS order_sequence
FROM Orders;

-- ===========================================================================================================================================================================
-- LAG() — Previous Order Comparison
-- Compare each order with the previous order.
SELECT
    order_id,
    order_date,
    total_amount,

    LAG(total_amount) OVER (
        ORDER BY order_date
    ) AS previous_order_amount

FROM Orders
ORDER BY order_date;
-- ===========================================================================================================================================================================
-- LEAD()
-- Find the next order date.
SELECT
    order_id,
    order_date,
    LEAD(order_date) OVER (
        ORDER BY order_date
    ) AS next_order_date
FROM Orders
ORDER BY order_date;

-- ===========================================================================================================================================================================
-- Running Total using Window Function
-- Calculate cumulative sales.
SELECT
    order_date,
    total_amount,

    SUM(total_amount) OVER (
        ORDER BY order_date
    ) AS running_sales

FROM Orders
ORDER BY order_date;

-- ===========================================================================================================================================================================
-- ===========================================================================================================================================================================
-- Subquery
-- Find products whose price is higher than the average product price.
SELECT
    product_id,
    product_name,
    price
FROM Products
WHERE price > (
    SELECT AVG(price)
    FROM Products
)
ORDER BY price DESC;
-- ===========================================================================================================================================================================
-- CASE Statement — Customer Segmentation
-- Classify customers based on their spending.
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spent,

    CASE
        WHEN SUM(o.total_amount) >= 10000 THEN 'High Value'
        WHEN SUM(o.total_amount) >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_category
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name;
    
-- show tables;
-- ===========================================================================================================================================================================
-- select * from customers;

-- select  * from customers where not phone;
-- Stored Procedures
USE ecommerce_analytics;

DELIMITER //

CREATE PROCEDURE GetCustomerDetails(
    IN p_customer_id INT
)
BEGIN
    SELECT
        customer_id,
        first_name,
        last_name,
        email,
        phone,
        gender,
        registration_date
    FROM Customers
    WHERE customer_id = p_customer_id;
END //

DELIMITER ;
-- ===========================================================================================================================================================================

SELECT customer_id, first_name, last_name
FROM Customers
LIMIT 5;

CALL GetCustomerDetails(151);

-- ===========================================================================================================================================================================
SELECT
    MIN(order_date) AS earliest_order,
    MAX(order_date) AS latest_order
FROM Orders;


-- ===========================================================================================================================================================================
-- Orders by Status
-- Show orders based on their status.

DELIMITER //

CREATE PROCEDURE GetOrdersByStatus(
    IN p_status VARCHAR(30)
)
BEGIN
    SELECT
        order_id,
        customer_id,
        order_date,
        order_status,
        total_amount
    FROM Orders
    WHERE order_status = p_status
    ORDER BY order_date DESC;
END //

DELIMITER ;

CALL GetOrdersByStatus('Delivered');
CALL GetOrdersByStatus('Cancelled');
CALL GetOrdersByStatus('Shipped');

-- ===========================================================================================================================================================================

-- Product Sales Analysis
DELIMITER //

CREATE PROCEDURE GetProductSales(
    IN p_product_id INT
)
BEGIN
    SELECT
        p.product_id,
        p.product_name,
        SUM(od.quantity) AS total_quantity_sold,
        SUM(od.quantity * od.unit_price) AS total_revenue
    FROM Products p
    INNER JOIN Order_Details od
        ON p.product_id = od.product_id
    WHERE p.product_id = p_product_id
    GROUP BY
        p.product_id,
        p.product_name;
END //

DELIMITER ;

CALL GetProductSales(1);
-- ===========================================================================================================================================================================
-- Customer Spending
-- Show how much a particular customer has spent.
DELIMITER //

CREATE PROCEDURE GetCustomerSpending(
    IN p_customer_id INT
)
BEGIN
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        COUNT(o.order_id) AS total_orders,
        SUM(o.total_amount) AS total_spent,
        AVG(o.total_amount) AS average_order_value
    FROM Customers c
    INNER JOIN Orders o
        ON c.customer_id = o.customer_id
    WHERE c.customer_id = p_customer_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name;
END //

DELIMITER ;

CALL GetCustomerSpending(151);
-- ===========================================================================================================================================================================
-- Top Customers
DELIMITER //

CREATE PROCEDURE GetTopCustomers(
    IN p_limit INT
)
BEGIN
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        COUNT(o.order_id) AS total_orders,
        SUM(o.total_amount) AS total_spent
    FROM Customers c
    INNER JOIN Orders o
        ON c.customer_id = o.customer_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name
    ORDER BY total_spent DESC
    LIMIT p_limit;
END //

DELIMITER ;

CALL GetTopCustomers(10);
CALL GetTopCustomers(5);

-- ===========================================================================================================================================================================
-- In And Out Parameter
-- OUT Parameter

DELIMITER //

CREATE PROCEDURE GetCustomerOrderCount(
    IN p_customer_id INT,
    OUT p_order_count INT
)
BEGIN
    SELECT COUNT(*)
    INTO p_order_count
    FROM Orders
    WHERE customer_id = p_customer_id;
END //

DELIMITER ;

SET @total_orders = 0;

CALL GetCustomerOrderCount(151, @total_orders);

SELECT @total_orders AS total_orders;

-- ===========================================================================================================================================================================
-- Customer Spending Classification
-- We'll give a customer a category based on their total spending:
-- ₹10,000 or more → High Value
-- ₹5,000–₹9,999 → Medium Value
-- Below ₹5,000 → Low Value

DELIMITER //

CREATE PROCEDURE GetCustomerValueCategory(
    IN p_customer_id INT
)
BEGIN
    DECLARE v_total_spent DECIMAL(12,2);

    SELECT COALESCE(SUM(total_amount), 0)
    INTO v_total_spent
    FROM Orders
    WHERE customer_id = p_customer_id;

    IF v_total_spent >= 10000 THEN

        SELECT
            p_customer_id AS customer_id,
            v_total_spent AS total_spent,
            'High Value' AS customer_category;

    ELSEIF v_total_spent >= 5000 THEN

        SELECT
            p_customer_id AS customer_id,
            v_total_spent AS total_spent,
            'Medium Value' AS customer_category;

    ELSE

        SELECT
            p_customer_id AS customer_id,
            v_total_spent AS total_spent,
            'Low Value' AS customer_category;

    END IF;
END //

DELIMITER ;

CALL GetCustomerValueCategory(151);

-- ===========================================================================================================================================================================

-- Errro Exception Handlin
DELIMITER //

CREATE PROCEDURE UpdateOrderStatus(
    IN p_order_id INT,
    IN p_new_status VARCHAR(30)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;

        SELECT
            'Transaction failed. Changes rolled back.' AS message;
    END;

    START TRANSACTION;

    UPDATE Orders
    SET order_status = p_new_status
    WHERE order_id = p_order_id;

    IF ROW_COUNT() = 0 THEN
        ROLLBACK;

        SELECT
            'Order not found. No changes made.' AS message;
    ELSE
        COMMIT;

        SELECT
            'Order status updated successfully.' AS message;
    END IF;

END //

DELIMITER ;

SELECT
    order_id,
    customer_id,
    order_status
FROM Orders
LIMIT 10;


CALL UpdateOrderStatus(1, 'Delivered');

SELECT
    order_id,
    order_status
FROM Orders
WHERE order_id = 1;

CALL UpdateOrderStatus(999999, 'Delivered');

-- ===========================================================================================================================================================================


-- Index
USE ecommerce_analytics;

SHOW INDEX FROM Orders;
SHOW INDEX FROM Customers;
SHOW INDEX FROM Products;
SHOW INDEX FROM Order_Details;


CREATE INDEX idx_orders_order_date
ON Orders(order_date);
-- ===========================================================================================================================================================================
CREATE INDEX idx_orders_order_status
ON Orders(order_status);
-- ===========================================================================================================================================================================
SHOW INDEX FROM Orders;

-- ===========================================================================================================================================================================
-- Test order_date index
EXPLAIN
SELECT *
FROM Orders
WHERE order_date BETWEEN '2026-01-01' AND '2026-06-30';
-- ===========================================================================================================================================================================
-- Test order_status index
EXPLAIN
SELECT *
FROM Orders
WHERE order_status = 'Delivered';

-- ===========================================================================================================================================================================
-- Stagging
CREATE TABLE Orders_Staging (
    order_id INT,
    customer_id INT,
    order_date VARCHAR(20),
    order_status VARCHAR(50),
    total_amount VARCHAR(50)
);

-- Insertion of data
INSERT INTO Orders_Staging (
    order_id,
    customer_id,
    order_date,
    order_status,
    total_amount
)
SELECT
    order_id,
    customer_id,
    order_date,
    order_status,
    total_amount
FROM Orders;
-- ===========================================================================================================================================================================
SELECT *
FROM Orders_Staging
LIMIT 10;
-- ===========================================================================================================================================================================
-- ETL: Clean the Staging Data

-- Check for invalid/empty dates
SELECT *
FROM Orders_Staging
WHERE order_date IS NULL
   OR order_date = '';
-- ===========================================================================================================================================================================
 -- Check for invalid/empty amounts  
SELECT *
FROM Orders_Staging
WHERE total_amount IS NULL
   OR total_amount = '';
-- ===========================================================================================================================================================================
-- Check for invalid order status
SELECT DISTINCT
    order_status
FROM
    Orders_Staging;
-- ===========================================================================================================================================================================
-- Creating final Table
CREATE TABLE Orders_Final (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(30) NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL
);

-- ===========================================================================================================================================================================
-- Inserting the data
INSERT INTO Orders_Final (
    order_id,
    customer_id,
    order_date,
    order_status,
    total_amount
)
SELECT
    order_id,
    customer_id,
    STR_TO_DATE(order_date, '%Y-%m-%d'),
    TRIM(order_status),
    CAST(total_amount AS DECIMAL(12,2))
FROM Orders_Staging;

SELECT *
FROM Orders_Final
LIMIT 10;


SELECT COUNT(*) AS total_records
FROM Orders_Final;
-- ===========================================================================================================================================================================

-- Checking the Null Values
SELECT *
FROM Orders_Final
WHERE order_id IS NULL
   OR customer_id IS NULL
   OR order_date IS NULL
   OR order_status IS NULL
   OR total_amount IS NULL;
   
   SELECT
    order_status,
    COUNT(*) AS total_orders
FROM Orders_Final
GROUP BY order_status;

-- ===========================================================================================================================================================================
SELECT
    (SELECT COUNT(*) FROM Orders_Staging) AS staging_count,
    (SELECT COUNT(*) FROM Orders_Final) AS final_count;
  
-- ===========================================================================================================================================================================
-- ===========================================================================================================================================================================
-- Create a Customer Sales Summary View
USE ecommerce_analytics;

CREATE VIEW Customer_Sales_Summary AS
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent,
    AVG(o.total_amount) AS average_order_value
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name;
    
  -- Check the view  
SELECT *
FROM Customer_Sales_Summary;
-- ===========================================================================================================================================================================
-- Check that the view exists
SHOW FULL TABLES
WHERE Table_type = 'VIEW';
-- ===========================================================================================================================================================================
SELECT *
FROM Customer_Sales_Summary;

-- ===========================================================================================================================================================================
-- View 2: Product Sales Summary.
USE ecommerce_analytics;
CREATE VIEW Product_Sales_Summary AS
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    COUNT(DISTINCT od.order_id) AS total_orders,
    SUM(od.quantity) AS total_quantity_sold,
    SUM(od.quantity * od.unit_price) AS total_revenue,
    SUM(od.discount) AS total_discount
FROM Products p
INNER JOIN Categories c
    ON p.category_id = c.category_id
INNER JOIN Order_Details od
    ON p.product_id = od.product_id
GROUP BY
    p.product_id,
    p.product_name,
    c.category_name;
-- ===========================================================================================================================================================================
    SELECT * 
FROM Product_Sales_Summary;

SHOW FULL TABLES 
WHERE Table_type = 'VIEW';

-- ===========================================================================================================================================================================
-- View 3 — Order Summary
USE ecommerce_analytics;

CREATE VIEW Order_Summary AS
SELECT
    o.order_id,
    o.order_date,
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_status,
    o.total_amount,
    p.payment_method,
    p.payment_status,
    s.shipping_method,
    s.shipping_status,
    s.shipping_cost
FROM Orders o
INNER JOIN Customers c
    ON o.customer_id = c.customer_id
LEFT JOIN Payments p
    ON o.order_id = p.order_id
LEFT JOIN Shipping s
    ON o.order_id = s.order_id;
    
SELECT *
FROM Order_Summary;

SHOW FULL TABLES
WHERE Table_type = 'VIEW';
-- ===========================================================================================================================================================================
-- View 4 — Monthly Sales Summary
USE ecommerce_analytics;

CREATE VIEW Monthly_Sales_Summary AS
SELECT
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_sales,
    AVG(total_amount) AS average_order_value
FROM Orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    sales_year,
    sales_month;
    
SELECT *
FROM Monthly_Sales_Summary;

SHOW FULL TABLES
WHERE Table_type = 'VIEW';

-- ===========================================================================================================================================================================
-- ===========================================================================================================================================================================
-- Trigger
-- Automatically Update Product Stock
USE ecommerce_analytics;

DELIMITER //

CREATE TRIGGER trg_reduce_product_stock
AFTER INSERT ON Order_Details
FOR EACH ROW
BEGIN
    UPDATE Products
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END //

DELIMITER ;
-- ===========================================================================================================================================================================
-- select command
SELECT product_id, product_name, stock_quantity
FROM Products
WHERE product_id = 1;

INSERT INTO Order_Details
(order_id, product_id, quantity, unit_price, discount)
VALUES
(1, 1, 2, 500.00, 0);

SELECT product_id, product_name, stock_quantity
FROM Products
WHERE product_id = 1
-- ===========================================================================================================================================================================

-- Trigger 2 — Prevent Negative Stock
DELIMITER //

CREATE TRIGGER trg_check_product_stock
BEFORE INSERT ON Order_Details
FOR EACH ROW
BEGIN
    DECLARE v_stock INT;

    SELECT stock_quantity
    INTO v_stock
    FROM Products
    WHERE product_id = NEW.product_id;

    IF v_stock < NEW.quantity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient product stock';
    END IF;
END //

DELIMITER ;
SHOW TRIGGERS;
-- ===========================================================================================================================================================================
-- Automatically Update updated_at
USE ecommerce_analytics;

DELIMITER //

CREATE TRIGGER trg_validate_order_status
BEFORE INSERT ON Orders
FOR EACH ROW
BEGIN
    IF NEW.order_status NOT IN ('Pending', 'Shipped', 'Delivered', 'Cancelled') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid order status';
    END IF;
END //

DELIMITER ;
SHOW TRIGGERS;
-- ===========================================================================================================================================================================
-- Validate Payment Amount
USE ecommerce_analytics;

DELIMITER //

CREATE TRIGGER trg_validate_payment_amount
BEFORE INSERT ON Payments
FOR EACH ROW
BEGIN
    IF NEW.amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Payment amount must be greater than zero';
    END IF;
END //

DELIMITER ;

SHOW TRIGGERS;
-- ===========================================================================================================================================================================
-- Validate Payment Date
USE ecommerce_analytics;

DELIMITER //

CREATE TRIGGER trg_validate_payment_date
BEFORE INSERT ON Payments
FOR EACH ROW
BEGIN
    IF NEW.payment_date > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Payment date cannot be in the future';
    END IF;
END //

DELIMITER ;
SHOW TRIGGERS;

-- ===========================================================================================================================================================================
select * from orders_final;
-- ===========================================================================================================================================================================
-- Describe Tables 
describe addresses;
describe categories;
describe customers;
describe order_details;
describe orders;
describe payments;
describe products;
describe shipping;
describe suppliers;

-- ===========================================================================================================================================================================
-- Total tables
show tables;

-- Bussiness related queries
-- 1. Total number of orders — COUNT
-- Find the total number of orders placed.
SELECT COUNT(*) AS total_orders
FROM Orders;
-- ===========================================================================================================================================================================
-- 2. Total sales — SUM
-- Find the total sales generated by the business.
 SELECT SUM(total_amount) AS total_sales
FROM Orders;
-- ===========================================================================================================================================================================
-- 3. Average, minimum and maximum order value — Aggregations
-- Find the average, minimum, and maximum order value.
SELECT
    AVG(total_amount) AS average_order_value,
    MIN(total_amount) AS minimum_order_value,
    MAX(total_amount) AS maximum_order_value
FROM Orders;
-- ===========================================================================================================================================================================
-- 4. Orders by status — GROUP BY
-- Find the number of orders and sales for each order status.
SELECT
    order_status,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_sales,
    AVG(total_amount) AS average_order_value
FROM Orders
GROUP BY order_status;
-- ===========================================================================================================================================================================
-- 5. Customers and their orders — INNER JOIN
-- Display customer details along with their orders.
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    o.order_status,
    o.total_amount
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id;
-- ===========================================================================================================================================================================
    
-- 6. Customers without addresses — LEFT JOIN
-- Find customers who may not have an address recorded.
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.city,
    a.state
FROM Customers c
LEFT JOIN Addresses a
    ON c.customer_id = a.customer_id
WHERE a.address_id IS NULL;
-- ===========================================================================================================================================================================
-- 7. Products by category — JOIN + GROUP BY
-- Find how many products are available in each category.
SELECT
    c.category_name,
    COUNT(p.product_id) AS total_products
FROM Categories c
LEFT JOIN Products p
    ON c.category_id = p.category_id
GROUP BY
    c.category_id,
    c.category_name
ORDER BY total_products DESC;
-- ===========================================================================================================================================================================
-- 8. Customers with multiple orders — HAVING
-- Find customers who have placed more than one order.
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(o.order_id) > 1;
-- ===========================================================================================================================================================================
-- 9. Orders above ₹1,000 — WHERE
-- Find orders whose value is greater than ₹1,000.
SELECT
    order_id,
    customer_id,
    order_date,
    order_status,
    total_amount
FROM Orders
WHERE total_amount > 1000;
-- ===========================================================================================================================================================================
-- 10. Low-stock products — Filtering + ORDER BY
-- Identify products with low stock.

SELECT
    product_id,
    product_name,
    stock_quantity,
    price
FROM Products
WHERE stock_quantity < 50
ORDER BY stock_quantity ASC;
-- ===========================================================================================================================================================================
-- 11. Products above average price — Subquery
-- Find products whose price is higher than the average product price.
SELECT
    product_id,
    product_name,
    price
FROM Products
WHERE price > (
    SELECT AVG(price)
    FROM Products
);

-- ===========================================================================================================================================================================
-- 12. Customers spending above ₹10,000 — CTE
-- Find customers whose total spending is greater than ₹10,000.
WITH CustomerSales AS (
    SELECT
        customer_id,
        SUM(total_amount) AS total_spent
    FROM Orders
    GROUP BY customer_id
)
SELECT
    customer_id,
    total_spent
FROM CustomerSales
WHERE total_spent > 10000;
-- ===========================================================================================================================================================================
-- 14. Product price classification — CASE
-- Categorize products based on their price.
SELECT
    product_id,
    product_name,
    price,
    CASE
        WHEN price < 500 THEN 'Budget'
        WHEN price BETWEEN 500 AND 2000 THEN 'Mid Range'
        ELSE 'Premium'
    END AS price_category
FROM Products;
-- ===========================================================================================================================================================================
-- 15. Rank products by revenue — Window Function
--  Rank products based on their total revenue.
SELECT
    product_id,
    product_name,
    total_revenue,
    RANK() OVER (
        ORDER BY total_revenue DESC
    ) AS revenue_rank
FROM Product_Sales_Summary;
-- ===========================================================================================================================================================================
-- 16. Running total of sales — Window Function
-- Calculate the running total of sales month by month.
SELECT
    sales_year,
    sales_month,
    total_sales,
    SUM(total_sales) OVER (
        ORDER BY sales_year, sales_month
    ) AS running_sales
FROM Monthly_Sales_Summary;
-- ===========================================================================================================================================================================
-- Monthly sales analysis — Date functions + GROUP BY
-- Find monthly sales, order count, and average order value.
SELECT
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_sales,
    AVG(total_amount) AS average_order_value
FROM Orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    sales_year,
    sales_month;
    -- ===========================================================================================================================================================================
-- 18. Product sales analysis — Multiple JOINs
-- Find product sales, quantity sold, revenue, and discount by product and category.
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    SUM(od.quantity) AS total_quantity_sold,
    SUM(od.quantity * od.unit_price) AS total_revenue,
    SUM(od.discount) AS total_discount
FROM Products p
INNER JOIN Categories c
    ON p.category_id = c.category_id
INNER JOIN Order_Details od
    ON p.product_id = od.product_id
GROUP BY
    p.product_id,
    p.product_name,
    c.category_name;
-- ===========================================================================================================================================================================    
-- 19. Complete order information — Multiple tables
-- Get customer, order, payment, and shipping information together.
SELECT
    o.order_id,
    o.order_date,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_status,
    o.total_amount,
    p.payment_method,
    p.payment_status,
    s.shipping_method,
    s.shipping_status,
    s.shipping_cost
FROM Orders o
INNER JOIN Customers c
    ON o.customer_id = c.customer_id
LEFT JOIN Payments p
    ON o.order_id = p.order_id
LEFT JOIN Shipping s
    ON o.order_id = s.order_id;
-- ===========================================================================================================================================================================
-- ===========================================================================================================================================================================

-- Checking All Tables
select * from Customers;
select * from  Addresses;
select * from  Categories;
select * from  Suppliers;
select * from  Products;
select * from  Orders;
select * from  Order_Details;
select * from Payments;
select * from Shipping;


show tables;


SELECT CURRENT_USER();


SELECT appointment_id, COUNT(*) AS total
FROM clinical_resource_analytics.admissions
GROUP BY appointment_id
HAVING COUNT(*) > 1;

SELECT appointment_id, COUNT(*) AS total
FROM clinical_resource_analytics.appointments
GROUP BY appointment_id
HAVING COUNT(*) > 1;

SELECT
    appointment_id,
    COUNT(*) AS total
FROM clinical_resource_analytics.admissions
GROUP BY appointment_id
HAVING COUNT(*) > 1;


SELECT
    COUNT(*) AS total_rows,
    SUM(appointment_id IS NULL) AS null_appointment_ids
FROM clinical_resource_analytics.admissions;


SELECT
    COUNT(*) AS total_rows,
    SUM(appointment_id IS NULL) AS null_appointment_ids
FROM clinical_resource_analytics.appointments;