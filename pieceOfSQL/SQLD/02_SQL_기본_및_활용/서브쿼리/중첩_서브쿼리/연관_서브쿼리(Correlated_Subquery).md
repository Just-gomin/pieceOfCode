# 연관 서브쿼리(Correlated Subquery)

#SQLD #database #subquery 

메인 쿼리의 [컬럼(Column)](../../테이블/컬럼(Column).md)이 포함된 서브쿼리다.

```SQL
SELECT ORDER_NO,
		DRINK_CODE,
		ORDER_CNT
FROM CAFE_ORDER CO1
WHERE ORDER_CNT = (SELECT MAX(ORDER_CNT)
				   FROM CAFE_ORDER CO2
				   WHERE CO2.DRINK_CODE = CO1.DRINK_CODE);
```
