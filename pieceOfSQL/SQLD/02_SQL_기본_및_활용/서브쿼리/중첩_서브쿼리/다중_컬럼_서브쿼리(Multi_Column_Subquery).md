# 다중 컬럼 서브쿼리(Multi Column Subquery)

#SQLD #SQL #subquery 

여러 컬럼의 데이터를 반환하는 서브쿼리이다.

```SQL
SELECT *
FROM EMPLOYEES
WHERE (JOB_ID, SALARY) IN (SELECT JOB_ID, MAX_SALARY
						   FROM JOBS
						   WHERE MAX_SALARY = 1000
)
```


