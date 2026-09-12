-- Q1) Overlapping employee projects
-- Interval logic overlap
  
  SELECT 
    p1.emp_id, 
    p1.project_id AS proj1, 
    p2.project_id AS proj2
FROM Projects p1
JOIN Projects p2 ON p1.emp_id = p2.emp_id 
    AND p1.project_id < p2.project_id
    AND p1.start_date <= p2.end_date 
    AND p2.start_date <= p1.end_date;
