
-- -----------------------------------------------------
-- Schema Agriculture11
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS Agriculture11 ;
USE Agriculture11 ;

-- -----------------------------------------------------
-- Table `Agriculture`.`Administrator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Administrator (
  `User_ID` INT NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`User_ID`));

-- -----------------------------------------------------
-- Table `Agriculture`.`Scheme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Scheme (
  `Scheme_ID` INT NOT NULL,
  `No_of_registeration` INT NOT NULL,
  `Scheme_Name` VARCHAR(45) NOT NULL,
  `User_ID` INT NOT NULL,
  PRIMARY KEY (`Scheme_ID`),
  CONSTRAINT `fk_Scheme_Administrator1`
    FOREIGN KEY (`User_ID`)
    REFERENCES Administrator (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Agriculture`.`Place`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Place(
  `Postcode` INT NOT NULL,
  `District` VARCHAR(45) NOT NULL,
  `State` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Postcode`));


-- -----------------------------------------------------
-- Table `Agriculture`.`Farmer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Farmer (
  `Farmer_ID` INT NOT NULL,
  `Farmer_name` VARCHAR(45) NOT NULL,
  `Gender` VARCHAR(1) NOT NULL,
  `Contact` INT NOT NULL,
  `Postcode` INT NOT NULL,
  `Scheme_ID` INT NOT NULL,
  PRIMARY KEY (`Farmer_ID`),
  CONSTRAINT `fk_Farmer_Scheme1`
    FOREIGN KEY (`Scheme_ID`)
    REFERENCES Scheme (`Scheme_ID`),
  CONSTRAINT `fk_Farmer_Place1`
    FOREIGN KEY (`Postcode`)
    REFERENCES Place(`Postcode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Agriculture`.`Crops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Crops (
  `Name` VARCHAR(50) NOT NULL,
  `Crop_Type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Name`));


-- -----------------------------------------------------
-- Table `Agriculture`.`Buyer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Buyer (
  `ID` INT NOT NULL,
  `Buyer_Name` VARCHAR(50) NOT NULL,
  `Postcode` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_Buyer_Place1`
    FOREIGN KEY (`Postcode`)
    REFERENCES `Agriculture`.`Place` (`Postcode`));


-- -----------------------------------------------------
-- Table `Agriculture`.`Warehouse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Warehouse (
  `Warehouse_ID` INT NOT NULL,
  `Owner` VARCHAR(45) NOT NULL,
  `Buyer_ID` INT NOT NULL,
  `User_ID` INT NOT NULL,
  PRIMARY KEY (`Warehouse_ID`),
  CONSTRAINT `fk_Warehouse_Buyer1`
    FOREIGN KEY (`Buyer_ID`)
    REFERENCES Buyer (`ID`),
  CONSTRAINT `fk_Warehouse_Administrator1`
    FOREIGN KEY (`User_ID`)
    REFERENCES Administrator (`User_ID`));


-- -----------------------------------------------------
-- Table `Agriculture`.`Buys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Buys (
  `Buyer_ID` INT NOT NULL,
  `Crops_Name` VARCHAR(50) NOT NULL,
  `quantity` INT NOT NULL,
  CONSTRAINT `fk_Buys_Buyer1`
    FOREIGN KEY (`Buyer_ID`)
    REFERENCES Buyer (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Buys_Crops1`
    FOREIGN KEY (`Crops_Name`)
    REFERENCES Crops (`Name`));


-- -----------------------------------------------------
-- Table `Agriculture`.`Produces`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Produces (
  `Farmer_ID` INT NOT NULL,
  `Crops_Name` VARCHAR(50) NOT NULL,
  CONSTRAINT `fk_Produces_Farmer1`
    FOREIGN KEY (`Farmer_ID`)
    REFERENCES Farmer (`Farmer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produces_Crops1`
    FOREIGN KEY (`Crops_Name`)
    REFERENCES Crops (`Name`));


-- -----------------------------------------------------
-- Table `Agriculture`.`Bank`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Bank (
  `Bank_ID` INT NOT NULL,
  `Bank_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Bank_ID`));


-- -----------------------------------------------------
-- Table `Agriculture`.`Loan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Loan (
  `Loan_ID` INT NOT NULL,
  `Farmer_ID` INT NOT NULL,
  `Bank_ID` INT NOT NULL,
  CONSTRAINT `fk_Loan_Bank1`
    FOREIGN KEY (`Bank_ID`)
    REFERENCES `Agriculture`.`Bank` (`Bank_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Loan_Farmer1`
    FOREIGN KEY (`Farmer_ID`)
    REFERENCES `Agriculture`.`Farmer` (`Farmer_ID`));


-- -----------------------------------------------------
-- Table `Agriculture`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Supplier (
  `Sup_ID` INT NOT NULL,
  `Sup_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Sup_ID`));


-- -----------------------------------------------------
-- Table `Agriculture`.`Inputs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Inputs (
  `Pesticide_Amt` INT NULL,
  `fertilizer_amt` INT NULL,
  `Sup_ID` INT NOT NULL,
  `Price` INT NULL,
  CONSTRAINT `fk_Inputs_Supplier1`
    FOREIGN KEY (`Sup_ID`)
    REFERENCES `Agriculture`.`Supplier` (`Sup_ID`));


-- -----------------------------------------------------
-- Table `Agriculture`.`Sells`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Sells (
  `Farmer_ID` INT NOT NULL,
  `Buyer_ID` INT NOT NULL,
  CONSTRAINT `fk_Sells_Farmer1`
    FOREIGN KEY (`Farmer_ID`)
    REFERENCES `Agriculture`.`Farmer` (`Farmer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sells_Buyer1`
    FOREIGN KEY (`Buyer_ID`)
    REFERENCES `Agriculture`.`Buyer` (`ID`));


-- -----------------------------------------------------
-- Table `Agriculture`.`Stored_at`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Stored_at (
  `Crops_Name` VARCHAR(50) NOT NULL,
  `Warehouse_ID` INT NOT NULL,
  CONSTRAINT `fk_Stored AT_Warehouse1`
    FOREIGN KEY (`Warehouse_ID`)
    REFERENCES `Agriculture`.`Warehouse` (`Warehouse_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Stored AT_Crops1`
    FOREIGN KEY (`Crops_Name`)
    REFERENCES `Agriculture`.`Crops` (`Name`));


-- -----------------------------------------------------
-- Table `Agriculture`.`supply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS supply (
  `Sup_ID` INT NOT NULL,
  `Farmer_ID` INT NOT NULL,
  CONSTRAINT `fk_Supplier_has_Farmer_Supplier1`
    FOREIGN KEY (`Sup_ID`)
    REFERENCES `Agriculture`.`Supplier` (`Sup_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Supplier_has_Farmer_Farmer1`
    FOREIGN KEY (`Farmer_ID`)
    REFERENCES `Agriculture`.`Farmer` (`Farmer_ID`));

