# DROP

#SQL #DDL

[테이블(Table)](../테이블/테이블(Table).md) 을 삭제할 때 사용하는 명령어이다.

테이블을 참조하고 있는 다른 테이블이 존재하는 경우, [CASCADE](Constraints/CASCADE.md) 옵션을 명시하지 않으면 삭제되지 않는다.

`CASCADE CONSTRAINT` 는 참조 제약조건도 함께 삭제한다는 의미이다.

## 문법

```SQL
DROP TABLE 테이블명 [CASCADE CONSTRAINT];
```
