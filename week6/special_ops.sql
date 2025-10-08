
-- 1. Insert Duke Tech for 2014
INSERT INTO university_rankings (rank_order, rank, name, scores_overall, location, closed)
VALUES (350, 350, 'Duke Tech', 60.5, 'USA', 0);

-- 2. Count Japanese universities in top 200 for 2013
SELECT COUNT(*) AS japan_top_200_2013
FROM university_rankings
WHERE location = 'Japan' AND rank <= 200;

-- 3. Update University of Oxford’s score for 2014 (+1.2 points)
UPDATE university_rankings
SET scores_overall = scores_overall + 1.2
WHERE name = 'University of Oxford';

-- 4. Delete universities with score < 45 in 2015
DELETE FROM university_rankings
WHERE scores_overall < 45;
