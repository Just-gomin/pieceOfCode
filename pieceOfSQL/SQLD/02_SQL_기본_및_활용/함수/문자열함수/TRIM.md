# TRIM

#SQLD #SQL #function

- 입력: \[위치], \[특정 문자 FROM] , 문자열
  - 위치
    - LEADING: 문자열의 왼쪽
    - TRAILING: 문자열의 오른쪽
    - BOTH: 양쪽

- 출력
  - 옵션이 하나도 없는 경우: 문자열의 왼쪽과 오른쪽 공백을 제거한 문자열
  - 위치 옵션이 부여된 경우
    - 위치에 따라 공백을 제거한 문자열
  - 특정 문자 옵션이 부여된 경우
    - 위치 옵션이 있다면 해당 방향에서 특정 문자를 제거한 문자열
    - 위치 옵션이 없다면 양끝에서 특정 문자를 제거한 문자열을 반환한다.

```SQL
-- _로 공백을 대신함
SELECT TRIM(LEADING '    abccdef   '), -- abccdef_____   
TRIM(TRAILING '    abccdef   '), -- ____abccdef
TRIM(LEADING 'a' FROM 'abccdef'), -- bccdef
TRIM(LEADING 'a' FROM '    abccdef'), -- ____abccdef
TRIM(LEADING 'c' FROM 'abccdef'), -- abccdef
TRIM(TRAILING 'f' FROM 'abccdef'), -- abccde
TRIM(BOTH 't' FROM 'tabccdeft'), -- abccdef
TRIM('t' FROM 'tabccdeft'); -- abccdef
```
