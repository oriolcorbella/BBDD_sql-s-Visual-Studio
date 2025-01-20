-- 1. Retorna un recompte de quants distribuidors (shippers) hi ha.
SELECT COUNT(*) FROM shippers;

-- 2. Calcula quants proveïdors (suppliers) hi ha per ciutat.
SELECT COUNT(*), City FROM suppliers GROUP BY City;

-- 3. Calcula quants productes són distribuits pel shipper número 3.
SELECT COUNT(ProductId) AS num_prod FROM orders AS o, orderdetails AS od
  WHERE o.OrderID = od.OrderID AND ShipVia = 3;

-- 4. Crea un informe amb el nom del distribuidor, nom del proveidor,
-- nom de la categoria i el recompte de productes que coincideixen.
SELECT sh.CompanyName, s.CompanyName, c.CategoryName, COUNT(ProductId) 
FROM Categories AS c, Products AS p, 
    suppliers AS s, orderdetails AS od, 
    orders AS o, shippers AS sh
WHERE
    c.CategoryId = p.CategoryId AND
    p.PrdoductID = od.ProductID AND
    od.OrderID = o.OrderID AND
    o.ShipViA = sh.shipperid AND
    s.supplierID = p.supplierID
GROUP BY sh.CompanyName, s.CompanyName, c.CategoryName;

-- 5. Mostra un informe amb el nom dels clients (customers.companyname)
-- que han rebut més de tres paquets provinents del shipper número 3.
SELECT c.companyname FROM customers AS c, Orders AS o
  WHERE c.CustomerId = o.CustomerId AND ShipVia = 3
  GROUP BY c.CustomerID
  HAVING COUNT(o.OrderID) > 3;

-- 6. Mostra un recompte de les ordres que ha rebut cada customer
-- ordenant pel recompte de forma descendent.
SELECT c.companyname, COUNT(o.OrderID) FROM customers AS c, Orders AS o
  WHERE c.CustomerId = o.CustomerId
  GROUP BY c.CustomerID
  ORDER BY COUNT(o.OrderID) DESC; 

-- 7. Mostra un recompte de clients (customers) per codi postal sempre i quant
-- n'hi hagi més d'un al mateix codi postal.
SELECT COUNT(customerID), PostalCode FROM customers
  GROUP BY PostalCode
  HAVING COUNT(customerID) > 1;

-- 8. Compta quants territoris diferents hi ha per cada regió. Mostra RegionDescription i el recompte.
SELECT r.RegionDescription, COUNT(t.territoriID) 
  FROM region AS r, territories AS t
  WHERE r.regionID = t.regionID
  GROUP BY r.regionID;

-- 9. Calcula la porcentaje de comandes (orders) servides per cada shipper. 
SELECT COUNT(o.orderID)/(SELECT COUNT(o.orderID) FROM orders AS o) * 100, o.shipvia 
  FROM orders 
  GROUP BY o.shipvia;

-- 10. Compta quants empleats hi ha per cada territori. Mostra TerritoryDescription i el recompte.
SELECT COUNT(et.employeeID), t.TerritoryDescription
  FROM employeeterritories AS et, territories AS t
  WHERE et.territoryID = t.territoryID
  GROUP BY t.territoryID;

-- 11. Compta quants empleats hi ha per cada regió. Mostra RegionDescription i el recompte.
SELECT COUNT(et.employeeID), r.RegionDescription
  FROM employeeterritories AS et, territories AS t, region As r
  WHERE et.territoryID = t.territoryID AND t.regionID = r.regionID
  GROUP BY r.regionID;

-- 12. Retorna només el nom de la regió (region.description) que té més empleats.
SELECT COUNT(et.employeeID), r.RegionDescription
  FROM employeeterritories AS et, territories AS t, region As r
  WHERE et.territoryID = t.territoryID AND t.regionID = r.regionID
  GROUP BY r.regionID
  ORDER BY COUNT(et.employeeID) DESC
  LIMIT 1;

-- 13. Retorna el recompte de productes per categoria.
SELECT COUNT(ProductId), CategoryId FROM Products GROUP BY CategoryId

-- 14. Calcula quants productes pot servir cada distribuïdor. Mostra el CompanyName i el recompte de productes.
SELECT COUNT(p.ProductId), s.CompanyName 
  FROM Products AS p, suppliers AS s
  WHERE s.supplierId = p.supplierId
  GROUP BY s.supplierID;

-- 15. Calcula quants empleats hi ha per Ciutat contractats a partir de l'any 1993.
SELECT COUNT(employeeID), City FROM employees 
  WHERE YEAR(HireDate) >= 1993
  GROUP BY City