## ARC(Auto Reference Count)

#### ARC(Auto Reference Counting)

- **자동**으로 **메모리 관리**해주는 좋은 친구
- 객체에 대한 **참조 카운트를 관리**하고 **0**이 되면 자동으로 **메모리 해제**
- run time에 계속 실행되는게 아니라 **complie time**(build 할 때)에 실행



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