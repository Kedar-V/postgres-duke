-- 1. Insert a new row that provides values for only a few columns. These columns must represent at least two different data types.
INSERT INTO university_rankings (Institution_Name, Overall_Score, STATUS)
VALUES ('Test University', 88.5, 'A');

-- 2. Find the number of rows where the values in one numeric column fall between its mean and maximum.
WITH stats AS (
  SELECT AVG(Overall_Score) AS avg_score, MAX(Overall_Score) AS max_score
  FROM university_rankings
)
SELECT COUNT(*)
FROM university_rankings, stats
WHERE Overall_Score > stats.avg_score
  AND Overall_Score < stats.max_score;

-- 3. Update one of your string columns by replacing any entries where the second letter is ‘a’ with the value Data Engineering.
UPDATE university_rankings
SET Institution_Name = 'Data Engineering'
WHERE SUBSTR(Institution_Name, 2, 1) = 'a';

-- 4. Delete the row that you inserted in step 1.
DELETE FROM university_rankings
WHERE Institution_Name = 'Test University';


