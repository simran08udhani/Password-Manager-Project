-- Table: iv_n_key
CREATE TABLE iv_n_key (
  id INT NOT NULL AUTO_INCREMENT,
  Website VARCHAR(255) NOT NULL,
  Username VARCHAR(255) NOT NULL,
  key1 VARBINARY(32) NOT NULL,
  PRIMARY KEY (id)
);

-- Table: psswrd_manager
CREATE TABLE psswrd_manager (
  id INT NOT NULL AUTO_INCREMENT,
  Website VARCHAR(255) NOT NULL,
  Username VARCHAR(255) NOT NULL,
  Password VARBINARY(64) NOT NULL,
  IV VARBINARY(16) NOT NULL,
  PRIMARY KEY (id)
);

-- Trigger: before_insert_user
DELIMITER //
CREATE TRIGGER before_insert_user
BEFORE INSERT ON iv_n_key
FOR EACH ROW
BEGIN
  SET NEW.key1 = UNHEX(SHA2(CONCAT(NEW.Username, NOW()), 256));
END;
//
DELIMITER ;

-- Reset Auto Increment Values
ALTER TABLE psswrd_manager AUTO_INCREMENT = 1;
ALTER TABLE iv_n_key AUTO_INCREMENT = 1;
