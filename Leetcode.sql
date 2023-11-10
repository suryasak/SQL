-- Combine two Tables
select p.firstName, p.lastName, a.city, a.state
from Person p
Left join Address a
On p.personID = a.personID;

-- Second Highest Salary
select max(salary) as SecondHighestSalary
from Employee
where salary < (select max(salary) from Employee)

-- Nth highest Salary 
create function getNthHighestSalary(N INT) Returns INT
BEGIN 
  DECLARE M INT;
  SET N = M-1;
  Return(
    select distinct salary
    from Employee
    order by salary desc
    limit 1 OFFSET M
    );
END;

-- Rank Scores
select score,
dense_rank() over (order by score desc)
from Scores
order by score desc;

-- Consective numbers
select a.num as ConectiveNum
from logs a
join logs b on a.id = b.id-1 
join logs c on a.id = c.id-2
where a.num = b.num AND a.num = c.num;

-- Employee earning more than Manager
select e.name as Employee
from Employee e 
join Employee m on e.managerId = m.id
where e.salary > m.salary;

-- Duplicate emails
select email AS Email
from Person
group by email
having count(email) > 1;

-- Customers who never order
select c.name AS Customers
from Customers c
left join Orders o
on c.id = o.customerid
where o.customerid is null ;
