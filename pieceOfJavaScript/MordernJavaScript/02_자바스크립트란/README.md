# 02. 자바스크립트란?

## 2.1 자바스크립트의 탄생 & 2.2 자바스크립트의 표준화

- 1995, [넷스케이프 커뮤니케이션즈(Netscape communications)](https://ko.wikipedia.org/wiki/%EB%84%B7%EC%8A%A4%EC%BC%80%EC%9D%B4%ED%94%84)의 [브렌던 아이크(Brenden Eich)](https://ko.wikipedia.org/wiki/%EB%B8%8C%EB%A0%8C%EB%8D%98_%EC%95%84%EC%9D%B4%ED%81%AC)에 의해 자바스크립트가 탄생했다.

  - 웹페이지의 보조적인 기능을 수행하기 위해 브라우저에서 동작하는 경량 프로그래밍 언어를 도입하기 위해 개발했다.

- 1993.06, [넷스케이프 내비게이터(넷스케이프 커뮤니케이션즈의 웹 브라우저)](https://ko.wikipedia.org/wiki/%EB%84%B7%EC%8A%A4%EC%BC%80%EC%9D%B4%ED%94%84_%EB%82%B4%EB%B9%84%EA%B2%8C%EC%9D%B4%ED%84%B0)에 ["모카(Mocha)"](<https://en.wikipedia.org/wiki/Mocha_(JavaScript_framework)>) 라는 이름으로 탑재

- 1993.09, "라이브스크립트(LiveScript)"로 변경

- 1993.12, "자바스크립트(JavaScript)"로 최종 명명.

- 1996, [마이크로소프트(Microsoft)](https://ko.wikipedia.org/wiki/%EB%A7%88%EC%9D%B4%ED%81%AC%EB%A1%9C%EC%86%8C%ED%94%84%ED%8A%B8)에서 만든 자바스크립트의 파생 버전인 ["JScript"](https://ko.wikipedia.org/wiki/J%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8) 탄생 및 [인터넷 익스플로러](https://ko.wikipedia.org/wiki/%EC%9D%B8%ED%84%B0%EB%84%B7_%EC%9D%B5%EC%8A%A4%ED%94%8C%EB%A1%9C%EB%9F%AC) 3.0에 탑재

  - 이 당시 자바스크립트와 J스크립트는 표준화 되지 못하고 적당히 호환되었다.
  - 넷스케이프 커뮤니케이션즈와 마이크로소프트는 서로의 브라우저의 점유율을 높이기 위해 자사 브라우저에서만 동작하는 기능을 경쟁적으로 추가하기 시작했다.
  - 브라우저에 따라 웹페이지가 정상적으로 동작하지 않는 [**크로스 브라우징**](https://en.wikipedia.org/wiki/Cross-browser_compatibility) 이슈가 발생하기 시작했다.
  - 자바스크립트의 파편화를 방지하고 모든 브라우저에서 정상 동작하는 표준화된 자바스크립트의 필요성 대두.

  </br>

- 1996.11, [ECMA 인터내셔널(컴퓨터 시스템의 표준을 관리하는 비영리 표준화 기구)](https://ko.wikipedia.org/wiki/Ecma_%EC%9D%B8%ED%84%B0%EB%82%B4%EC%85%94%EB%84%90)에 넷스케이프 커뮤니케이션즈는 자바스크립트의 표준화를 요청.

- 1996.07, [ECMA-262](https://www.ecma-international.org/publications-and-standards/standards/ecma-262/)라 불리는 표준화된 자바스크립트 초판(ECMAScript 1) 사양(specification)이 완성되었고, 상표권 문제로 [ECMAScript](https://ko.wikipedia.org/wiki/ECMA%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8)로 명명 되었다.

- 1998, ECMAScript 2(ES2) 공개. ISO/IEC 1626 국제 표준과 동일한 규격 적용

- 1999, ECMAScript 3(ES3) 공개. 정규 표현식, try...catch 적용

- 2009, ECMAScript 5(ES5) 공개. HTML5와 함께 등장.

- ECMAScript 4 는 버려짐

- 2015, ECMAScript 6(ECMAScript 2015, ES6) 공개. let & const 키워드, 화살표 함수, 클래스, 모듈 등 범용 프로그래밍 언어로서 갖춰야할 기능들을 대거 도입하는 큰변화가 있었다.

- 2016, ECMAScript 7(ECMAScript 2016, ES7) 공개.

- 2017, ECMAScript 8(ECMAScript 2017, ES8) 공개.

- 2018, ECMAScript 9(ECMAScript 2018, ES9) 공개.

- 2019, ECMAScript 10(ECMAScript 2019, ES10) 공개.

- 2020, ECMAScript 11(ECMAScript 2020, ES11) 공개.

- 2021, ECMAScript 12(ECMAScript 2021, ES12) 공개.

- 2022, ECMAScript 13(ECMAScript 2022, ES13) 공개.

## 2.3 자바스크립트 성장의 역사

### 2.3.1 Ajax

- 1999, [Ajax(Asynchronous JavaScript and XML)](https://ko.wikipedia.org/wiki/Ajax)가 [XMLHttpRequest](https://developer.mozilla.org/ko/docs/Web/API/XMLHttpRequest)라는 이름으로 등장

  > Ajax?
  >
  > - 자바스크립트를 이용해 서버와 브라우저가 비동기(Asynchronous) 방식으로 데이터를 교환할 수 있는 통신 기능
  > - 웹 페이지에서 변경할 필요가 없는 다시 렌더링을 진행하지 않고, 서버로 부터 필요한 데이터만 전송받아 변경해야 하는 부분만 한정적으로 렌더링하는 방식이 가능
  > - 웹 브라우저에서 빠른 성능과 부드러운 화면 전환이 가능해짐

  </br>

- 2005, [구글 맵스(Google Maps)](https://ko.wikipedia.org/wiki/%EA%B5%AC%EA%B8%80_%EC%A7%80%EB%8F%84)의 등장으로 웹 애플리케이션 프로그래밍 언어로서 자바스크립트의 가능성을 확인하는 계기 마련

### 2.3.2 jQuery

- 2006, [jQuery](https://ko.wikipedia.org/wiki/JQuery)의 등장. [DOM(Document Object Model)](https://developer.mozilla.org/ko/docs/Web/API/Document_Object_Model/Introduction)을 더욱 쉽게 제어할 수 있게 되었고 크로스 브라우징 이슈도 어느 정도 해결되었다.

### 2.3.3 V8 자바스크립트 엔진

- 2008, 구글의 [V8 자바스크립트 엔진](<https://ko.wikipedia.org/wiki/V8_(%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8_%EC%97%94%EC%A7%84)>) 등장.

  - 자바스크립트로 웹 애플리케이션을 구축하려는 시도가 늘면서 더욱 빠르게 동작하는 자바스크립트 엔진의 필요성이 대두되며 등장했다.
  - 자바스크립트가 데스트톱 에플리케이션과 같은 유사한 사용자 경험(UX: User Experience)을 제공할 수 있는 웹 에플리케이션 프로그래밍 언어로 정착할 수 있는 계기가 되었다.
  - 웹 서버에서 수행되던 로직들이 대거 클라이언트(브라우저)로 이동하게 만들었고, 이는 웹 에플리케이션 개발에서 프론트엔드 영역이 주목받는 계기로 작용했다.

### 2.3.4 Node.js

- 2009, [라이언 달(Ryan Dahl)](https://ko.wikipedia.org/wiki/%EB%9D%BC%EC%9D%B4%EC%96%B8_%EB%8B%AC)의 [Node.js](https://nodejs.org/ko) 발표.

  - 구글 V8 자바스크립트 엔진으로 빌드된 자바스크립트 런타임 환경(runtime environment)이다.
  - 브라우저의 자바스크립트 엔진에서만 동작하던 자바스크립트를 브라우저 이외의 환경에서도 동작할 수 있도록 자바스크립트 엔진을 브라우저에서 독립시킨 자바스크립트 실행 환경이다.
  - 서버 사이드 애플리케이션 개발에 주로 사용되며, 이에 필요한 모듈, 파일 시스템, HTTP 등 빌트인(built-in, 내장) API를 제공한다.
  - [비동기 I/O](https://ko.wikipedia.org/wiki/%EB%B9%84%EB%8F%99%EA%B8%B0_%EC%9E%85%EC%B6%9C%EB%A0%A5)를 지원하며, 단일 스레드(Single Thread) 이벤트 루프 기반으로 동작함으로써 요청 처리 성능이 좋다. [[참고](https://nodejs.org/ko/docs/guides/event-loop-timers-and-nexttick#%EC%9D%B4%EB%B2%A4%ED%8A%B8-%EB%A3%A8%ED%94%84%EB%9E%80)]

    => 실시간 데이터 처리를 위해 I/O가 빈번하게 발생하는 SPA(Single Page Application)에 적합하다. CPU 사용율이 높은 애플리케이션에는 권장하지 않는다.

  - 자바스크립트를 브라우저에서 벗어나 서버 사이드 애플리케이션 개발에서도 사용할 수 있는 범용 프로그래밍 언어로 만들어주었다.
  - 크로스 플랫폼을 위한 중요한 언어로 자리매김하게 했다.
    - 모바일 하이브리드 앱: [Apache Cordova(아파치 코도바, 구: PhoneGap)](https://ko.wikipedia.org/wiki/%EC%95%84%ED%8C%8C%EC%B9%98_%EC%BD%94%EB%8F%84%EB%B0%94), [Ionic](<https://ko.wikipedia.org/wiki/%EC%95%84%EC%9D%B4%EC%98%A4%EB%8B%89_(%EB%AA%A8%EB%B0%94%EC%9D%BC_%EC%95%B1_%ED%94%84%EB%A0%88%EC%9E%84%EC%9B%8C%ED%81%AC)>), [React Native](https://ko.wikipedia.org/wiki/%EB%A6%AC%EC%95%A1%ED%8A%B8_%EB%84%A4%EC%9D%B4%ED%8B%B0%EB%B8%8C)
    - 서버 사이드: [Node.js](https://nodejs.org/ko)
    - 데스크톱: [Electron](<https://ko.wikipedia.org/wiki/%EC%9D%BC%EB%A0%89%ED%8A%B8%EB%A1%A0_(%EC%86%8C%ED%94%84%ED%8A%B8%EC%9B%A8%EC%96%B4_%ED%94%84%EB%A0%88%EC%9E%84%EC%9B%8C%ED%81%AC)>)
    - 머신러닝: [TensorFlow.js](https://www.tensorflow.org/js?hl=ko)
    - 로보틱스: [Johnny-Five](https://johnny-five.io/)

### 2.3.5 SPA 프레임워크

- 모던 웹 애플리케이션은 데스크톱 애플리케이션과 비교해도 손색없는 성능과 사용자 경험을 제공하는 것이 필수가 되었고, 개발 규모와 복잡도가 상승했다.

  => 많은 패턴과 라이브러리가 출현했다.</br>
  => 하지만 변경에 유용하며 확장하기 쉬운 애플리케이션 아키텍처의 구축을 어렵게 하였다.</br>
  => 프레임워크의 등장</br>
  => **CBD(Component Based Development)** 방법론을 기반으로 하는 **SPA(Single Page Application)**가 대중화 되었다.

  - [Angular](<https://ko.wikipedia.org/wiki/%EC%95%B5%EA%B7%A4%EB%9F%AC_(%EC%95%A0%ED%94%8C%EB%A6%AC%EC%BC%80%EC%9D%B4%EC%85%98_%ED%94%8C%EB%9E%AB%ED%8F%BC)>)
  - [React](<https://ko.wikipedia.org/wiki/%EB%A6%AC%EC%95%A1%ED%8A%B8_(%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8_%EB%9D%BC%EC%9D%B4%EB%B8%8C%EB%9F%AC%EB%A6%AC)>)
  - [Vue.js](https://ko.wikipedia.org/wiki/Vue.js)
  - [Svelte](https://en.wikipedia.org/wiki/Svelte)

## 2.4 자바스크립트와 ECMAScript

- ECMAScript: 자바스크립트의 표준 사양인 ECMA-262를 말하며, 프로그래밍 언어의 값, 타입, 객체와 프로퍼티, 함수, 표준 빌트인 객체(Standard Built-in Object) 등 핵심 문법을 규정한다.

  - 각 브라우저 제조사는 ECMAScript 사양을 준수해서 브라우저에 내장된는 자바스크립트 엔진을 구현한다.</br></br>

- JavaScript: 기본 뼈대를 이루는 ECMAScript와 브라우저가 별도 지원하는 클라이언트 사이드 Web API(DOM, BOM, Canvas, XMLHttpRequestm, fetch, requestAnimationFrame, SVG, Web Storage, Web Component, Web Worker 등)를 아우르는 개념이다.

  - 클라이언트 사이드 Web API는 ECMAScript와는 별도로 [월드 와이드 웹 콘소시엄(World Wide Web Consortium; W3C)](https://ko.wikipedia.org/wiki/%EC%9B%94%EB%93%9C_%EC%99%80%EC%9D%B4%EB%93%9C_%EC%9B%B9_%EC%BB%A8%EC%86%8C%EC%8B%9C%EC%97%84)에서 별도의 사양으로 관리하고 있다.

## 2.5 자바스크립트의 특징

- **웹 브라우저에서 동작하는 유일한 프로그래밍 언어**다. HTML, CSS와 함께 웹을 구성하는 요소다.
- 인터프리터 언어(Interpreter Language)다. 개발자가 별도의 컴파일 작업을 수행하지 않는다.

  - 모던 자바스크립트 엔진(크롬의 V8, 파이어폭스의 SpiderMonkey, 사파리의 JavaScriptCore, 마이크로소프트 엣지의 Chakra 등)은 인터프리터와 컴파일러의 장점을 결합해 비교적 처리 속도가 느린 인터프리터의 단점을 해결했다.</br></br>

  > 모던 브라우저에서 사용되는 인터프리터는 전통적인 컴파일러 언어처럼 명시적인 컴파일 단계를 거치지 않지만 복잡한 과정을 거치며 소스코드를 컴파일하고 실행한다.
  > 이를 통해서 인터프리터 언어의 장점인 동적 기능 지원을 살리면서 실행 속도가 느리다는 단점을 극복했다. 하지만, 자바스크립트는 런타임에 컴파일이되며 실행 파일이 생성되지 않고 인터프리터의 도움 없이 실행할 수 없기 때문에 컴파일러 언어라 할 수 없다.

## 2.6 ES6 브라우저 지원 현황

- 인터넷 익스플로러를 제외한 대부분의 모던 브라우저는 ES6를 지원하지만 100% 지원하는 것은 아니다. [참고](https://kangax.github.io/compat-table/es6/)
- 브라우저에서 아직 지원하지 않는 최신 기능을 사용하거나 인터넷 익스플로러나 구형 브라우저를 고려해야하는 상황이라면 [바벨(Babel)](<https://en.wikipedia.org/wiki/Babel_(transcompiler)>)과 같은 [트랜스파일러](https://ko.wikipedia.org/wiki/%EC%86%8C%EC%8A%A4_%EB%8C%80_%EC%86%8C%EC%8A%A4_%EC%BB%B4%ED%8C%8C%EC%9D%BC%EB%9F%AC)를 사용해 ES6 이상의 사양으로 구현된 소스코드를 ES5 이하 사양으로 다운그레이드할 필요가 있다.
