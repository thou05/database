USE Northwind

SELECT * FROM Shippers

SELECT * FROM Shippers WHERE ShipperID = 1

SELECT * FROM Shippers WHERE CompanyName = 'Speedy Express'
--3
SELECT * FROM Orders  WHERE ShipVia = (
										SELECT ShipperID FROM Shippers WHERE CompanyName = 'Speedy Express'
										)

--4
SELECT * FROM Orders WHERE ShipVia = (
										SELECT ShipperID FROM Shippers WHERE CompanyName = 'Speedy Express'
										)
									AND Freight BETWEEN 50 AND 100 
		

--5
SELECT * FROM Products 
WHERE CategoryID = (	
					SELECT CategoryID FROM Products WHERE ProductName = 'Filo Mix' )

--6
SELECT * FROM Employees WHERE BirthDate > (SELECT BirthDate FROM Employees WHERE FirstName = 'Janet')





						
