# 💡 ROLLBACK

[INSERT](../DML/INSERT.md) , [DELETE](../DML/DELETE.md) , [UPDATE](../DML/UPDATE.md) 후에 변경된 내용을 취소하는 명령어이다.

ROLLBACK을 하면 변경하기 이전 값으로 복구된다.

## 📌 문법

### 👉 전체 작업 취소

```SQL
[INSERT / UPDATE / DELETE 진행]
ROLLBACK;
```

### 👉 특정 [SAVEPOINT](SAVEPOINT.md) 로 복구

```SQL
[INSERT / UPDATE / DELETE 진행]
SAVEPOINT A;

[INSERT / UPDATE / DELETE 진행]
SAVEPOINT B;

[INSERT / UPDATE / DELETE 진행]
SAVEPOINT C;

ROLLBACK TO B;
```
