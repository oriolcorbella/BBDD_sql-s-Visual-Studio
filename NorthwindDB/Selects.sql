
1. Fes una query en SQL que mostri totes les columnes de tots els productes per
pantalla. És a dir retorna totes les columnes i totes les files de la taula Products.

  SELECT * FROM Products;

2. Mostra només la columna descripció de la taula Categories.

  SELECT Description FROM Categories; 

3. Retorna la informació de tots els clients per pantalla usant la taula Customers.  

  SELECT * FROM Customers; 

4. Mostra ara les columnes CategoryName i Description de la taula Categories.

  SELECT CategoryName, Description FROM Categories;

5. Mostra ara només la columna descripció de la taula Categories i només per la 
fila on CategoryName = “Grains/Cereals”.

  SELECT Description FROM Categories WHERE CategoryName = 'Grains/Cereals';

6. Desenvolupa una consulta que retorni tota la informació relativa a tots els
productes de la taula Products que tenen categoria = 1.

  SELECT * FROM Products WHERE CategoryID = 1;

7. Retorna el ProductID del producte que té “Filo Mix” per nom

  SELECT ProductID FROM Products WHERE ProductName = 'Filo Mix';

8. Mostra tota la info de tots els productes del SupplierID número 3. Usa la taula
Products.

  SELECT * FROM Products WHERE SupplierID = 3;

9. Retorna tots els productes de la categoria 2 que tenen un preu > 20.

  SELECT * FROM Products WHERE CategoryID = 2 AND UnitPrice > 20;

10. Fes una query que retorni les dades de tots els clients alemanys.

  SELECT * FROM Customers WHERE Country LIKE'Germany';
  
11. Retorna el nom i la data de naixement de lempleat Steven Buchanan usant la
taula Employees.

  SELECT FirstName, LastName, BirthDate FROM Employees WHERE FirstName = 'Steven' AND LastName = 'Buchanan';

12. Volem un llistat dels noms de tots els proveïdors japonesos. Usa la taula
Suppliers 

  SELECT CompanyName FROM Suppliers WHERE Country = 'Japan';

13. Volem ara un llistat de les persones de contacte dels proveïdors britànics i el seu
telèfon. Usa la taula Suppliers.
  
  SELECT ContactName, Phone FROM Suppliers WHERE Country = 'UK';

14. Troba el nom de lempresa denviaments que té el telèfon = 503 555-3199. Usa
la taula Shippers.
  
  SELECT CompanyName FROM ShippersWHERE Phone = '(503) 555-3199'; 

15. Mostra el preu i el pes del ProductID = 69. 

  SELECT UnitPrice, QuantityPerUnit FROM Products WHERE ProductID = 69;

16.Retorna un llistat de tota la informació de tots els clients ordenats pel país de
procedència alfabèticament.

  SELECT *  FROM Customers ORDER BY Country ASC;

17. Fes el recompte de quants productes hi ha de la categoria 2 que tenen un preu > 20.

  SELECT COUNT(*) FROM Products WHERE CategoryID = 2 AND UnitPrice > 20;

18. Fes una query que retorni la xifra del producte més car de la taula Products. 
  
  SELECT MAX(UnitPrice) AS MostExpensiveProduct FROM Products;

19. Retorna el preu mig de la taula Products

  SELECT AVG(UnitPrice) AS UnitPrice FROM Products;

20. Mostra la data de la primera lordre creada. Usa la taula Orders.

  SELECT MIN(orderDate) AS orderDate FROM Orders;

21. Mostra el preu de la Order 10255 Price x quantitat de tots els productes.

  SELECT SUM (UnitPrice*Quantity) FROM orderdetails WHERE OrderID = "10255";

22. Mostra el numero de productes de cada Order.

SELECT OrderID, COUNT(ProductID) AS Numero_Productos FROM OrderDetails GROUP BY OrderID;

23. Mostra el numero de productes de cada Order sempre que siguin mes de 3.

  SELECT OrderID, COUNT(ProductID) AS Numero_Productos FROM OrderDetails GROUP BY OrderID;

24. Mostra els suppliers de les Ciutats que comencen per B que tenen productes
amb un preu major a 50.

  SELECT s.* FROM suppliers s, products p WHERE s.SupplierID = p.ProductID AND s.City LIKE 'B%' AND UnitPrice > 50;

25. Mostra els clients dun país amb més de 7 lletres

  SELECT * FROM Customers WHERE LENGTH(Country) = 7;

26. Mostra les ordres davui.

  SELECT DISTINCT CustomerName FROM Customers WHERE LENGTH(Country) > 7;

27. Mostra les ordres de febrer del 1997 del empleat 2.

  SELECT * FROM Orders WHERE OrderDate = CURDATE();

28. Mostra la mitja de ordres per any.

  SELECT * FROM Orders WHERE EmployeeID = 2 AND OrderDate BETWEEN '1997-02-01' AND '1997-02-28';

29. Mostra el seu preu del producte més barat i el més car 2 Selects separats.

  SELECT YEAR(OrderDate) AS Any, COUNT(OrderID) / COUNT(DISTINCT YEAR(OrderDate)) AS Mitjana_Ordres FROM Orders GROUP BY YEAR(OrderDate);

30. Les IDs de les Ordres de 4 productes diferents o més indicant també el nom del
client.

  SELECT MIN(Price) AS Producte_Mes_Barat FROM Products; // SELECT MAX(Price) AS Producte_Mes_Car FROM Products;

31. Mostra lordre amb més quantitat de productes.

  SELECT Orders.OrderID, Customers.CustomerName
  FROM Orders
  JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
  JOIN Customers ON Orders.CustomerID = Customers.CustomerID
  GROUP BY Orders.OrderID, Customers.CustomerName
  HAVING COUNT(DISTINCT OrderDetails.ProductID) >= 4;

32. Mostra lempleat més gran i el més petit 2 Selects separats

  SELECT OrderID, SUM(Quantity) AS Quantitat_Total FROM OrderDetails GROUP BY OrderID ORDER BY Quantitat_Total DESC LIMIT 1;


33. Retorna ladreça, ciutat, codi postal i país de tots els clients tot junts amb un
camp.
  
  SELECT EmployeeID, FirstName, LastName, BirthDateFROM Employees ORDER BY BirthDate ASC LIMIT 1;
  SELECT EmployeeID, FirstName, LastName, BirthDate FROM Employees ORDER BY BirthDate DESC LIMIT 1;


