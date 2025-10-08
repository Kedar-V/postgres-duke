
-- Total number of universities
SELECT COUNT(*) AS total_universities FROM university_rankings;

-- Average overall score
SELECT AVG(Overall_Score) AS avg_overall_score FROM university_rankings;

-- Number of universities per country
SELECT Location, COUNT(*) AS num_universities FROM university_rankings GROUP BY Location ORDER BY num_universities DESC;

-- Top 5 universities by overall score
SELECT Institution_Name, Overall_Score FROM university_rankings ORDER BY Overall_Score DESC LIMIT 5;

-- Number of universities by status
SELECT STATUS, COUNT(*) AS num_universities FROM university_rankings GROUP BY STATUS;