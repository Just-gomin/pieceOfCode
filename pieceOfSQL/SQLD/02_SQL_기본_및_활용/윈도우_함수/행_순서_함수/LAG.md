# LAG

#SQL #SQLD #window-function 

파티션 별로 특정 수만큼 앞선 데이터를 구하는 함수이다.

LAG 함수의 두번째 인자를 생략한 경우, 기본 값은 1이다.

```SQL
select to_char(rental_date, 'YYYY-MM') as RYM,
	   to_char(rental_date, 'YYYY-MM-DD') as RYMD,
	   count(*),
	   LAG(count(*), 2) over (
	   								partition by to_char(rental_date, 'YYYY-MM')
	   								order by to_char(rental_date, 'YYYY-MM-DD')
	   							  ) as firstvalue
from rental r
group by RYMD, RYM;
```

![LAG, 2](material/LAG.png)
