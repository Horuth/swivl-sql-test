# 1.a
SELECT f.name as Name, CASE
    WHEN (any_value(p.phone) IS NULL)
    THEN '-'
    ELSE any_value(p.phone)
  end as Phone
FROM firm f
LEFT JOIN phone p ON f.id = p.firm_id
GROUP BY f.name

# 1.b
SELECT f.name as Name
FROM firm f
WHERE NOT EXISTS(
  SELECT p.firm_id
  FROM phone p
  WHERE f.id = p.firm_id
)

# 1.c
select f.name
from firm f
join phone p
on f.id = p.firm_id
group by f.name
having count(p.phone) >= 2

# 1.d
select f.name
from firm f
  left join phone p
    on f.id = p.firm_id
group by f.name
having count(p.phone) < 2

# 1.e
select f.name, count(p.phone) as cnt
from firm f
left join phone p
on f.id = p.firm_id
group by f.name
order by cnt desc
limit 1