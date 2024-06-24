CREATE TABLE Car (
  id CHAR(36) PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255),
  daily_rate DOUBLE,
  available BOOLEAN,
  license_plate CHAR(7),
  chassis VARCHAR(50),
  color VARCHAR(50),
  transmission_type VARCHAR(50),
  brand_id CHAR(36),
  category_id CHAR(36),
  fine_amount DOUBLE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (brand_id) REFERENCES Brand(id),
  FOREIGN KEY (category_id) REFERENCES Category(id)
);

CREATE TABLE Rental (
  id CHAR(36) PRIMARY KEY,
  car_id CHAR(36),
  user_id CHAR(36),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  expected_return_date TIMESTAMP,
  total DOUBLE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (car_id) REFERENCES Car(id),
  FOREIGN KEY (user_id) REFERENCES User(id)
);

CREATE TABLE User (
  id CHAR(36) PRIMARY KEY,
  name VARCHAR(255),
  username VARCHAR(255),
  password VARCHAR(255),
  email VARCHAR(255),
  driver_license CHAR(11),
  admin BOOLEAN,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Category (
  id CHAR(36) PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Brand (
  id CHAR(36) PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Specification (
  id CHAR(36) PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE SpecificationCar (
  id CHAR(36) PRIMARY KEY,
  car_id CHAR(36),
  specification_id CHAR(36),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (car_id) REFERENCES Car(id),
  FOREIGN KEY (specification_id) REFERENCES Specification(id)
);

CREATE TABLE CarImage (
  id CHAR(36) PRIMARY KEY,
  car_id CHAR(36),
  image_url VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (car_id) REFERENCES Car(id)
);

CREATE TABLE Customer (
  id CHAR(36) PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(50),
  cnpj VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Employee (
  id CHAR(36) PRIMARY KEY,
  customer_id CHAR(36),
  name VARCHAR(255),
  driver_license CHAR(11),
  license_expiration_date TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES Customer(id)
);

CREATE TABLE Reservation (
  id CHAR(36) PRIMARY KEY,
  car_id CHAR(36),
  customer_id CHAR(36),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  expected_return_date TIMESTAMP,
  total DOUBLE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (car_id) REFERENCES Car(id),
  FOREIGN KEY (customer_id) REFERENCES Customer(id)
);

CREATE TABLE RentalDetail (
  id CHAR(36) PRIMARY KEY,
  reservation_id CHAR(36),
  customer_id CHAR(36),
  car_id CHAR(36),
  start_datetime TIMESTAMP,
  end_datetime TIMESTAMP,
  pickup_location VARCHAR(255),
  return_location VARCHAR(255),
  initial_car_state TEXT,
  final_car_state TEXT,
  additional_protections TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (reservation_id) REFERENCES Reservation(id),
  FOREIGN KEY (customer_id) REFERENCES Customer(id),
  FOREIGN KEY (car_id) REFERENCES Car(id)
);
