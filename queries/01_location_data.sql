-- Location Data
-- Pulls every county's coordinates and raw GHG emissions value.
-- Used by the dashboard's geo-bubble map: latitude/longitude plot the point,
-- Emissions sizes the bubble.

SELECT
    latitude,
    longitude,
    `GHG emissions mtons CO2e` AS Emissions
FROM emissions.default.emissions_data;
