-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT ProductName, [Category].CategoryName FROM [Product]
JOIN [Category] 
ON [Product].CategoryId=[Category].Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT Id, [Shipper].CompanyName FROM [Order]
JOIN [Shipper]
ON [Order].ShipVia=[Shipper].Id
WHERE [Order].OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT ProductName, Quantity FROM [OrderDetail]
JOIN [Product]
ON [OrderDetail].ProductId=[Product].id
WHERE [OrderDetail].OrderId='10251'
Order By ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT Id AS Order_ID, CompanyName, LastName FROM [Order]
JOIN [Customer]
ON [Order].CustomerId=[Customer].id
JOIN [Employee]
ON [Order].EmployeeId=[Employee].id

-- Stretch: Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.

SELECT CategoryName, COUNT([Products].CategoryID) FROM [Products] 
JOIN [Categories] 
ON [Products].CategoryID=[Categories].CategoryID
GROUP BY CategoryName

-- Stretch: Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.

SELECT OrderID, SUM(Quantity) AS ItemCount FROM [OrderDetails]
GROUP BY OrderID