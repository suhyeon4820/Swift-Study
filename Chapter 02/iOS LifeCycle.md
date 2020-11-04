## iOS App's Life Cycle

>앱의 Life Cycle을 관리하는 것은 앱상태가 foreground이거나 background 상태일때 시스템 알림에 응답하고 시스템 관련 주요 상황에 대응하기 위함
>
>- foreground app : 사용자가 이용하고 있는 상태로 CPU포함 시스템 자원의 우선순위가 높은 상황
>- background app : 사용자에게 보이지 않는 상태로 동작을 최소화하고 작동을 중지함

### 1) App State

- 앱의 상태 : 앱이 실행되고 있는지, 화면에 보여지고 있는지 등에 따른 상태로 크게 5가지로 구분

  - **Not Running(Terminated)** : 앱이 시작되지 않았거나, 실행되었지만 시스템에 의해 완전히 종료되어 <u>아무것도 동작하지 않는 상태</u>

  - **Inactive(Foreground)** : 앱이 실행중이지만 사용자로부터 event를 받을 수 없는 상태

    - 멀티태스킹 창으로 진입하거나 앱 실행 중 전화, 알림 등에 의해 앱을 사용할 수 없게 되는 경우 이 상태로 진입
    - 앱은 **Foreground와 Background 상태 사이를 이동할 때** `반드시 Inactive 상태를 거침` -> <u>앱의 상태 전환 과정에서 잠깐 머무는 단계</u>

  - **Active(Foreground)** : 앱이 실제로 실행중이고 사용자 event를 받아 상호작용할 수 있는 상태  

  - **Background** :  홈 화면으로 나가거나 다른 앱으로 전환되어 현재 앱이 실질적인 동작을 하지 않지만 코드가 실행되고 있는 상태 

    - 음악 앱을 닫아도 재생한 음악이 계속 실행되는 경우 이에 해당(사용자가 앱을 사용하지 않는 동안 서버와 데이터를 동기화하거나 타이머가 실행되어야 하는 등의 작업을 이 상태에서 할 수 있음) -> 동작하지 않는 앱은 바로 suspended로 전환

  - **Suspended** : 앱이 메모리에 유지되지만 실행되는 코드가 없는 상태

    - 앱을 다시 실행했을 때 최근 작업을 빠르게 로드하기 위해 메모리에 관련 데이터만 저장되어 있는 상태

    - 앱이 Background 상태로 진입했을 때 다른 작업을 하지 않으면  2~3초 이내로 Suspended 상태로 전환

    - iOS가 메모리가 부족해지는 상황이 오면 가장 먼저 메모리에서 해제 -> 앱을 종료시킨 적이 없어도 다시 앱을 실행시키려고 하면 처음부터 다시 실행(리프레쉬 현상)

      <img src = "..\image\02\09.png">




### 2) App's Life Cycle Methodes

- iOS 12 전까지는 전체 Life Cycle을 **UIApplicationDelegate**에서 담당하고 있어 Life Cycle 관련 protocol을 채택하고 있는 AppDelegate에서 method를 구현

  - `UIApplicationDelegate` : 앱 실행 및 종료와 관련된 **Process Life Cycle** 담당
  - `UISceneDelegate` : 앱이 Foreground와 Background 상태에 있을 때 상태 전환과 관련된 **UI Life Cycle** 담당

- iOS 13부터 **Scene**이라는 개념이 도입되면서 **하나의 앱이 여러 UI Life** **Cycle을** 가질 수 있게 됨

  - 각각의 Scene에서 관리하는 UI Life Cycle은 **UISceneDelegate**에서 관리하고, 해당 protocol을 채택하고 있는 SceneDelegate가 <u>각각의 Scene에서 관리하는 UI Life Cycle에 대응되는 method들을 구현</u>
  - UI Life Cycle의 책임이 Scene으로 옮겨가면서, AppDelegate의 method 이름이 application에서 scene으로 바뀌기만 했을 뿐 맡은 역할과 호출되는 시점은 동일

  <img src = "..\image\02\08.png">

- `sceneDidBecomeActive(_:)` : scene과의 상호작용이 시작할 때 호출
- `sceneWillResignActive(_:)` : scene과의 상호작용을 중지할 때 호출

- `sceneWillEnterForeground(_:)` : scene이 foreground로 진입할 때 호출

- `sceneDidEnterBackground(_:)` : scene이 background에 진입한 직후에 호출



#### [ Scene-Based Life Cycle ]

<img src = "..\image\02\07.png" width = "400">

- **사용자(실선)**가 요청하는 Scene은 빠르게 foreground로 이동
- **시스템(점선)**이 요청한 Scene은 이벤트를 처리할 수 있도록 background로 이동



#### 1) 앱 실행 

- **application(_:didFinishLaunchingWithOptions:)**
  - 앱이 실행되고 앱을 화면에 띄우기 위한 모든 설정이 완료된 뒤, 실제로 화면에 나타나기 직전에 호출



 #### 2) Scene 연결

> 앱이 실행되면 UIKit에 Scene을 연결해야 함
>
> Scene이 연결되고 화면에 나타나기까지 과정에서 다음 순서로 method들이 호출

- **application(_:configurationForConnecting:options:)** [링크]((https://developer.apple.com/documentation/uikit/uiapplicationdelegate/3197905-application))
  - <u>새로운 Scene을 만들고</u> UIKit과 연결하기 위한 configuration을 지정
  - 여기서 Configuration은 Scene의 delegation 객체를 지정하는 등 Scene을 연결하기 위한 정보가 들어 있는 UISceneConfiguration 객체(일반적으로 info.plist에 추가된 기본값을 사용해서 생성)

- **scene(_:willConnectTo:options:)** [링크](https://developer.apple.com/documentation/uikit/uiscenedelegate/3197914-scene)
  - Scene이 연결될 것임을 delegate에 알려줌
  - 기존에 application(_:didFinishLaunchingWithOptions:)에서 했던 <u>UIWindow 생성 작업을 이 method에서 할 수 있음</u>
  - Storyboard를 사용한다면 storyboard에서 entry point를 찾아 내부적으로 UIWindow를 생성

- **`sceneDidBecomeActive(_:)`** [링크](https://developer.apple.com/documentation/uikit/uiscenedelegate/3197915-scenedidbecomeactive)
  - 앱이 Inactive에서 Active 상태로 전환되었을 때 호출

 

#### 3) Background 전환 (offscreen)

##### [ 1. <u>Active -> Inactive</u> ] -> [2. Background ( -> Suspended) ]

>앱 실행 후 홈 화면으로 나가면 Active에서 Inactive를 거쳐 Background로 상태가 전환
>
>이 때, SceneDelegate는 Scene에 다음 순서로 method를 호출하도록 요청

- **`sceneWillResignActive(_:)`** [링크](https://developer.apple.com/documentation/uikit/uiscenedelegate/3197919-scenewillresignactive)
  
- 앱이 Active에서 Inactive 상태로 전환될 때 호출
  
- **`sceneDidEnterBackground(_:)`** [링크](https://developer.apple.com/documentation/uikit/uiscenedelegate/3197917-scenedidenterbackground)

  - 앱이 Foreground에서 Background 상태로 전환되었을 때 호출

  <img src = "..\image\02\10.png">

 

#### 4) Foreground 전환 (onscreen)

##### [ 1. Background --> Inactive ] --> [ 2. Active ]

> Background 상태에 있는 앱을 다시 실행하면 Inactive를 거쳐 Active 상태로 전환
>
> 이 때, SceneDelegate는 시스템에 다음 순서로 method를 호출하도록 요청

- **sceneWillEnterForeground(_:)** [링크](https://developer.apple.com/documentation/uikit/uiscenedelegate/3197918-scenewillenterforeground)
  
- 앱이 Background에서 Inactive(foreground) 상태로 전환될 때 호출 
  
- **sceneDidBecomeActive(_:)** [링크](https://developer.apple.com/documentation/uikit/uiscenedelegate/3197915-scenedidbecomeactive)

  - 앱이 Inactive에서 Active 상태로 전환될 때 호출

  <img src = "..\image\02\11.png">



 #### 5) Scene 연결 해제

>- 기존 App-Based Life Cycle에서는 멀티태스킹 창에서 swipe up 제스처를 사용하여 앱을 종료
>- 하지만 Scene을 사용할 때는 **multi window**를 지원하기 때문에, 앱이 둘 이상의 scene window를 갖는다면 swipe up 제스처는 앱을 종료시키지 않고 **Scene을 해제**시키기만 함 -><u>모든 Scene의 연결이 해제되었다면 앱이 종료</u>

- **sceneDidDisconnected(_:)** [링크](https://developer.apple.com/documentation/uikit/uiscenedelegate/3197916-scenediddisconnect)
  - delegate에 UIKit에 연결된 Scene의 연결을 해제할 것을 요청

- **application(_:didDiscardSceneSessions:)** [링크](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/3197906-application)
  - 사용자가 멀티태스킹 화면(app switcher)에서 한개 이상의 Scene을 종료시켰을 때 호출

- **applicationWillTerminate(_:)** [링크](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1623111-applicationwillterminate)
  - 앱이 사용자에 의해 종료될 때 호출 (시스템에 의해 예기치 못한 상황에서 종료될 때는 호출되지 않음)





***

[1] https://cskime.tistory.com/11?category=885092

[2] https://duwjdtn11.tistory.com/509

[3] https://usinuniverse.bitbucket.io/blog/scenedelegatepart1.html

[4] https://medium.com/@jgj455/%EC%98%A4%EB%8A%98%EC%9D%98-swift-%EC%83%81%EC%8B%9D-%EC%95%B1-%EC%83%9D%EB%AA%85%EC%A3%BC%EA%B8%B0-878dfe51d182

