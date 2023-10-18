# DELETE

#SQL #DML

이미 저장된 데이터를 삭제하고 싶을 때 사용하는 명령어이다.

## 문법

```SQL
DELETE FROM [테이블명] [WHERE 삭제할 데이터의 조건];
```

`DELETE` 시 `WHERE` 절이 없으면, 테이블의 모든 행이 삭제되니 주의해야 한다.

만약 `WHERE` 절 없이 테이블 전체를 삭제하고자 하는 경우 [TRUNCATE](../DDL/TRUNCATE.md) 를 시스템 부하 측면에서 유리하다.

대신 [TRUNCATE](../DDL/TRUNCATE.md) 는 별도의 로그를 쌓지 않아 ROLLBACK이 불가능하다.

DELETE 는 COMMIT 전에 ROLLBACK이 가능하다.
