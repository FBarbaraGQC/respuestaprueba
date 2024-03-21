 
 /* 
 ******************************************* EJERCICIO SQL // FABIANA QUINTANA ******************************************************

 1. Obtener la lista de los productos no descatalogados incluyendo el nombre de la categoría ordenado por nombre de producto.

 Respuesta:
*/
 
 SELECT Products.ProductName, Categories.CategoryName 
   FROM Products 
   INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID 
   WHERE Products.Discontinued = 0 
   ORDER BY Products.ProductName 

 /* 
 2.	Mostrar el nombre de los clientes de Nancy Davolio.

 Respuesta:
*/

 SELECT DISTINCT Customers.ContactName 
   FROM Customers 
   INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID 
   INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID 
   WHERE Employees.FirstName = 'Nancy' AND Employees.LastName = 'Davolio'
   ORDER BY Customers.ContactName

 /* 
 3.	Mostrar el total facturado por año del empleado Steven Buchanan

 Respuesta:
*/

SELECT YEAR(OrderDate) AS 'Año', SUM(UnitPrice * Quantity) AS 'Total Facturado'
FROM [Order Details] o
INNER JOIN Orders o2 ON o.OrderID = o2.OrderID
INNER JOIN Employees e ON o2.EmployeeID = e.EmployeeID
WHERE e.FirstName = 'Steven' AND e.LastName = 'Buchanan'
GROUP BY YEAR(OrderDate)
ORDER BY YEAR(OrderDate);

 /* 
 4.	Mostrar el nombre de los empleados que dependan directa o indirectamente de Andrew Fuller.

 Respuesta:
*/

SELECT e1.FirstName, e1.LastName
FROM Employees e1
INNER JOIN Employees e2 ON e1.ReportsTo = e2.EmployeeID
WHERE e2.FirstName = 'Andrew' AND e2.LastName = 'Fuller'