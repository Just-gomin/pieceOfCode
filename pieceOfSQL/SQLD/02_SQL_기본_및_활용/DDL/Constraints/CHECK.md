# NOT NULL

#SQL #SQLD #constraints

해당 [컬럼(Column)](../../테이블/컬럼(Column).md) 에 저장될 수 있는 값의 범위를 제한한다.

```SQL
CONSTRAINT CHK_DEL_YN CHECK(DEL_YN IN ('Y', 'N'));
```
- `DEL_YN` 컬럼에 'Y', 'N' 만 입력될 수 있도록 `CHK_DEL_YN` 이란 이름의 제약조건을 정의했다.
