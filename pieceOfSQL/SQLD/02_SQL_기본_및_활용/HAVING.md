# 💡 HAVING

[GROUP_BY](GROUP_BY/GROUP_BY.md) 절을 사용할 때 [WHERE](WHERE/WHERE.md) 절 처럼 사용하는 그룹핑 구문의 조건절이다.

- `GROUP BY`  없이, 테이블이 하나의 그룹이 되는 경우 `HAVING`만 단독으로 사용 가능하다.

데이터를 그룹핑한 후 특정 그룹을 골라낼 때 사용한다.

[SELECT](DML/SELECT.md) 문의 실행 순서 상

1. `HAVING` 절은 논리적으로 `GROUP BY`절 이후에 수행되기 때문에 그룹핑 후에 가능한 집계함수로 조건을 부여할 수 있다.
2. `HAVING` 절은 논리적으로 `SELECT`절 이전에 수행되기 때문에 SELECT 절에 명시되지 않은 집계 함수로도 조건을 부여할 수 있다.
