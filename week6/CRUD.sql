-- 1. Insert a new row that provides values for only a few columns. These columns must represent at least two different data types.
INSERT INTO university_rankings (name, scores_overall, closed)
VALUES ('Test University', 88.5, False);

-- 2. Find the number of rows where the values in one numeric column fall between its mean and maximum.
WITH stats AS (
  SELECT AVG(scores_overall) AS avg_score, MAX(scores_overall) AS max_score
  FROM university_rankings
)
SELECT COUNT(*)
FROM university_rankings, stats
WHERE scores_overall > stats.avg_score
  AND scores_overall < stats.max_score;

-- 3. Update one of your string columns by replacing any entries where the second letter is ‘a’ with the value Data Engineering.
UPDATE university_rankings
SET name = 'Data Engineering'
WHERE SUBSTR(name, 2, 1) = 'a';

-- 4. Delete the row that you inserted in step 1.
DELETE FROM university_rankings
WHERE name = 'Test University';