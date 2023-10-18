# 다중 행 서브쿼리(Multi Row Subquery)

#SQLD #SQL #subquery 

여러 건의 데이터를 반환하는 서브쿼리이다.

- 다중 행 비교 연산자와 함께 사용한다.
	- IN, ALL, ANY, SOME, EXISTS

```SQL
SELECT *
FROM PRODUCT
WHERE PRODUCT_CODE IN (SELECT PRODUCT_CODE 
					   FROM PRODUCT_REVIEW);
```
