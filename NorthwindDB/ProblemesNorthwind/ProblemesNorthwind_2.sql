-- 11. Retorna el nom i la data de naixement de l’empleat Steven Buchanan usant la taula Employees.
SELECT FirstName, LastName, BirthDate
FROM Employees
WHERE FirstName = 'Steven' AND LastName = 'Buchanan';

-- 12. Volem un llistat dels noms de tots els proveïdors japonesos. Usa la taula Suppliers.
SELECT CompanyName
FROM Suppliers
WHERE Country = 'Japan';

-- 13. Volem ara un llistat de les persones de contacte dels proveïdors britànics i el seu telèfon. Usa la taula Suppliers.
SELECT ContactName, Phone
FROM Suppliers
WHERE Country = 'UK';

-- 14. Troba el nom de l’empresa d’enviaments que té el telèfon = (503) 555-3199. Usa la taula Shippers.
SELECT CompanyName
FROM Shippers
WHERE Phone = '(503) 555-3199';

-- 15. Mostra el preu i quantitat del ProductID = 69.
SELECT UnitPrice, UnitsInStock
FROM Products
WHERE ProductID = 69;

-- 16. Retorna un llistat de tota la informació de tots els clients ordenats pel país de procedència alfabèticament.
SELECT *
FROM Customers
ORDER BY Country ASC;

-- 17. Fes el recompte de quants productes hi ha de la categoria 2 que tenen un preu > 20.
SELECT COUNT(*) AS ProductCount
FROM Products
WHERE CategoryID = 2 AND UnitPrice > 20;

-- 18. Fes una query que retorni la xifra del producte més car de la taula Products.
SELECT MAX(UnitPrice) AS MostExpensiveProduct
FROM Products;

-- 19. Retorna el preu mig de la taula Products.
SELECT AVG(UnitPrice) AS AveragePrice
FROM Products;

-- 20. Mostra la data de la primera l’ordre creada. Usa la taula Orders.
SELECT MIN(OrderDate) AS FirstOrderDate
FROM Orders;

-- 21. Mostra el preu de la Order 10255 (Price x quantitat de tots els productes).
SELECT SUM(od.UnitPrice * od.Quantity) AS TotalPrice
FROM [Order Details] od
WHERE od.OrderID = 10255;

-- 22. Mostra el numero de productes de cada Order.
SELECT OrderID, COUNT(ProductID) AS ProductCount
FROM [Order Details]
GROUP BY OrderID;

-- 23. Mostra el numero de productes de cada Order sempre que siguin més de 3.
SELECT OrderID, COUNT(ProductID) AS ProductCount
FROM [Order Details]
GROUP BY OrderID
HAVING COUNT(ProductID) > 3;

-- 24. Mostra els suppliers de les Ciutats que comencen per B que tenen productes amb un preu major a 50.
SELECT DISTINCT s.CompanyName
FROM Suppliers s
JOIN Products p ON s.SupplierID = p.SupplierID
WHERE s.City LIKE 'B%' AND p.UnitPrice > 50;

-- 25. Mostra els clients d’un país amb més de 7 lletres.
SELECT CompanyName, Country
FROM Customers
WHERE LENGTH(Country) > 7;

-- 26. Mostra les ordres d’avui.
SELECT *
FROM Orders
WHERE OrderDate = CURRENT_DATE;

-- 27. Mostra les ordres de febrer del 1997 del empleat 2.
SELECT *
FROM Orders
WHERE EmployeeID = 2 AND OrderDate BETWEEN '1997-02-01' AND '1997-02-28';