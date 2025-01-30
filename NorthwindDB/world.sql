--1- Mostra totes les regions del planeta i el nombre d'idiomes que es parlen a cada una d'elles ordenat alfabèticament pel nom de la regió. (group by i join)
SELECT c.Region,  COUNT(cl.Language) AS num_lang FROM country c, countrylanguage AS cl
    WHERE c.Code = cl.CountryCode
    GROUP BY c.Region
    ORDER BY c.region ASC;

--2- Mostrar el districte de la ciutat amb més població. (subquery)
SELECT c1.District, c1.Name FROM city as c1
    WHERE c1.Population = (SELECT MAX(c2.population) FROM city AS c2);

--3- Mostrar codi, nom i continent del país de mida més petita. (subquery)
SELECT c1.code, c1.name, c1.continent FROM country AS c1
    WHERE c1.SurfaceArea = (SELECT MIN(c2.SurfaceArea) FROM country AS c2);

--4- Calcula l'idioma més parlat a cada país. Mostra nom de país i idioma ordenat per país i idioma. (group by i join entre countrylanguage i country)
SELECT c.name, cl.language FROM country AS c, countrylanguage AS cl
WHERE c.code = cl.CountryCode
     AND cl.Percentage = (SELECT MAX(c2.Percentage) FROM countrylanguage AS c2
     WHERE c2.CountryCode = cl.CountryCode)
GROUP BY c.Code
ORDER BY c.name, cl.Language;

--5- Mostra el nom del país on hi ha la ciutat amb menys població. (subquery)
SELECT c.name FROM country AS c, city AS ci WHERE
    c.code = ci.CountryCode AND ci.population =
        (SELECT MIN(ci2.population) FROM city AS ci2);

SELECT c.name FROM country AS c, city AS ci WHERE c.code = ci.CountryCode
  AND ci.population <= ALL (SELECT ci2.population FROM city AS ci2);

--6- Mostra el nom (o noms) del país (o països) on es parlen el més idiomes. (group by per tal de contar el nombre d'idiomes diferents que es parlen per país i subquery per trobar el nom del país)
SELECT c.name FROM country AS c, countrylanguage AS co
    WHERE c.code = co.CountryCode
    GROUP BY c.code
    HAVING COUNT(co.language) =
    (SELECT COUNT(co2.language) FROM countrylanguage AS co2
     GROUP BY co2.CountryCode
     ORDER BY COUNT(co2.language) DESC LIMIT 1);

--7- Mostra els idiomes que es parlen en el país amb més superfície de terreny. (subquery)
SELECT co.language FROM countrylanguage AS co, country AS c
WHERE c.Code = co.CountryCode AND c.SurfaceArea =
(SELECT MAX(c2.surfacearea) FROM country AS c2);

SELECT co.language FROM countrylanguage AS co, country AS c
WHERE c.Code = co.CountryCode AND c.SurfaceArea >=
ALL(SELECT c2.surfacearea FROM country AS c2);

--8- Mostra el districte de ciutat on es parlen més idiomes. (subquery)
SELECT ci.district, ci.name FROM country AS c, countrylanguage AS co, city AS ci
    WHERE c.code = co.CountryCode AND ci.CountryCode = c.code
    GROUP BY ci.district
    HAVING COUNT(DISTINCT co.language) =
    (SELECT COUNT(co2.language) FROM countrylanguage AS co2
     GROUP BY co2.CountryCode
     ORDER BY COUNT(co2.language) DESC LIMIT 1);


-- 9- Mostra el nom del país (o països) on es parlen més idiomes oficials. (subquery i join)
SELECT c.name FROM country AS c, countrylanguage AS co
	WHERE c.code = co.CountryCode
    AND co.IsOfficial = 'T'
    GROUP BY c.code
    HAVING COUNT(co.language) =
    (SELECT COUNT(co2.language) FROM countrylanguage AS co2
     WHERE co2.IsOfficial = 'T'
     GROUP BY co2.CountryCode
     ORDER BY COUNT(co2.language) DESC LIMIT 1);

-- 10- Mostra el nom de totes les ciutats del país (o països) que es va independitzar fa més temps. (subquery)
SELECT ci.name FROM city AS ci, country AS c WHERE
	ci.CountryCode = c.Code AND
    c.indepyear = (SELECT MIN(c2.indepyear) FROM country AS c2);


-- 11- El districte amb més ciutats (subquery)
SELECT ci.district FROM city AS ci
    GROUP BY ci.district
    HAVING COUNT(ci.name) =
    (SELECT COUNT(ci2.name) FROM city AS ci2
     GROUP BY ci2.district
     ORDER BY COUNT(ci2.name) DESC LIMIT 1);

-- 12- Els paisos on totes les seves ciutats (de la nostra BBDD) tinguin mes de 200.000 habitants.
SELECT c.name, COUNT(ci.name) FROM country AS c, city as ci WHERE
ci.countrycode = c.code AND ci.name NOT IN (SELECT ci2.name
	FROM city AS ci2 WHERE population <= 200000)
GROUP BY c.name

-- 13- Totes les ciutats del Carib (tot i que e spot fer sense subconsulta, pensa una forma de fer-ho amb subquerys).
SELECT ci.* FROm city AS ci, country AS c
	WHERE ci.countrycode = c.code AND c.region = 'Caribbean';

SELECT ci.* FROm city AS ci
	WHERE ci.countrycode IN (SELECT c.code FROM country AS c
		WHERE c.region = 'Caribbean');

-- 14- La suma de població per continent (group by).
SELECT c.continent, SUM(c.population) FROM country AS c
	GROUP BY c.continent;

-- 15- La ciutat més gran d'Europa.
SELECT ci.* FROM city AS ci, country AS c WHERE
	c.code = ci.countrycode AND c.continent = 'Europe'
	ORDER BY ci.Population DESC
	LIMIT 1;

SELECT ci.* FROM city AS ci, country AS c WHERE
	c.code = ci.countrycode AND c.continent = 'Europe'
	AND ci.Population = (SELECT MAX(ci2.population) FROM city AS ci2,
	country AS c2 WHERE
		c2.code = ci2.countrycode AND c2.continent = 'Europe');

SELECT ci.* FROM city AS ci, country AS c WHERE
	c.code = ci.countrycode AND c.continent = 'Europe'
	AND ci.Population >=ALL (SELECT ci2.population FROM city AS ci2,
	country AS c2 WHERE
		c2.code = ci2.countrycode AND c2.continent = 'Europe');

-- 16- El continent amb més població i el seu número.
SELECT c.continent, SUM(c.population) AS sum_pop FROM country AS c
	GROUP BY c.continent
	ORDER BY SUM(c.population) DESC
	LIMIT 1;

SELECT c.continent, SUM(c.population) AS sum_pop FROM country AS c
	GROUP BY c.continent
	HAVING SUM(c.population) =
	(SELECT SUM(c2.population)
		FROM country AS c2
		GROUP BY c2.continent
		ORDER BY SUM(c2.population) DESC
		LIMIT 1);

-- 17- El continent amb més ciutats  i el seu número.
SELECT c.continent, COUNT(ci.id) AS num_cities FROM country AS c, city ci
	WHERE c.code=ci.countrycode
	GROUP BY c.continent
	ORDER BY COUNT(ci.id) DESC
	LIMIT 1;

SELECT c.continent, COUNT(ci.id) AS num_cities FROM country AS c, city ci
	WHERE c.code=ci.countrycode
	GROUP BY c.continent
	HAVING COUNT(ci.id) = (SELECT COUNT(ci2.id) AS num_cities
	FROM country AS c2, city ci2
		WHERE c2.code=ci2.countrycode
		GROUP BY c2.continent
		ORDER BY COUNT(ci2.id) DESC
		LIMIT 1);

-- 18- La regió amb un AVG d'habitants per país més gran.
SELECT c.region, AVG(c.population) FROM country AS c
	GROUP BY c.region
	ORDER BY AVG(c.population) DESC
	LIMIT 1;

SELECT c.region, AVG(c.population) FROM country AS c
	GROUP BY c.region
	HAVING AVG(c.population) = (SELECT AVG(c.population) FROM country AS c
		GROUP BY c.region
		ORDER BY AVG(c.population) DESC
		LIMIT 1);