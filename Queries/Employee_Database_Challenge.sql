
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title


INTO unique_titles
FROM retirement_titles as rt
order by emp_no ASC, to_date DESC;
select * from unique_titles;


select count(ut.emp_no), ut.title
into retiring_titles
from unique_titles as ut
group by title
order by count(title) DESC;
select * from retiring_titles;


select distinct on(e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
into mentorship
from employees as e
inner join dept_emp as de
on (e.emp_no = de.emp_no)
inner join titles as t
on (e.emp_no = t.emp_no)
where (e.birth_date between '1962-01-01' and '1965-12-31')
and (de.to_date = '9999-01-01')
order by emp_no;
select * from mentorship;