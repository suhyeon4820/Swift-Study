## ARC(Automatic Reference Counting)

#### ARC 개념

- 컴파일러가 인스턴스(객체)의 참조 횟수를 카운팅하여 **참조 카운트가 0인 인스턴스를 메모리에서 자동으로 해제**시키는 메모리 관리 방식
  - Swift는 ARC를 통해 앱의 메모리 사용 상태를 추적 및 관리
  - run time에 계속 실행되는게 아니라 **complie time**(build 할 때)에 실행
  - 참조 카운팅(Reference Counting, RC)은 **참조 타입**인 **클래스 인스턴스 및 클로저**에만 적용
    - 구조체와 열거형(enumeration)은 참조 타입이 아닌 값 타입이기 때문에 참조를 사용하지 않음
  - ARC는 인스턴스를 참조하게 되는 시점에 **컴파일러가 사용자 대신 Retain/Release code를 자동으로 생성**
- ARC의 도입으로 인스턴스를 참조하고(retain) 해제하는(release) 코드를 개발자가 직접 작성해야 했던 기존의 방식**(MRR, Manual Retain-Release)**에서 벗어남
  - 객체가 인스턴스를 참조할 때는 **retain** method를 추가하고, 모두 사용하고 난 뒤 메모리에서 정리할 때는 **release** method를 추가

<img src = "\..\image\02\06.png">



#### Weak & Strong

- Strong
  - 객체를 참조는 하지만 reference count를 증가 X
  - 다른 곳에서 참조하고 있을 경우 메모리에서 제거되지 않음
    - strong으로 선언된 변수들끼리 상호 참조하는 일이 생길 경우에는 앱이 종료되기 전까지는 메모리에서 제거되지 않아 메모리 누수 발생
- Weak
  - 객체를 참조 안함 reference count를 증가 O
  - 다른 곳에서 참조하고 있더라도 시스템이 임의적으로 메모리에서 제거할 수 있음
    - 변수를 weak로 지정하면 시스템에서 임의로 제거할 수 있어 상호참조할 때에도 사용하지 않을 경우에 메모리 삭제 가능
- **RC(Reference Counting, Retain Counter)**와 메모리 해제 : 특정 객체의 RC값이 '0'이 되면(즉, 해당 객체를 strong 참조하는 곳이 하나도 없으면) 해당 객체는 메모리에서 해제
- 뷰를 씬에 삭제했다가 다시 추가해야 하는 상황이라면 Strong 으로 작성하고, 그 외에는 Weak로 작성

***

https://cskime.tistory.com/12?category=885092

