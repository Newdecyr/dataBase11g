--tabela customer contém os dados dos clientes
CREATE TABLE customer(
customerId INTEGER CONSTRAINT customer_pk PRIMARY KEY,
firstName VARCHAR2(10) NOT NULL,
lastName VARCHAR2(10) NOT NULL,
dob DATE,
phone VARCHAR2(12)
);

--tabela productType contém os nomes dos tipos de produtos vendidos pela loja
CREATE TABLE productType(
productTypeId INTEGER CONSTRAINT productType_pk PRIMARY KEY,
name VARCHAR2(10) NOT NULL
);

--tabela product contém os produtos vendidos pela loja 
CREATE TABLE product(
productId INTEGER CONSTRAINT product_pk PRIMARY KEY,
productTypeId INTEGER CONSTRAINT product_fk_productType REFERENCES productType(productTypeId),
name VARCHAR2(30) NOT NULL,
description VARCHAR2(50),
price NUMBER(5, 2)
);

--tabela purchase contém as compras feitas por um cliente 
CREATE TABLE purchase(
productId INTEGER CONSTRAINT purchase_fk_product REFERENCES product(productId),
customerId INTEGER CONSTRAINT purchase_fk_customer REFERENCES customer(customerId),
quantity INTEGER NOT NULL,
CONSTRAINT purchase_pk PRIMARY KEY(productId, customerId)
);

--tabela employee contém os detalhes dos funcionários
CREATE TABLE employee(
employeeId INTEGER CONSTRAINT employee_pk PRIMARY KEY,
managerId INTEGER,
firstName VARCHAR2(10) NOT NULL,
lastName VARCHAR2(10) NOT NULL,
title VARCHAR2(20),
salary NUMBER(6, 0)
);

--tabela salaryGrade contém os diferentes níveis salariais dos funcionários 
CREATE TABLE salaryGrade(
salaryGradeId INTEGER CONSTRAINT salaryGrade_pk PRIMARY KEY,
lowSalary NUMBER(6, 0),
highSalary NUMBER(6, 0)
);


