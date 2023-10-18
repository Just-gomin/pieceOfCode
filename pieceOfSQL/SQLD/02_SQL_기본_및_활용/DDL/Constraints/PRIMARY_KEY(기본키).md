# PRIMARY KEY(기본키)

#SQL #SQLD #constraints

테이블에 저장된 각각의 [로우(Row)](../../테이블/로우(Row).md) 에 대한 고유성을 보장하는 [컬럼(Column)](../../테이블/컬럼(Column).md) 이다. 

- 한 테이블에 하나씩만 정의할 수 있다.
- `PK` 로 지정된 컬럼에는 `NULL` 값이 입력될 수 없다.
- `PK` 로 지정된 컬럼은 자동으로 `UNIQUE` 인덱스로 생성된다.
