-- Total daily journeys
SELECT 
  SUM(daily_journeys) AS total_journeys
FROM tfl.rods;

-- Journeys by entry zone
SELECT 
  entry_zone,
  SUM(daily_journeys) AS total_journeys
FROM tfl.rods
GROUP BY entry_zone
ORDER BY entry_zone;

-- Journeys by time period
SELECT 
  time_period,
  SUM(daily_journeys) AS total_journeys
FROM tfl.rods
GROUP BY time_period
ORDER BY total_journeys DESC;

-- Journeys by origin purpose
SELECT 
  origin_purpose,
  SUM(daily_journeys) AS total_journeys
FROM tfl.rods
GROUP BY origin_purpose
ORDER BY total_journeys DESC;

-- Journeys by origin and destination purpose
SELECT 
  origin_purpose,
  destination_purpose,
  SUM(daily_journeys) AS total_journeys
FROM tfl.rods
GROUP BY origin_purpose, destination_purpose
ORDER BY total_journeys DESC;

-- Journeys by purpose and time period
SELECT 
  origin_purpose,
  time_period,
  SUM(daily_journeys) AS total_journeys
FROM tfl.rods
GROUP BY origin_purpose, time_period
ORDER BY origin_purpose, total_journeys DESC;

-- Journeys by purpose and zone
SELECT 
  entry_zone,
  origin_purpose,
  SUM(daily_journeys) AS total_journeys
FROM tfl.rods
GROUP BY entry_zone, origin_purpose
ORDER BY entry_zone, total_journeys DESC;

-- Tourism-related journeys
SELECT 
  origin_purpose,
  destination_purpose,
  time_period,
  SUM(daily_journeys) AS total_journeys
FROM tfl.rods
WHERE origin_purpose ILIKE '%Tourist%' 
   OR destination_purpose ILIKE '%Tourist%'
GROUP BY origin_purpose, destination_purpose, time_period
ORDER BY total_journeys DESC;
