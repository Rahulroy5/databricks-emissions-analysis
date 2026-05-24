-- County Shaming
-- Top 10 counties by absolute emissions, paired with population so the
-- dashboard can show "biggest emitters" alongside how dense they are.
-- These are dominated by large urban counties (Maricopa AZ, Harris TX,
-- Cook IL, etc.) -- the opposite end of the spectrum from the per-capita view.

SELECT
    county_state_name,
    population,
    SUM(CAST(REPLACE(`GHG emissions mtons CO2e`, ',', '') AS DOUBLE))
        AS total_emissions
FROM emissions.default.emissions_data
GROUP BY county_state_name, population
ORDER BY total_emissions DESC
LIMIT 10;
