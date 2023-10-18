# 💡 COMMIT

[INSERT](../DML/INSERT.md) , [DELETE](../DML/DELETE.md) , [UPDATE](../DML/UPDATE.md) 후에 변경된 내용을 확정, 반영하는 명령어이다.

COMMIT을 실행하지 않으면 메모리까지만 반영이 되는데 메모리는 휘발성이기 때문에 언제든 사라질 수 있고 다른 사용자는 변경된 값을 조회할 수 없다.

## 📌 문법

```SQL
[INSERT / UPDATE / DELETE 진행]
COMMIT;
```
