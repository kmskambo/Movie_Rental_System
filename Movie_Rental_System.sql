create database Movie_Rental_System;
drop database Movie_Rental_System;
use Movie_Rental_System;

create table Category(
ID INT(10) NOT NULL PRIMARY KEY,
NAME varchar(25),
Last_Update timestamp 
);

create table Film_Category(
FilmID INT(10) NOT NULL,
CategoryID INT(10) NOT NULL,
Last_Update timestamp,
FOREIGN KEY (FilmID) REFERENCES Film(ID),
FOREIGN KEY (CategoryID) REFERENCES Category(ID)
);

create table Film(
ID INT(10) NOT NULL PRIMARY KEY,
LanguageID INT(10) NOT NULL,
Title varchar(225) NOT NULL,
Properties varchar(225) NOT NULL,
Release_Year INT(4) NOT NULL,
Rental_Duration Int(10) NOT NULL,
Rental_Rate numeric(19,0) NOT NULL,
Length_Film INT(2) NOT NULL,
Replacement_Cost numeric(19,0) NOT NULL,
Rating INT(10) NOT NULL,
Last_Update timestamp NOT NULL,
Special_Features varchar(255) NOT NULL,
Full_text varchar(255) NOT NULL,
FOREIGN KEY (LanguageID) REFERENCES Language_table(ID)
);

create table Language_table(
ID INT(10) NOT NULL PRIMARY KEY,
Name varchar(20) NOT NULL,
Last_update timestamp NOT NULL
);

create table Film_Actor(
FilmID INT(10) NOT NULL,
ActorID INT(10) NOT NULL,
Last_Update timestamp NOT NULL,
FOREIGN KEY (FilmID) REFERENCES Film(ID),
FOREIGN KEY (ActorID) REFERENCES Actor(ID)

);

create table Inventory(
ID INT(10) NOT NULL PRIMARY KEY,
FilmID INT(10) NOT NULL,
Last_Update timestamp NOT NULL,
FOREIGN KEY (FilmID) REFERENCES Film(ID)
);


create table Rental(
ID INT(10) NOT NULL PRIMARY KEY,
StaffID INT(10) NOT NULL,
CustomerID INT(10) NOT NULL,
InventoryID INT(10) NOT NULL,
Rental_Date timestamp NOT NULL,
Return_ID timestamp NOT NULL,
Last_Update timestamp NOT NULL,
FOREIGN KEY (StaffID) REFERENCES Staff(ID),
FOREIGN KEY (CustomerID) REFERENCES Customer(ID),
FOREIGN KEY (InventoryID) REFERENCES Inventory(ID)
);

create table Payment(
ID INT(10) NOT NULL PRIMARY KEY,
RentalID INT(10) NOT NULL,
CustomerID INT(10) NOT NULL,
StaffID INT(10) NOT NULL,
Amount numeric(19,0) NOT NULL,
Payment_Date timestamp NOT NULL,
FOREIGN KEY (RentalID) REFERENCES Rental(ID),
FOREIGN KEY (CustomerID) REFERENCES Customer(ID),
FOREIGN KEY (StaffID) REFERENCES Staff(ID)
);

create table Staff(
ID INT(10) NOT NULL PRIMARY KEY,
AddressID INT(10),
StoreID INT(10),
PaymentID INT(10) NOT NULL,
First_Name varchar(255) NOT NULL,
Last_Name varchar(255) NOT NULL,
Email varchar(255) NOT NULL,
Active char(1) NOT NULL,
Username varchar(255) NOT NULL,
Password varchar(255) NOT NULL,
Last_Update timestamp NOT NULL,
PictureURL varchar(255) NOT NULL,
FOREIGN KEY (AddressID) REFERENCES Address(ID),
FOREIGN KEY (StoreID) REFERENCES Store(ID)
);

create table Actor(
ID INT(10) NOT NULL PRIMARY KEY,
First_Name varchar(255) NOT NULL,
Last_Name varchar(255) NOT NULL,
Last_Update timestamp NOT NULL
);

create table Customer(
ID INT(10) NOT NULL PRIMARY KEY,
AddressID INT(10) NOT NULL,
AddressColumn varchar(255) NOT NULL,
First_Name varchar(255) NOT NULL,
Last_Name varchar(255) NOT NULL,
Email varchar(255) NOT NULL,
Active char(1) NOT NULL,
Create_Date timestamp NOT NULL,
Last_Update timestamp NOT NULL,
FOREIGN KEY (AddressID) REFERENCES Address(ID)
);

create table Address(
ID INT(10) NOT NULL PRIMARY KEY,
CityID INT(10),
Address varchar(50) NOT NULL,
Address2 varchar(50) NOT NULL,
District varchar(50) NOT NULL,
Postal_Code varchar(50) NOT NULL,
Phone varchar(10) NOT NULL,
Last_Update timestamp NOT NULL,
FOREIGN KEY (CityID) REFERENCES City(ID)
);

create table City(
ID INT(10) NOT NULL PRIMARY KEY,
CountryID INT(10) NOT NULL,
City varchar(255) NOT NULL,
Last_Update timestamp NOT NULL,
FOREIGN KEY (CountryID) REFERENCES Country(ID)
);

create table Country(
ID INT(10) NOT NULL PRIMARY KEY,
Country varchar(255) NOT NULL,
Last_Update varchar(255) NOT NULL
);

create table Store(
ID INT(10) NOT NULL PRIMARY KEY,
AddressID INT(10) NOT NULL,
Last_Update timestamp NOT NULL,
FOREIGN KEY (AddressID) REFERENCES Address(ID)
);


















