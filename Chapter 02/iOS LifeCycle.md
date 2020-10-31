## iOS App's Life Cycle

>앱의 Life Cycle을 관리하는 것은 앱상태가 foreground이거나 background 상태일때 시스템 알림에 응답하고 시스템 관련 주요 상황에 대응하기 위함

- foreground app : 사용자가 이용하고 있는 상태로 CPU포함 시스템 자원의 우선순위가 높은 상황

- background app : 사용자에게 보이지 않는 상태로 동작을 최소화하고 작동을 중지함

- 적절한 delegate object 선택

  - iOS 13 이후 :  `UISceneDelegate` object 사용

  - iOS 12 이전 : `UIApplicationDelegate` object 사용

    

### Scene-Based Life-Cycle Events

***

https://cskime.tistory.com/11?category=885092