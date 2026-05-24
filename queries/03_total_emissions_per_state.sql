-- Total Emissions Per State
-- Rolls county-level emissions up to state level and returns the top 10
-- emitting states. Powers the state-totals bar chart on the dashboard.

SELECT
    state_abbr,
    SUM(CAST(REPLACE(`GHG emissions mtons CO2e`, ',', '') AS DOUBLE))
        AS total_emissions
FROM emissions.default.emissions_data
GROUP BY state_abbr
ORDER BY total_emissions DESC
LIMIT 10;
