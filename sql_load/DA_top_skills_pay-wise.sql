WITH remote_job_skills AS(
    SELECT sj.skill_id, COUNT(*) AS skill_count
    FROM skills_job_dim sj
    INNER JOIN job_postings_fact jp
    ON jp.job_id = sj.job_id
    WHERE jp.job_work_from_home = true
    AND job_title_short = 'Data Analyst'
    GROUP BY skill_id
    )


SELECT sd.skills, sd.skill_id, skill_count
FROM skills_dim sd
INNER JOIN remote_job_skills rjs
ON rjs.skill_id = sd.skill_id

ORDER BY skill_count DESC
LIMIT 5