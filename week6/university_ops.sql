
-- 1. Insert Duke Tech for 2025
INSERT INTO university_rankings (RANK_2025, Institution_Name, Overall_Score, Location, STATUS)
VALUES (350, 'Duke Tech', 60.5, 'United States', 'A');

-- 2. Count Japanese universities in top 200 for 2025
SELECT COUNT(*) AS japan_top_200_2025
FROM university_rankings
WHERE Location = 'Japan' AND RANK_2025 <= 200;

-- 3. Update University of Oxford’s score for 2025 (+1.2 points)
UPDATE university_rankings
SET Overall_Score = Overall_Score + 1.2
WHERE Institution_Name = 'University of Oxford';

-- 4. Delete universities with score < 45 in 2025
DELETE FROM university_rankings
WHERE Overall_Score < 45;
