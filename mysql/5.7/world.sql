-- EXPLAIN
SELECT
  *
  , Info->"$.Population" AS Population
FROM world_x.city
WHERE CountryCode = 'JPN'
ORDER BY District, Population
;
