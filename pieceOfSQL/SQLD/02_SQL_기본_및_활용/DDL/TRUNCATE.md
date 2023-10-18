# TRUNCATE

#SQL #DDL

테이블에 저장되어 있는 데이터를 모두 제거하는 명령어이다.

[DELETE](../DML/DELETE.md) 명령어와 유사하지만, `TRUNCATE` 는 저장 공간이 재사용 되도록 초기화 된다는 차이점이 있고 [ROLLBACK](../TCL/ROLLBACK.md) 이 불가능해 [DDL(Data Definition Language)](DDL(Data%20Definition%20Language).md) 로 분류된다.

## 문법

```SQL
TRUNCATE TABLE 테이블명;
```
