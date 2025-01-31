--LIBRARY PROJECT--

--CREATE TABLES--
CREATE TABLE Card(
  cardID NUMBER,
  status VARCHAR2(1) CHECK ((status = 'A') OR (status = 'B')),
  fines NUMBER,
  CONSTRAINT Card_PK PRIMARY KEY (cardID));

CREATE TABLE Customer(
  customerID NUMBER,
  name VARCHAR2(40),
  customerAddress VARCHAR2(50),
  phone NUMBER(9),
  password VARCHAR2(20),
  userName VARCHAR2(10),
  dateSignUp DATE,
  cardNumber NUMBER,
  CONSTRAINT Customer_PK PRIMARY KEY (customerID));

CREATE TABLE Employee(
  employeeID NUMBER,
  name VARCHAR2(40),
  employeeAddress VARCHAR2(50),
  phone NUMBER(9),
  password VARCHAR2(20),
  userName VARCHAR2(10),
  paycheck NUMBER (8, 2),
  branchName VARCHAR2(40),
  cardNumber NUMBER, 
  CONSTRAINT Employee_PK PRIMARY KEY (employeeID));

CREATE TABLE Branch(
  name VARCHAR2(40),
  address VARCHAR2(50),
  phone NUMBER(9),
  CONSTRAINT Branch_PK PRIMARY KEY (name));
  
CREATE TABLE Location(
  address VARCHAR2(50),
  CONSTRAINT Location_PK PRIMARY KEY (address));
  
CREATE TABLE Rent(
  cardID NUMBER,
  itemID VARCHAR2(6),
  apporpriationDate DATE,
  returnDate DATE,
  CONSTRAINT Rent_PK PRIMARY KEY (cardID,itemID));
 
CREATE TABLE Book(
  ISBN VARCHAR2(4),
  bookID VARCHAR2(6),
  state VARCHAR2(10),
  avalability VARCHAR2(1) CHECK ((avalability = 'A') OR (avalability = 'O')),
  debyCost NUMBER(10,2),
  lostCost NUMBER(10,2),
  address VARCHAR2(50),
  CONSTRAINT Book_PK PRIMARY KEY (ISBN,bookID));

CREATE TABLE Video(
  title VARCHAR2(50),
  year INT,
  videoID VARCHAR2(6),
  state VARCHAR2(10),
  avalability VARCHAR2(1) CHECK ((avalability = 'A') OR (avalability = 'O')),
  debyCost NUMBER(10,2),
  lostCost NUMBER(10,2),
  address VARCHAR(50),
  CONSTRAINT Video_PK PRIMARY KEY (title,year,videoID));




-- DROP TABLES--
-- DROP TABLE Card;
-- DROP TABLE Customer;
-- DROP TABLE Employee;
-- DROP TABLE Branch;
-- DROP TABLE Location;
-- DROP TABLE Book;
-- DROP TABLE Video;
-- DROP TABLE Rent;


--FOREIGN KEYS--
ALTER TABLE Customer
ADD CONSTRAINT Customer_FK
FOREIGN KEY (cardNumber)
REFERENCES Card(cardID);

ALTER TABLE Employee
ADD CONSTRAINT Employee_FK_Card
FOREIGN KEY (cardNumber)
REFERENCES Card(cardID);

ALTER TABLE Employee
ADD CONSTRAINT Employee_FK_Branch
FOREIGN KEY (branchName)
REFERENCES Branch(name);

ALTER TABLE Branch
ADD CONSTRAINT Branch_FK
FOREIGN KEY (address)
REFERENCES Location(address);

ALTER TABLE Book
ADD CONSTRAINT Book_FK
FOREIGN KEY (address)
REFERENCES Location(address);

ALTER TABLE Video
ADD CONSTRAINT Video_FK
FOREIGN KEY (address)
REFERENCES Location(address);

 ALTER TABLE Rent
ADD CONSTRAINT Rent_FK_Card
FOREIGN KEY (cardID)
REFERENCES Card(cardID);

-- ALTER TABLE Rent
-- ADD CONSTRAINT Rent_FK_Book
-- FOREIGN KEY (itemID)
-- REFERENCES Book(bookID);

-- ALTER TABLE Rent
-- ADD CONSTRAINT Rent_FK_Video
-- FOREIGN KEY (itemID)
-- REFERENCES Video(videoID);
 

--INSERTS--
INSERT INTO Card VALUES (101,'A',0);
INSERT INTO Card VALUES (102,'A',0);
INSERT INTO Card VALUES (103,'A',0);
INSERT INTO Card VALUES (104,'A',0);
INSERT INTO Card VALUES (105,'A',0);
INSERT INTO Card VALUES (106,'A',0);
INSERT INTO Card VALUES (107,'B',50);
INSERT INTO Card VALUES (108,'B',10);
INSERT INTO Card VALUES (109,'B',25.5);
INSERT INTO Card VALUES (110,'B',15.25);
INSERT INTO Card VALUES (151,'A',0);
INSERT INTO Card VALUES (152,'A',0);
INSERT INTO Card VALUES (153,'A',0);
INSERT INTO Card VALUES (154,'A',0);
INSERT INTO Card VALUES (155,'A',0);

INSERT INTO Location VALUES ('ARCHEOLOGY_ROAD');
INSERT INTO Location VALUES ('CHEMISTRY_ROAD');
INSERT INTO Location VALUES ('COMPUTING_ROAD');
INSERT INTO Location VALUES ('PHYSICS_ROAD');

INSERT INTO Branch VALUES ('ARCHEOLOGY', 'ARCHEOLOGY_ROAD', 645645645);
INSERT INTO Branch VALUES ('CHEMISTRY', 'CHEMISTRY_ROAD', 622622622);
INSERT INTO Branch VALUES ('COMPUTING', 'COMPUTING_ROAD', 644644644);
INSERT INTO Branch VALUES ('PHYSICS', 'PHYSICS_ROAD', 666666666);

INSERT INTO Customer VALUES (1, 'ALFRED', 'BACON STREET', 623623623, 'alfred123', 'al1', TO_DATE('12-05-2018', 'DD-MM-YYYY'), 101);
INSERT INTO Customer VALUES (2, 'JAMES', 'DOWNTOWN ABBEY', 659659659, 'james123', 'ja2', TO_DATE('10-05-2018', 'DD-MM-YYYY'), 102);
INSERT INTO Customer VALUES (3, 'GEORGE', 'DETROIT CITY', 654654654, 'george123', 'ge3', TO_DATE('21-06-2017', 'DD-MM-YYYY'), 103);
INSERT INTO Customer VALUES (4, 'TOM', 'WASHINGTON DC.', 658658658, 'tom123', 'tom4', TO_DATE('05-12-2016', 'DD-MM-YYYY'), 104);
INSERT INTO Customer VALUES (5, 'PETER', 'CASTERLY ROCK', 652652652, 'peter123', 'pe5', TO_DATE('09-08-2016', 'DD-MM-YYYY'), 105);
INSERT INTO Customer VALUES (6, 'JENNY', 'TERRAKOTA', 651651651, 'jenny123', 'je6', TO_DATE('30-04-2017', 'DD-MM-YYYY'), 106);
INSERT INTO Customer VALUES (7, 'ROSE', 'SWEET HOME ALABAMA', 657657657, 'rose123', 'ro7', TO_DATE('28-02-2018', 'DD-MM-YYYY'), 107);
INSERT INTO Customer VALUES (8, 'MONICA', 'FAKE STREET 123', 639639639, 'monica123', 'mo8', TO_DATE('15-01-2016', 'DD-MM-YYYY'), 108);
INSERT INTO Customer VALUES (9, 'PHOEBE', 'CENTRAL PERK', 678678678, 'phoebe123', 'pho9', TO_DATE('25-03-2016', 'DD-MM-YYYY'), 109);
INSERT INTO Customer VALUES (10, 'RACHEL', 'WHEREVER', 687687687, 'rachel123', 'ra10', TO_DATE('01-09-2017', 'DD-MM-YYYY'), 110);


INSERT INTO Employee VALUES (211, 'ROSS', 'HIS HOUSE', 671671671, 'ross123', 'ro11', 1200, 'ARCHEOLOGY', 101);
INSERT INTO Employee VALUES (212, 'CHANDLER', 'OUR HEARTHS', 688688688, 'chandler123', 'chand12', 1150.50, 'ARCHEOLOGY', 102);
INSERT INTO Employee VALUES (213, 'JOEY', 'LITTLE ITAYLY', 628628628, 'joey123', 'jo13', 975.75, 'ARCHEOLOGY', 103);
INSERT INTO Employee VALUES (214, 'VICTOR', 'SANTA FE', 654321987, 'victor123', 'vic14', 2200, 'COMPUTING', 104);
INSERT INTO Employee VALUES (215, 'JAIRO', 'ARMILLA', 698754321, 'jairo123', 'ja15', 2200.50, 'CHEMISTRY', 105);

INSERT INTO Book VALUES ('A123', 'B1A123', 'GOOD', 'A', 5, 20, 'ARCHEOLOGY_ROAD');
INSERT INTO Book VALUES ('A123', 'B2A123', 'NEW', 'O', 6, 30, 'ARCHEOLOGY_ROAD');
INSERT INTO Book VALUES ('B234', 'B1B234', 'NEW', 'A', 2, 15, 'CHEMISTRY_ROAD');
INSERT INTO Book VALUES ('C321', 'B1C321', 'BAD', 'A', 1, 10, 'PHYSICS_ROAD');
INSERT INTO Book VALUES ('H123', 'B1H123', 'GOOD', 'A', 3, 15, 'CHEMISTRY_ROAD');
INSERT INTO Book VALUES ('Z123', 'B1Z123', 'GOOD', 'O', 4, 20, 'COMPUTING_ROAD');
INSERT INTO Book VALUES ('L321', 'B1L321', 'NEW', 'O', 4, 20, 'COMPUTING_ROAD');
INSERT INTO Book VALUES ('P321', 'B1P321', 'USED', 'A', 2, 12, 'CHEMISTRY_ROAD');

INSERT INTO Video VALUES ('CHEMISTRY FOR DUMMIES', 2016, 'V1CH16', 'NEW', 'O', 10, 50, 'CHEMISTRY_ROAD');
INSERT INTO Video VALUES ('CHEMISTRY FOR DUMMIES', 2016, 'V2CH16', 'BAD', 'A', 5, 20, 'CHEMISTRY_ROAD');
INSERT INTO Video VALUES ('COMPUTING MANAGER', 2014, 'V1CO14', 'GOOD', 'A', 4, 20, 'COMPUTING_ROAD');
INSERT INTO Video VALUES ('JAVA LANGUAGE', 2015, 'V1JA15', 'USED', 'O', 4, 20, 'COMPUTING_ROAD');
INSERT INTO Video VALUES ('DINOSAURS', 2000, 'V1DI00', 'GOOD', 'O', 5, 25, 'ARCHEOLOGY_ROAD');
INSERT INTO Video VALUES ('T-REX, DEADLY KING', 1992, 'V1TR92', 'USED', 'A', 10, 50, 'ARCHEOLOGY_ROAD');
INSERT INTO Video VALUES ('ANCESTORS OF THE HUMANITY', 1998, 'V1AN98', 'BAD', 'A', 3, 15, 'ARCHEOLOGY_ROAD');
INSERT INTO Video VALUES ('PHYSICS, MOST BORING SH*T', 2018, 'V1PH18', 'NEW', 'A', 1, 5, 'PHYSICS_ROAD');

INSERT INTO Rent VALUES (101, 'B2A123',TO_DATE('10-05-2018', 'DD-MM-YYYY'), TO_DATE('20-05-2018', 'DD-MM-YYYY'));
INSERT INTO Rent VALUES (102, 'B1Z123',TO_DATE('10-05-2018', 'DD-MM-YYYY'), TO_DATE('25-05-2018', 'DD-MM-YYYY'));
INSERT INTO Rent VALUES (103, 'V1JA15',TO_DATE('01-05-2018', 'DD-MM-YYYY'), TO_DATE('21-05-2018', 'DD-MM-YYYY'));
INSERT INTO Rent VALUES (105, 'V1DI00',TO_DATE('02-05-2018', 'DD-MM-YYYY'), TO_DATE('25-05-2018', 'DD-MM-YYYY'));
INSERT INTO Rent VALUES (154, 'B1L321',TO_DATE('04-05-2018', 'DD-MM-YYYY'), TO_DATE('26-05-2018', 'DD-MM-YYYY'));
INSERT INTO Rent VALUES (155, 'V1CH16',TO_DATE('29-04-2018', 'DD-MM-YYYY'), TO_DATE('29-05-2018', 'DD-MM-YYYY'));
 


--SELECT--
SELECT * FROM Card;
SELECT * FROM Customer;
SELECT * FROM Employee;
SELECT * FROM Branch;
SELECT * FROM Location;
SELECT * FROM Book;
SELECT * FROM Video;
SELECT * FROM Rent;   


--FUNCTIONS--
--1--
--CUSTOMER--
CREATE OR REPLACE PROCEDURE loginCustomer_library(user IN VARCHAR2, pass IN VARCHAR2)
IS
  passAux customer.password%TYPE;
  incorrect_password EXCEPTION;
BEGIN
  -- Retrieve password for the given username
  SELECT password INTO passAux
  FROM customer
  WHERE username = user;

  -- Check if the entered password matches the stored password
  IF passAux = pass THEN
    DBMS_OUTPUT.PUT_LINE('User ' || user || ' login successful');
  ELSE
    RAISE incorrect_password;
  END IF;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Incorrect username');
  WHEN incorrect_password THEN 
    DBMS_OUTPUT.PUT_LINE('Incorrect password');
END;
/
-- SET SERVEROUTPUT ON;

DECLARE
  l_user VARCHAR2(50) := 'username_here';
  l_pass VARCHAR2(50) := 'password_here';
BEGIN
  loginCustomer_library(l_user, l_pass);
END;
/


--EMPLOYEE-
 CREATE OR REPLACE PROCEDURE loginEmployee_library(user IN VARCHAR2, pass IN VARCHAR2)
IS
  passAux employee.password%TYPE;
  incorrect_password EXCEPTION;
BEGIN
  -- Retrieve password for the given username
  SELECT password INTO passAux
  FROM employee
  WHERE username = user;

  -- Check if the entered password matches the stored password
  IF passAux = pass THEN
    DBMS_OUTPUT.PUT_LINE('User ' || user || ' login successful');
  ELSE
    RAISE incorrect_password;
  END IF;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Incorrect username or password');
  WHEN incorrect_password THEN 
    DBMS_OUTPUT.PUT_LINE('Incorrect username or password');
END;
/
 DECLARE
  l_user VARCHAR2(50) := 'john_doe'; -- Example username within 50 characters
  l_pass VARCHAR2(50) := 'password123'; -- Example password within 50 characters
BEGIN
  loginEmployee_library(l_user, l_pass);
END;
/

--2--
CREATE OR REPLACE PROCEDURE viewItem_library(auxItemID IN VARCHAR2)
IS
  auxISBN VARCHAR2(4);
  auxTitle VARCHAR2(50);
  auxYear NUMBER;
  auxState VARCHAR2(10);
  auxDebyCost NUMBER(10,2);
  auxLostCost NUMBER(10,2);
  auxAddress VARCHAR2(50);
  auxAbala VARCHAR2(1);
  auxVideo NUMBER;
  auxBook NUMBER;
BEGIN
  
  SELECT COUNT(*) INTO auxBook
  FROM book
  WHERE bookid LIKE auxItemID;
  
  SELECT COUNT(*) INTO auxVideo
  FROM video
  WHERE videoid LIKE auxItemID;
  
  IF auxBook > 0 THEN
    SELECT isbn, state, avalability, debycost, lostcost, address
    INTO auxISBN, auxState, auxAbala, auxDebyCost, auxLostCost, auxAddress
    FROM book
    WHERE bookid LIKE auxItemID;
  
    DBMS_OUTPUT.PUT_LINE('BOOK ' || auxItemID || ' INFO');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('ISBN: ' || auxISBN);
    DBMS_OUTPUT.PUT_LINE('STATE: ' || auxState);
    DBMS_OUTPUT.PUT_LINE('AVALABILITY: ' || auxAbala);
    DBMS_OUTPUT.PUT_LINE('DEBY COST: ' || auxDebyCost);
    DBMS_OUTPUT.PUT_LINE('LOST COST: ' || auxLostCost);
    DBMS_OUTPUT.PUT_LINE('ADDRESS: ' || auxAddress);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  ELSIF auxVideo > 0 THEN
    SELECT title, year, state, avalability, debycost, lostcost, address
    INTO auxTitle, auxYear, auxState, auxAbala, auxDebyCost, auxLostCost, auxAddress
    FROM video
    WHERE videoid LIKE auxItemID;
  
    DBMS_OUTPUT.PUT_LINE('VIDEO ' || auxItemID || ' INFO');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('TITLE: ' || auxTitle);
    DBMS_OUTPUT.PUT_LINE('YEAR: ' || auxYear);
    DBMS_OUTPUT.PUT_LINE('STATE: ' || auxState);
    DBMS_OUTPUT.PUT_LINE('AVALABILITY: ' || auxAbala);
    DBMS_OUTPUT.PUT_LINE('DEBY COST: ' || auxDebyCost);
    DBMS_OUTPUT.PUT_LINE('LOST COST: ' || auxLostCost);
    DBMS_OUTPUT.PUT_LINE('ADDRESS: ' || auxAddress);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  END IF;
END;
/
-- SET SERVEROUTPUT ON;
 DECLARE
  auxItemID VARCHAR2(10);
BEGIN
  auxItemID := 'B2A123'; -- Example Item_ID value
  viewItem_library(auxItemID);
END;
/

--3--
--CUSTOMER--
CREATE OR REPLACE PROCEDURE customerAccount_library(custoID IN customer.customerid%TYPE)
IS
  auxCard NUMBER;
  auxFines NUMBER;
  auxItem VARCHAR(6);
  rented number := 0;
BEGIN
  SELECT cardnumber INTO auxCard
  FROM customer
  WHERE customerid LIKE custoID;
  
  SELECT COUNT(*) INTO rented
  FROM rent
  WHERE rent.cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user card is ' || auxCard);  
  IF (rented > 0) THEN
    SELECT rent.itemid INTO auxItem
    FROM rent,card
    WHERE card.cardid = rent.cardid
    AND card.cardid LIKE auxCard;    
    
    DBMS_OUTPUT.PUT_LINE('The user has ' || auxItem || ' rented');
  ELSE    
    DBMS_OUTPUT.PUT_LINE('This user has no rents'); 
  END IF;
  
  SELECT fines INTO auxFines
  FROM card
  WHERE cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user fines are ' || auxFines);
    
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('NOT DATA FOUND');
END;
/
-- SET SERVEROUTPUT ON;
DECLARE
  custoID customer.customerid%TYPE;
BEGIN
  custoID := 101; -- Assuming 101 is a valid Customer_ID (replace with the correct value)

  -- Call the procedure with the numeric Customer_ID
  customerAccount_library(custoID);
END;
/


--EMPLOYEE--
CREATE OR REPLACE PROCEDURE employeeAccount_library(emploID IN employee.employeeid%TYPE)
IS
  auxCard NUMBER;
  auxFines NUMBER;
  auxItem VARCHAR(6);
  rented number := 0;
BEGIN
  SELECT cardnumber INTO auxCard
  FROM employee
  WHERE employeeid LIKE emploID;
  
  SELECT COUNT(*) INTO rented
  FROM rent
  WHERE rent.cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user card is ' || auxCard);  
  IF (rented > 0) THEN
    SELECT rent.itemid INTO auxItem
    FROM rent,card
    WHERE card.cardid = rent.cardid
    AND card.cardid LIKE auxCard;    
    
    DBMS_OUTPUT.PUT_LINE('The user has ' || auxItem || ' rented');
  ELSE    
    DBMS_OUTPUT.PUT_LINE('This user has no rents'); 
  END IF;
  
  SELECT fines INTO auxFines
  FROM card
  WHERE cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user fines are ' || auxFines);
    
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('NOT DATA FOUND');
END;
/
-- SET SERVEROUTPUT ON;
DECLARE
  emploID employee.employeeid%TYPE;
BEGIN
  emploID := 211;
  employeeAccount_library(emploID);
END;
/


--4--
CREATE OR REPLACE PROCEDURE RENTITEM_LIBRARY(auxCard IN NUMBER, auxItemID IN VARCHAR2, itemType IN VARCHAR2, auxDate IN DATE)
IS
  statusAux VARCHAR2(1);
  itemStatus VARCHAR2(1);
BEGIN
  
  SELECT status INTO statusAux
  FROM card
  WHERE cardid LIKE auxCard;
  
  IF statusAux LIKE 'A' THEN
    IF itemType LIKE 'book' THEN
      SELECT avalability INTO itemStatus
      FROM book
      WHERE bookid LIKE auxItemID;
      
      IF itemStatus LIKE 'A' THEN
        UPDATE book
        SET avalability = 'O'
        WHERE bookid LIKE auxItemID;
        
        INSERT INTO rent
        VALUES (auxCard,auxItemID,sysdate,auxDate);
        DBMS_OUTPUT.PUT_LINE('Item ' || auxItemID || ' rented');
      ELSE
        DBMS_OUTPUT.PUT_LINE('The item is already rented');
      END IF;
      
    ELSIF itemType LIKE 'video' THEN
     
      SELECT avalability INTO itemStatus
      FROM video
      WHERE videoid LIKE auxItemID;
      
      IF itemStatus LIKE 'A' THEN
        UPDATE video
        SET avalability = 'O'
        WHERE videoid LIKE auxItemID;
        
        INSERT INTO rent
        VALUES (auxCard,auxItemID,sysdate,auxDate);
        DBMS_OUTPUT.PUT_LINE('Item ' || auxItemID || ' rented');
      ELSE
        DBMS_OUTPUT.PUT_LINE('The item is already rented');
      END IF;
    
  ELSE
    DBMS_OUTPUT.PUT_LINE('The user is blocked');
  END IF;  
end if;
END;
/
-- SET SERVEROUTPUT ON;
DECLARE
  auxCard NUMBER;
  auxItemID VARCHAR2(10);
  itemType VARCHAR2(20);
  auxDate DATE;
BEGIN
  auxCard := 101;
  itemType :=  'A123';  
  auxItemID := 'V1CH16' ;  
  auxDate := TO_DATE('20-05-2018', 'DD-MM-YYYY') ;
  RENTITEM_LIBRARY(auxCard,auxItemID,itemType,auxDate);
END;
/
SELECT * FROM customer;
-- SELECT * FROM rent;  ERROR
SELECT * FROM card;



--5--
CREATE OR REPLACE PROCEDURE payFines_library(auxCard IN card.cardid%TYPE, money IN NUMBER)
IS
  finesAmount NUMBER;
  total NUMBER;
BEGIN
  SELECT fines INTO finesAmount
  FROM card
  WHERE cardid LIKE auxCard;
  
  IF finesAmount < money THEN
    total := money - finesAmount;
    DBMS_OUTPUT.PUT_LINE('YOU PAY ALL YOUR FINES AND YOU HAVE ' || total || ' MONEY BACK');
    
    UPDATE card
    SET status = 'A', fines = 0
    WHERE cardid = auxCard;
    
  ELSIF finesAmount = money THEN
    total := money - finesAmount;
    DBMS_OUTPUT.PUT_LINE('YOU PAY ALL YOUR FINES');
    
    UPDATE card
    SET status = 'A', fines = 0
    WHERE cardid = auxCard;
  
  ELSE
    total := finesAmount - money;
    DBMS_OUTPUT.PUT_LINE('YOU WILL NEED TO PAY ' || total || ' MORE DOLLARS TO UNLOCK YOUR CARD');
    
    UPDATE card
    SET fines = total
    WHERE cardid = auxCard;
  END IF;
END;
/
-- SET SERVEROUTPUT ON;
DECLARE
  auxCard card.cardid%TYPE;
  money NUMBER;
BEGIN
  auxCard := 101;
  money := 200;
  payFines_library(auxCard,money);
END;
/


--6--
--CUSTOMER--
CREATE OR REPLACE PROCEDURE updateInfoCusto_library(auxCustomer IN customer.customerid%TYPE, pNumber NUMBER, address VARCHAR2, newPass VARCHAR2)
IS
BEGIN
  UPDATE customer
  SET phone = pNumber, customeraddress = address, password = newPass
  WHERE customerid = auxCustomer;
END;
/
-- SET SERVEROUTPUT ON;
DECLARE
  auxCustomer customer.customerid%TYPE;
  pNumber NUMBER;
  address VARCHAR2(50);
  newPass VARCHAR2(40);
BEGIN
  auxCustomer := 1;
  pNumber :=  623623623;
  address :=  'BACON STREET';
  newPass :=  'AA3';
  updateInfoCusto_library(auxCustomer,pNumber,address,newPass);
END;
/
--EMPLOYEE--
 CREATE OR REPLACE PROCEDURE updateInfoEmp_library(
  auxEmployee IN employee.employeeID%TYPE,
  pNumber IN NUMBER,
  address IN VARCHAR2,
  newPass IN VARCHAR2,
  newPayCheck IN employee.paycheck%TYPE,
  newBranch IN VARCHAR2
)
IS
BEGIN
  UPDATE employee
  SET phone = pNumber,
      employeeAddress = address,
      password = newPass,
      paycheck = newPayCheck,
      branchName = newBranch
  WHERE employeeID = auxEmployee;
  
  DBMS_OUTPUT.PUT_LINE('Employee ' || auxEmployee || ' updated successfully');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Employee with ID ' || auxEmployee || ' not found');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error updating employee: ' || SQLERRM);
END updateInfoEmp_library;
/


-- SET SERVEROUTPUT ON;
DECLARE
  auxEmployee employee.employeeid%TYPE;
  pNumber NUMBER;
  address VARCHAR2(50);
  newPass VARCHAR2(20);
  newPayCheck NUMBER(8,2);
  newBranch VARCHAR2(40);
BEGIN
  auxEmployee := 211;
  pNumber :=  687687687;
  address := 'HIS HOUSE';
  newPass :=  'ross000';
  newPayCheck := 1200;
  newBranch := 'ARCHEONEW';
  updateInfoEmp_library(auxEmployee,pNumber,address,newPass,newPayCheck,newBranch);
END;
/

--7--
CREATE OR REPLACE PROCEDURE addCustomer_library(auxCustomerId IN NUMBER, auxName IN VARCHAR2, auxCustomerAddress IN VARCHAR2, auxPhone IN NUMBER,
auxPass IN VARCHAR2, auxUserName IN VARCHAR2, auxCardNumber IN NUMBER)
IS
BEGIN
  INSERT INTO customer
  VALUES (auxCustomerId,auxName,auxCustomerAddress,auxPhone,auxPass,auxUserName,sysdate,auxCardNumber);
END;
/

-- SET SERVEROUTPUT ON;
DECLARE
  auxCustomerId NUMBER;
  auxName VARCHAR2(20);
  auxCustomerAddress VARCHAR2(20);
  auxPhone NUMBER;
  auxPass VARCHAR2(20);
  auxUserName VARCHAR2(20);
  auxCardNumber NUMBER;
BEGIN
  auxCustomerId := 13;  
  auxName :=  'ALFREo';
  auxCustomerAddress := 'PHYSICS_STREET';
  auxPhone := 623623623;
  auxPass := 'alfr100';
  auxUserName := 'alq' ;
  auxCardNumber := 153;
  addCustomer_library(auxCustomerId,auxName,auxCustomerAddress,auxPhone,auxPass,auxUserName,auxCardNumber);
END;
/
select * from customer;
--8--
--CUSTOMER--
CREATE OR REPLACE TRIGGER addCardCusto_library
AFTER INSERT
ON customer
FOR EACH ROW
DECLARE
BEGIN
  INSERT INTO card
  VALUES (:new.cardnumber,'A',0);
  DBMS_OUTPUT.PUT_LINE('Card created');
END;
/
--EMPLOYEE--
CREATE OR REPLACE TRIGGER addCardEmp_library
AFTER INSERT
ON employee
FOR EACH ROW
DECLARE
BEGIN
  INSERT INTO card
  VALUES (:new.cardnumber,'A',0);
  
  DBMS_OUTPUT.PUT_LINE('Card created');
END;
/

--9--
CREATE OR REPLACE PROCEDURE allMedia_library(mediaType VARCHAR2)
IS
  CURSOR cBooks
  IS
    SELECT *
    FROM book;
  
  CURSOR cVideos
  IS
    SELECT *
    FROM video;
  
  xBooks cBooks%ROWTYPE;
  xVideos cVideos%ROWTYPE;
BEGIN
  IF mediaType LIKE 'books' THEN
    OPEN cBooks;
    
    DBMS_OUTPUT.PUT_LINE('ISBN     ID     STATE     AVALABILITY     DEBY_COST     LOST_COST    LOCATION');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------');
    
    LOOP
      FETCH cBooks
      INTO xBooks;
      EXIT WHEN cBooks%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE(xBooks.isbn || '     ' || xBooks.bookid || '     ' || xBooks.state || '     ' || xBooks.avalability || '     ' || xBooks.debycost || '     ' ||
      xBooks.lostcost || '     ' || xBooks.address);
    END LOOP;
  ELSIF mediaType LIKE 'videos' THEN
    OPEN cVideos;
    DBMS_OUTPUT.PUT_LINE('TITLE     YEAR     ID     STATE     AVALABILITY     DEBY_COST     LOST_COST    LOCATION');
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------');
    LOOP
      FETCH cVideos
      INTO xVideos;
      EXIT WHEN cVideos%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE(xVideos.title || '     ' || xVideos.year || '     ' || xVideos.videoid || '     ' || xVideos.state || '     ' || xVideos.avalability || '     ' || xVideos.debycost || '     ' ||
      xVideos.lostcost || '     ' || xVideos.address);
    END LOOP;
  ELSE
    DBMS_OUTPUT.PUT_LINE('TYPE INCORRECT, you must choose between books or videos');
  END IF;
END;
/

-- SET SERVEROUTPUT ON;
DECLARE
  typeItem VARCHAR2(10);
BEGIN
  typeItem := 'V1CH16';
  allMedia_library(typeItem);
END;
/


--10--
CREATE OR REPLACE PROCEDURE handleReturns_library(auxItemID IN VARCHAR2)
IS
  auxRented NUMBER;
  auxBook NUMBER;
  auxVideo NUMBER;
BEGIN
  SELECT COUNT(*) INTO auxRented
  FROM rent
  WHERE itemid LIKE auxItemID;
  
  SELECT COUNT(*) INTO auxBook
  FROM book
  WHERE bookid LIKE auxItemID;
  
  SELECT COUNT(*) INTO auxVideo
  FROM video
  WHERE videoid LIKE auxItemID;
  
  IF auxRented > 0 THEN
    DELETE FROM rent
    WHERE itemid = auxItemID;
    IF auxBook > 0 THEN
      UPDATE book
      SET avalability = 'A'
      WHERE bookid LIKE auxItemID;
      DBMS_OUTPUT.PUT_LINE('The book ' || auxItemID || ' is now avaible.');
    ELSIF auxVideo > 0 THEN
      UPDATE video
      SET avalability = 'A'
      WHERE videoid LIKE auxItemID;
      DBMS_OUTPUT.PUT_LINE('The video ' || auxItemID || ' is now avaible.');
    END IF;
  ELSE
    DBMS_OUTPUT.PUT_LINE('This item is not rented at the moment');
  END IF;
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('Item ID incorrect');    
END;
/
-- SET SERVEROUTPUT ON;
DECLARE
  auxItemID VARCHAR2(10);
BEGIN
  auxItemID := 'B2A123';
  handleReturns_library(auxItemID);
END;
/

SELECT * FROM rent;
SELECT * FROM book;


--11--
CREATE OR REPLACE TRIGGER modifyFines_library
AFTER DELETE
ON rent
FOR EACH ROW
DECLARE
  auxCardID NUMBER;
  auxItemID VARCHAR2(6);
  auxBook NUMBER;
  auxVideo NUMBER;
  auxDeby NUMBER;
BEGIN  
  SELECT cardid, itemid INTO auxCardID, auxItemID
  FROM rent
  WHERE cardid LIKE :old.cardid;
  
  SELECT COUNT(*) INTO auxBook
  FROM book
  WHERE bookid LIKE auxItemID;
  
  SELECT COUNT(*) INTO auxVideo
  FROM video
  WHERE videoid LIKE auxItemID;
  
  IF sysdate > :old.returndate THEN
    IF auxVideo > 0 THEN 
      SELECT debyCost INTO auxDeby
      FROM video
      WHERE videoid LIKE auxItemID;
    ELSIF auxBook > 0 THEN
      SELECT debyCost INTO auxDeby
      FROM book
      WHERE bookid LIKE auxItemID;
    END IF;
    
    UPDATE card
    SET status = 'B', fines = (fines + auxDeby)
    WHERE cardid LIKE auxCardID;
  ELSE
    DBMS_OUTPUT.PUT_LINE('The item has been return before deadline');
  END IF;
END;
/
SELECT * FROM rent;

-- SET SERVEROUTPUT ON;
DECLARE
  auxCard NUMBER;
  auxItemID VARCHAR2(10);
  itemType VARCHAR2(20);
  auxDate DATE;
BEGIN
  auxCard :=  101; 
  itemType := 'B2A123';  
  auxItemID :='B2A123' ;  
  auxDate := TO_DATE('20-05-2018', 'DD-MM-YYYY');
  RENTITEM_LIBRARY(auxCard,auxItemID,itemType,auxDate);
END;
/
SELECT * FROM rent;

-- SET SERVEROUTPUT ON;
DECLARE
  auxItemID VARCHAR2(10);
BEGIN
  auxItemID := 'B2A123';
  handleReturns_library(auxItemID);
END;
/
 
SELECT * FROM card;



--12--
--BOOK--
CREATE OR REPLACE PROCEDURE addBook_library(auxISBN IN VARCHAR2, auxBookID IN VARCHAR2, auxState IN VARCHAR2, auxDebyCost IN NUMBER,
auxLostCost IN NUMBER, auxAddress IN VARCHAR2)
IS
BEGIN
  INSERT INTO book
  VALUES(auxISBN,auxBookID,auxState,'A',auxDebyCost,auxLostCost,auxAddress);
  DBMS_OUTPUT.PUT_LINE('Book inserted correctly');
END;
/
--VIDEO--
CREATE OR REPLACE PROCEDURE addVideo_library(auxTitle IN VARCHAR2, auxYear IN INT, auxVideoID IN VARCHAR2, auxState IN VARCHAR2, auxDebyCost IN NUMBER,
auxLostCost IN NUMBER, auxAddress IN VARCHAR2)
IS
BEGIN
  INSERT INTO video
  VALUES(auxTitle,auxYear,auxVideoID,auxState,'A',auxDebyCost,auxLostCost,auxAddress);
  DBMS_OUTPUT.PUT_LINE('Video inserted correctly');
END;
/

--EXAMPLES--
-- SET SERVEROUTPUT ON;
DECLARE
  auxISBN VARCHAR2(4);
  auxItemID VARCHAR2(6);
  auxState VARCHAR2(10);
  auxDebyCost NUMBER(10,2);
  auxLostCost NUMBER(10,2);
  auxAddress VARCHAR2(50);
BEGIN  
    auxISBN := 'L33';
    auxItemID :='B1A303';
    auxState := 'GOOD' ;
    auxDebyCost := 5 ;
    auxLostCost := 20;
    auxAddress := 'PHYSICS_ROAD';
    addBook_library(auxISBN, auxItemID, auxState, auxDebyCost, auxLostCost, auxAddress);
END;
/
SELECT * FROM book;

-- SET SERVEROUTPUT ON;
DECLARE
  auxTitle VARCHAR2(50);
  auxYear INT;
  auxItemID VARCHAR2(6);
  auxState VARCHAR2(10);
  auxDebyCost NUMBER(10,2);
  auxLostCost NUMBER(10,2);
  auxAddress VARCHAR2(50);
BEGIN  
    auxTitle := 'YOO FOR DUMMIES' ;
    auxYear :=  2016;
    auxItemID :=  'V1CH00';
    auxState := 'NEW';
    auxDebyCost := 10;
    auxLostCost := 50;
    auxAddress := 'PHYSICS_ROAD';
    addVideo_library(auxTitle, auxYear, auxItemID, auxState, auxDebyCost, auxLostCost, auxAddress);
END;
/

SELECT * FROM video;



--13--
CREATE OR REPLACE PROCEDURE removeItem_library(auxItemID IN VARCHAR2)
IS
  auxBook NUMBER;
  auxVideo NUMBER;
BEGIN
  SELECT COUNT(*) INTO auxBook
  FROM book
  WHERE bookid LIKE auxItemID;
  
  SELECT COUNT(*) INTO auxVideo
  FROM video
  WHERE videoid LIKE auxItemID;
  
  IF auxBook > 0 THEN
    DELETE FROM book
    WHERE bookid LIKE auxItemID;
    DBMS_OUTPUT.PUT_LINE('Book removed correctly');
  ELSIF auxVideo > 0 THEN
    DELETE FROM video
    WHERE videoid LIKE auxItemID;
    DBMS_OUTPUT.PUT_LINE('Video removed correctly');
  END IF;
END;
/
-- SET SERVEROUTPUT ON;
DECLARE
  auxItemID VARCHAR2(10);
BEGIN
  auxItemID :='V1CH16' ;
  removeItem_library(auxItemID);
END;
/


--14--
--The statement indicates the creation of another function, but we have made function five meet both needs--


--14--
CREATE OR REPLACE PROCEDURE viewCustomer_library(auxCustomerID IN NUMBER)
IS
  custoName VARCHAR2(40);
  custoAdd VARCHAR2(50);
  custoPhone NUMBER(9);
  userNaM VARCHAR2(10);
  custoDate DATE;
  custoCard NUMBER;
BEGIN
  SELECT name,customeraddress,phone,username,datesignup,cardnumber
  INTO custoName, custoAdd, custoPhone, userNaM, custoDate, custoCard
  FROM customer
  WHERE customerid LIKE auxCustomerID;
  
  DBMS_OUTPUT.PUT_LINE('CUSTOMER ' || auxCustomerID || ' INFO');
  DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  DBMS_OUTPUT.PUT_LINE('NAME: ' || custoName);
  DBMS_OUTPUT.PUT_LINE('ADDRESS: ' || custoAdd);
  DBMS_OUTPUT.PUT_LINE('PHONE: ' || custoPhone);
  DBMS_OUTPUT.PUT_LINE('USER NAME: ' || userNaM);
  DBMS_OUTPUT.PUT_LINE('DATE OF SIGN UP: ' || custoDate);
  DBMS_OUTPUT.PUT_LINE('CARD NUMBER: ' || custoCard);
  DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  
END;
/
-- SET SERVEROUTPUT ON;
DECLARE
  auxCustoID VARCHAR2(10);
BEGIN
  auxCustoID := 1;
  viewCustomer_library(auxCustoID);
END;
/


--OBJECT--
CREATE OR REPLACE TYPE director_library AS OBJECT(
employeeid NUMBER,
name VARCHAR2(40),
address VARCHAR2(50),
phone INT(9),
paycheck NUMBER(10,2),
extrapaycheck NUMBER(10,2)
);
/

-- SET SERVEROUTPUT ON;
DECLARE 
   director director_library; 
BEGIN 
   director := director_library('212', 'CHANDLER', 'OUR HEARTHS', 688688688,1150.5,500); 
   dbms_output.put_line('DIRECTOR ID: '|| director.employeeid); 
   dbms_output.put_line('--------------------------------------------' ); 
   dbms_output.put_line('NAME: '|| director.name); 
   dbms_output.put_line('ADDRESS: '|| director.address); 
   dbms_output.put_line('PHONE: '|| director.phone); 
   dbms_output.put_line('PAYCHECK: '|| director.paycheck); 
   dbms_output.put_line('EXTRA: '|| director.extrapaycheck);
   dbms_output.put_line('--------------------------------------------' ); 
END;
/