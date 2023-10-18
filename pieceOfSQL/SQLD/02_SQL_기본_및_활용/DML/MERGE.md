# MERGE

#SQLD #SQL #DML 

테이블에 새로운 데이터를 입력하거나 이미 저장되어 있는 데이터에 대한 변경 작업을 한 번에 할 수 있도록 하는 명령어이다.

## 문법

```SQL
MERGE
INTO [타겟 테이블명]
USING [비교 테이블 명]
ON 조건
WHEN MATCHED THEN
UPDATE
SET 컬럼명1=데이터1[, 컬럼명2=데이터2, ...]
WHEN NOT MATCHED THEN
INSERT [(컬럼명1, 컬럼명2, ...)]
VALUES (데이터1, 데이터2, ...);
```

조건에 맞는다면 update를 진행하고, 조건에 맞지 않는 다면 insert를 진행한다.

## PostgreSQL에서의 Merge

- <https://www.postgresql.org/docs/current/sql-merge.html>
