# 비연관 서브쿼리(Uncorrelated Subquery)

#SQLD #database #subquery 

메인 쿼리의 [컬럼(Column)](../../테이블/컬럼(Column).md)이 포함되지 않은 서브쿼리이다.

```SQL
SELECT PRODUCT_CODE,
	   MEMBER_ID,
	   CONTENT
FROM PRODUCT_REVIEW
WHERE PRODUCT_CODE = (SELECT PRODUCT_CODE,
						FROM PRODUCT
					   WHERE PRODUCT_NAME = 'PRODUCT_NAME1');
```
