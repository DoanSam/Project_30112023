CREATE TABLE Accounts (
	acc_id INT AUTO_INCREMENT PRIMARY KEY,
	acc_username VARCHAR(50) NOT NULL,
	acc_password VARCHAR(50) NOT NULL,
	acc_name VARCHAR(50) DEFAULT "user",
	acc_age DATE DEFAULT CURRENT_DATE,
	acc_sex BOOL DEFAULT FALSE,
	acc_address VARCHAR(100),
	acc_role BOOL DEFAULT FALSE,
	acc_status INT DEFAULT 0,
	acc_mail VARCHAR(50) DEFAULT "No Mail",
	acc_phone VARCHAR(15) DEFAULT "No Phone",
	acc_created DATE DEFAULT CURRENT_DATE
);

CREATE TABLE wallet (
	acc_id INT PRIMARY KEY,
	acc_money DECIMAL (15, 2) DEFAULT 0,
	acc_coins DECIMAL	(10, 2) DEFAULT 0,
	acc_amount_used DECIMAL (15, 2) DEFAULT 0,
	
	FOREIGN KEY (acc_id) REFERENCES accounts (acc_id)
);

'================================================================================================='
CREATE TABLE color(
	color_id INT AUTO_INCREMENT PRIMARY KEY,
	color_name VARCHAR(30)
);

CREATE TABLE size(
	size_id INT AUTO_INCREMENT PRIMARY KEY,
	size_name VARCHAR(10)
);
CREATE TABLE products_images(
	pro_id INT AUTO_INCREMENT PRIMARY KEY,
	imagepath VARCHAR(255) DEFAULT 'D:\AppData\XAMPP\htdocs\API_Project_30112023\assets\images\default-image.png',
	FOREIGN KEY (pro_id) REFERENCES products (pro_id)
);

INSERT INTO size (`size_name`) VALUES ('S'), ('M'), ('L'), ('XL'), ('XXL');
INSERT INTO color (`color_name`) VALUES ('red'), ('blue'), ('green'), ('black'), ('white');

'================================================================================================='


CREATE TABLE products (
	acc_id INT,
	pro_id INT AUTO_INCREMENT PRIMARY key,
	pro_title VARCHAR(100) DEFAULT 'Untitled',
	pro_name VARCHAR(100) DEFAULT 'No Name',
	pro_quantity INT DEFAULT 0,
	pro_price DECIMAL(15, 2) DEFAULT 0,
	pro_descriptions VARCHAR(500),
	pro_sell INT DEFAULT 0,
	pro_created DATE DEFAULT CURRENT_DATE,
	    
	FOREIGN KEY (acc_id) REFERENCES Accounts (acc_id)
);


CREATE TABLE products_color(
	pro_id INT,
	color_id INT,
	color_quantity INT,
	PRIMARY KEY (pro_id, color_id),
	FOREIGN KEY (pro_id) REFERENCES products (pro_id),
	FOREIGN KEY (color_id) REFERENCES color (color_id)

);

CREATE TABLE products_size (
	pro_id INT,
	size_id INT,
	size_quantity INT DEFAULT 0
	PRIMARY KEY (pro_id, size_id),
	FOREIGN KEY (pro_id) REFERENCES products (pro_id),
	FOREIGN KEY (size_id) REFERENCES size (size_id)
);

CREATE TABLE products_evalute(
	acc_id INT,
	pro_id INT,
	pro_comments VARCHAR(200),
	pro_star DOUBLE DEFAULT 0,
	eval_created DATE DEFAULT CURRENT_DATE,
	
	PRIMARY KEY (acc_id, pro_id),
	FOREIGN KEY (pro_id) REFERENCES products (pro_id),
	FOREIGN KEY (acc_id) REFERENCES accounts (acc_id)
);


CREATE TABLE cart (
	acc_id INT,
	pro_id INT,
	cart_quantity INT DEFAULT 0,
	cart_created DATE DEFAULT CURRENT_DATE,
	
	PRIMARY KEY (acc_id, pro_id),
	FOREIGN KEY (acc_id) REFERENCES accounts (acc_id),
	FOREIGN KEY (pro_id) REFERENCES products (pro_id)
);

CREATE TABLE favourite (
	acc_id INT,
	pro_id INT,
	fav_creatd DATE DEFAULT CURRENT_DATE,
	
	PRIMARY KEY (acc_id, pro_id),
	FOREIGN KEY (acc_id) REFERENCES accounts (acc_id),
	FOREIGN KEY (pro_id) REFERENCES products (pro_id)
);










