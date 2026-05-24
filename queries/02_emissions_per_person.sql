-- Emissions per Person
-- Normalises emissions by county population to expose per-capita outliers
-- (small rural counties often dominate this list, while large urban counties
-- dominate absolute totals).
--
-- Data quality handling:
--   REPLACE(..., ',', '')  -> strips thousand-separators from a string column
--                            so it can be cast to DOUBLE.
--   NULLIF(population, 0)  -> guards against divide-by-zero for counties
--                            with missing/zero population.

SELECT
    county_state_name,
    population,
    CAST(REPLACE(`GHG emissions mtons CO2e`, ',', '') AS DOUBLE)
        / NULLIF(CAST(population AS DOUBLE), 0) AS emissions_per_person
FROM emissions.default.emissions_data
ORDER BY emissions_per_person DESC;
