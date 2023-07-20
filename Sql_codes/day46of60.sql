-- Create an enumerated data type, compass_position
CREATE TYPE compass_position AS ENUM (
  	-- Use the four cardinal directions
  	'North', 
  	'South',
  	'East', 
  	'West'
);
-- Confirm the new data type is in the pg_type system table
SELECT typname
FROM pg_type
WHERE typname='compass_position';


---- Extensions
-- Enable the pg_trgm extension
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- Select all rows extensions
SELECT *
FROM pg_extension;


-- Select the title and description columns
SELECT 
  title, 
  description, 
  -- Calculate the similarity
  similarity(title, description)
FROM 
  film

  -- Select the title and description columns
SELECT  
  title, 
description, 
  -- Calculate the levenshtein distance
  levenshtein(title,'JET NEIGHBOR') AS distance
FROM 
  film
ORDER BY 3
