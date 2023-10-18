# MODIFY COLUMN

#SQL #SQLD #DDL 

기존에 있던 [컬럼(Column)](../../테이블/컬럼(Column).md) 을 변경하는 명령어이다.

## 문법

```SQL
ALTER TABLE 테이블명 MODIFY(
	컬럼명1 데이터 유형 [DEFAULT DEFAULT값] [NOT NULL],
	컬럼명2 데이터 유형 [DEFAULT DEFAULT값] [NOT NULL],
	... );
```

## 변경 가능한 항목

### 데이터 유형

- 컬럼에 저장된 모든 데이터의 크기가, 줄이고자 하는 컬럼의 크기보다 작을 경우에만 줄일 수 있다.
- 크기를 늘리는 것은 데이터와 상관 없이 가능하다.
- 컬럼에 저장된 데이터가 없는 경우에만 데이터 유형을 변경할 수 있다.

### DEFAULT 값

- 변경 이후에 저장 되는 데이터부터 DEFAULT 값이 적용된다.

### NOT NULL 제약조건

- 현재 `NULL` 값이 저장되어 있지 않은 컬럼에만 `NOT NULL` 제약조건 추가가 가능하다.
