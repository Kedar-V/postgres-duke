-- Total number of universities
SELECT COUNT(*) AS total_universities FROM university_rankings;

-- Average overall score
SELECT AVG(scores_overall) AS avg_overall_score FROM university_rankings;

-- Number of universities per country
SELECT location, COUNT(*) AS num_universities FROM university_rankings GROUP BY location ORDER BY num_universities DESC;

-- Top 5 universities by overall score
SELECT name, scores_overall FROM university_rankings ORDER BY scores_overall DESC LIMIT 5;

-- Number of closed universities
SELECT COUNT(*) AS closed_universities FROM university_rankings WHERE closed = 1;