# 스칼라 서브쿼리(Scalar Subquery)

#SQLD #SQL #subquery 

주로 [SELECT](../DML/SELECT.md) 절에 위치하지만 [컬럼(Column)](../테이블/컬럼(Column).md)이 올 수 있는 대부분 위치에 사용할 수 있다.

컬럼 대신 사용되므로, 반드시 하나의 값만을 반환해야 하며, 그렇지 않은 경우 에러를 발생시킨다.

```SQL
SELECT PR.PRODUCT_CODE,
	   (SELECT P.PRODUCT_NAME,
		FROM PRODUCT P
		WHERE P.PRODUCT_CODE = PR.PRODUCT_CODE) AS PRODUCT_NAME,
		PR.MEMBER_ID,
		PR.CONTENT
FROM PRODUCT_REVIEW PR;
```
