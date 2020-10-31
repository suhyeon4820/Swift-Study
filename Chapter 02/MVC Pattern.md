## MVC Pattern

#### 좋은 Architecture의 특징

1. Balanced **distribution** of responsibilities among entities with strict roles : 엄격한 역할이 있는 엔티티간의 균형잡힌 책임 분배
   - 복잡도를 낮추는 가장 쉬운 방법은 단일책임원칙(SRP)에 따라 다중 엔티티간의 **책임을 나누는 것**

2. **Testability** usually comes from the first feature : 테스트 가능성
3. **Ease of use** and a low maintenance cost : 사용이 용이하고 유지보수에 비용이 적게 발생



< MVC 구성 요소>

- Model : <u>What</u> your application is (but not <u>how</u> it is displayer) 
- View : **Controller**'s minions(일반화된 Oulet 객체들) --> do not own the data they display
- Controller : <u>How</u> your **Model** is presented to the user(UI logic)
- Model, View, Controller 세 가지로 나누는 것이 결과적으로 **이해하기 쉬워지고 재사용할 수 있고 독립적으로 테스트 가능**



### Apple’s MVC

- 전통적인 MVC 패턴은 엔티티간 강하게 연결되어 있어 서로를 잘 알기 때문에 독립성이 없어 재사용성이 떨어짐

- (예상한 MVC 모델) Cocoa MVC 패턴은 컨트롤러가 뷰와 모델의 중재자가 되어 서로 알 필요가 없게됨 -> Model에 작성할 로직은 Controller에 작성

  <img src = "../\image\02\02.png">

- (실제적 MVC 모델) 결론적으로 View와 Controller가 결합된 형태로 변이되었음 -> Controller가 비대해졌고 역할이 많아짐

  - Distribution : View와 Controller가 결합
  - Test ability : 분리가 된 Model만 가능
  - Ease of use : 다른 패턴에 비해 코드가 적음
  
  <img src = "../\image\02\03.png">



## MVC Communications

- Controllers can always talk directly to their **Model**

  - 컨트롤러는 모델을 완전히 통제해 사용자에게 모델이 있는 것을 표현하거나 사용자로부터 정보를 받아 모델을 업데이트 함
  - 컨트롤러가 모델에게 소통 : 인스턴스
  - 모델이 컨트롤러에 소통 : Notification, KVO(Key Value Observation)

- Controllers can also talk directly to their **View**

  - 대부분 *Oulet*을 통해 컨트롤러와 뷰가 연결되어  통제함
  - 뷰에 있는 객체들은 *액션함수, delegate*를 통해 컨트롤러와 소통

- The **Model** and **View** should never speak to each other

  - 모델은 UI와 독립적이기 때문에 완전히 UI에 읜족적인 뷰와 소통하지 않음

  <img src = "../\image\02\01.png" width = "600">

* 그림은 도로를 나타냄 노란색 중앙선으로 객체가 연결(이동)될 수 없고 흰색선은 연결 가능



***

https://blog.canapio.com/43