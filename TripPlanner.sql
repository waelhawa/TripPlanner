CREATE DATABASE TripPlanner;

GO

USE TripPlanner;

CREATE TABLE [User] 
(
userId INT IDENTITY (1,1),
[name] NVARCHAR (25) NOT NULL,
[address] NVARCHAR (50),
[phone] NVARCHAR (10),
DOB DATE
PRIMARY KEY (userId)
);

CREATE TABLE Passport
(
passportId NVARCHAR (9),
expirationDate DATE,
[address] NVARCHAR (50)
PRIMARY KEY (passportId)
);

CREATE TABLE Trip 
(
tripId INT IDENTITY (1,1),
budget DECIMAL (8,2),
startingDest NVARCHAR (50),
endingDest NVARCHAR (50),
startDate DATE,
endDate Date,
tripMode NVARCHAR (25)
PRIMARY KEY (tripId)
);

CREATE TABLE Hotel 
(
hotelId INT IDENTITY (1,1),
[name] NVARCHAR (25),
[address] NVARCHAR (50),
phone NVARCHAR (10),
costPerNight DECIMAL (8,2),
checkIn DATE,
checkOut DATE,
PRIMARY KEY (hotelId)
);

ALTER TABLE [User]
ADD passportId NVARCHAR(9)
FOREIGN KEY
REFERENCES Passport(passportId);

ALTER TABLE Trip
ADD userId INT
FOREIGN KEY
REFERENCES [User](userId);

CREATE TABLE user_trip_hotel
(
userId INT FOREIGN KEY REFERENCES [User](userId),
tripId INT FOREIGN KEY REFERENCES Trip(tripId),
hotelId INT FOREIGN KEY REFERENCES Hotel(hotelId),
PRIMARY KEY (userId,tripId,hotelId)
);

