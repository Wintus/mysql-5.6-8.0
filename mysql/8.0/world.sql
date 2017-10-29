-- EXPLAIN
SELECT
  *
  , Info->"$.Population" AS Population
  , rank()
    OVER (
      PARTITION BY District
      ORDER BY Info->"$.Population" )
                           AS RankOfPopulationInDistrict
FROM world_x.city
WHERE CountryCode = 'JPN'
ORDER BY District, Population
;

-- EXPLAIN
WITH CityWithPopulation AS (
    SELECT
      *
      , Info->"$.Population" AS Population
    FROM world_x.city )
SELECT
  *
  , rank()
    OVER (
      PARTITION BY District
      ORDER BY Info->"$.Population"
      ) AS RankOfPopulationInDistrict
FROM CityWithPopulation
WHERE CountryCode = 'JPN'
ORDER BY District, Population
;
