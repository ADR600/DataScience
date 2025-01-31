WITH indian_analyst_jobs as
    ( --CTE
SELECT *
     FROM job_postings_fact
     where job_country='India'
         and (job_title like '%Data%Analyst%'
              or job_title like '% Business%Analyst%') )
select company_dim.name,
       indian_analyst_jobs.job_title,
       indian_analyst_jobs.job_via,
       indian_analyst_jobs.job_location,
       indian_analyst_jobs.job_country,
       indian_analyst_jobs.salary_year_avg
from indian_analyst_jobs
inner join company_dim on company_dim.company_id=indian_analyst_jobs.company_id
where indian_analyst_jobs.salary_year_avg is not null
order by 3 DESC
limit 5;

