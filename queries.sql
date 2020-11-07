-- 1. Number of packages in the database
SELECT COUNT(*) FROM `package`;

-- 2. Packages sent between the years 1700 and 1800
SELECT * FROM package WHERE DateOfShipping BETWEEN "1700-01-01" AND "1800-12-31";

-- 3. List of streets, numbers and zip codes which have a zip code starting with 10
SELECT `Street`, `Number`, `ZipCode` FROM `address` WHERE `ZipCode` LIKE "10%";

-- 4. Weights of the two least expensive package types
SELECT `Weight` FROM type ORDER BY Price ASC LIMIT 2;

-- 5. Average price grouped by package type size
SELECT `Size`, AVG(`Price`) FROM `type` GROUP BY `Size`;

-- 6. Size of the most expensive package type
SELECT Size FROM type WHERE Price IN (SELECT MAX(Price) as Price from type);

-- 7. All package types and in case they have been used, their PackageID, DateOfShipping and DateOfDelivery
SELECT `Size`, `PackageID`, `DateOfShipping`,`DateOfDelivery` FROM type LEFT JOIN package on type.TypeID = package.PackageID;

-- 8. All customers who have titles
SELECT * FROM name WHERE Title IS NOT NULL AND NameID IN
(SELECT NameID FROM customer);

-- 9. Number of packages sent from Vienna
SELECT COUNT(*) FROM package WHERE SenderID IN 
(SELECT CustomerID FROM customer WHERE AddressID IN 
 (SELECT AddressID FROM address WHERE ZipCode IN 
  (SELECT ZipCode from zip_code WHERE City = "Vienna")
 )
);

-- 10. Full name and address of all unique senders (Bonus: 4 joins)
SELECT DISTINCT name.FirstName, name.LastName, address.Street, address.Number, address.ZipCode, zip_code.City FROM package
INNER JOIN customer As Sender on package.SenderID = Sender.CustomerID 
INNER JOIN name ON Sender.NameID = name.NameID 
INNER JOIN address ON Sender.AddressID = address.AddressID 
INNER JOIN zip_code on address.ZipCode = zip_code.ZipCode;