# 단일 행 서브쿼리(Single Row Subquery)

#SQLD #SQL #subquery 

1건 이하의 데이터를 반환하는 서브쿼리이다.

- 단일 행 비교 연산자와 함께 사용한다.
	- =, <, >, <=, >=, <>

```SQL
SELECT *
FROM PRODUCT
WHERE PRICE >= (SELECT MAX(PIRCE) / 2
			   FROM PRODUCT);
```
