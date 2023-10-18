# GROUPING SETS

#SQL #SQLD #group-function 

특정 항목에 대한 소계를 계산하는 함수이다.

인자 값으로 ROLLUP이나 CUBE를 사용할 수도 있다.

## GROUPING SETS (COLUMN1, COLUMN2)

- COLUMN1로 그룹핑
- COLUMN2로 그룹핑

```SQL
select to_char(rental_date, 'YYYY-MM-DD') as RD, staff_id, count(*)
from rental
group by grouping sets (RD, staff_id)
order by RD, staff_id ;
```

## GROUPING SETS (COLUMN1, COLUMN2, ( ))

- COLUMN1로 그룹핑
- COLUMN2로 그룹핑
- 총합계

```SQL
select to_char(rental_date, 'YYYY-MM-DD') as RD, staff_id, count(*)
from rental
group by grouping sets (RD, staff_id, ())
order by RD, staff_id ;
```

## GROUPING SETS (COLUMN1, ROLLUP(COLUMN2))

- COLUMN1로 그룹핑
- COLUMN2로 그룹핑
- 총합계

```SQL
select to_char(rental_date, 'YYYY-MM-DD') as RD, staff_id, count(*)
from rental
group by grouping sets (RD, rollup (staff_id))
order by RD, staff_id ;
```

## GROUPING SETS (COLUMN1, ROLLUP(COLUMN2, COLUMN3))

- COLUMN1로 그룹핑
- COLUMN2, COLUMN3로 그룹핑
- COLUMN2로 그룹핑
- 총합계

```SQL
select to_char(rental_date, 'YYYY-MM-DD') as RD, staff_id, customer_id, count(*)
from rental
group by grouping sets (RD, rollup (staff_id, customer_id))
order by RD, staff_id, customer_id ;
```

## GROUPING SETS (COLUMN1, COLUMN2, ROLLUP(COLUMN3))

- COLUMN1로 그룹핑
- COLUMN2로 그룹핑
- COLUMN3로 그룹핑
- 총합계

```SQL
select to_char(rental_date, 'YYYY-MM-DD') as RD, staff_id, customer_id, count(*)
from rental
group by grouping sets (RD, staff_id, rollup (customer_id))
order by RD, staff_id, customer_id ;
```
