# 💡 pieceOfDart / piece_of_test

[효율적인 테스트를 위한 Stub 객체 사용법](https://medium.com/daangn/효율적인-테스트를-위한-stub-객체-활용법-5c52a447dfb7) 의 예제 코드를 Dart로 변경해 내용을 공부합니다.

예제 코드들은 [lib](./lib/)과 [test](./test/)에 나누어 작성 됐습니다.

## 📌 Test Double: 실제 객체 대신 테스트 목적으로 사용되는 모든 종류의 가상 객체

### 👉 예제 코드 ([piece_of_test_test.dart](./test/piece_of_test_test.dart))

### 👉 1. Dummy: 객체가 전달은 되지만 실제로 사용 되지는 않는 것

`'FROM 계좌 잔액이 부족하면 Failure 리턴'` 테스트에서</br>

`TransferBankUseCaseImpl`에 전달은 되지만 실제로 사용 되지 않는 `MockTransferHistoryRepository`와 `MockEmailPort`이 Dummy 입니다.

### 👉 2. Fake: 실제로 동작하는 구현을 가지고 있지만 일반적으로 프로덕션에서 적합하지 않은 몇 가지 shourtcut을 사용하는 객체

`'FROM 계좌 잔액이 부족하면 Failure 리턴'` 테스트에서</br>

과정 중에 [`TransferHistory`](./lib/domain/models/transfer_history.dart)이 생성될 수 있고, 해당 데이터를 저장하기 위해 Fake 객체인 [`TransferHistoryTableFake`](./lib/data/transfer_history_table_fake.dart) In-Memory Database를 구현했습니다.

### 👉 3. Stub: 테스트에 필요한 호출에 대해 미리 준비된 답을 제공하는 객체

`'FROM 계좌 잔액이 부족하면 Failure 리턴'` test에서</br>

`bankPortStub`으로 Mock을 생성한 뒤, `getBalance`함수에 매개변수 `fromBankAccount`가 호출되는 경우 10^6이 반환 되도록 설정했습니다.

### 👉 4. Spy: 어떤 기능이 어떻게 호출되었는지에 따라 일부 정보를 기록하는 Stub의 일종

`'송금을 성공하면 이메일을 한 번 발송'` 테스트에서</br>

`emailPortSpy`는 이메일을 전송할 때 마다 `emailCount`를 1씩 증가 시킵니다.

### 👉 5. Mock: 예상된 동작을 가진 객체