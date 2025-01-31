WITH skill_salary AS
    (--CTE
 SELECT skills_job_relation.skill_id as Skill,
        ceil(avg(job_posting.salary_year_avg)) as Salary
     FROM job_postings_fact as job_posting
     INNER JOIN skills_job_dim as skills_job_relation ON job_posting.job_id = skills_job_relation.job_id
     where job_posting.salary_year_avg is not null
     group by Skill)
select skills_dim.skills,
       skill_salary.Salary
from skill_salary
inner join skills_dim on skills_dim.skill_id=skill_salary.Skill
order by 2 desc
limit 5;


select *
from skills_dim
limit 5;