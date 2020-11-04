## ViewController Life Cycle 

### 1) ViewController

- 윈도우와 뷰 객체를 통해 사용자에게 화면을 제공하고 상호작용 함 

- `window`와 `view` 사이는 **뷰 컨트롤러**를 통해 연결

- 뷰 컨트롤러 내부는 수많은 뷰들로 이루어지는데, 이들 `view`는 자기 자신을 스크린상에 표시하기도 하지만, 동시에 다른 뷰 객체를 포함하는 컨테이너의 역할도 수행 -> **뷰의 계층구조(View hierachy)** :뷰컨트롤러 - 루트뷰 - 서브뷰 

- 뷰컨트롤러에는 대장격 뷰인 루트뷰컨트롤러가 있고, 일반 `view`나 테이블 뷰, 컬렉션 뷰 등 다양한 뷰가 루트 뷰로 지정될 수 있음

  - 스토리보드에서 뷰 컨트롤러 위에 배치하는 대부분의 객체들은 실제로는 모두 루트 뷰에 추가되는 서브 뷰

  <img src = "..\image\02\15.png" width = "400">

- 뷰컨트롤러의 생명주기는 장면(Scene)의 전환과 복귀에 밀접하게 연관되어 있음

- 장면 전환 시 뷰 컨트롤러의 객체가 생성 / 소멸되기 때문

  - 이 외에도 다른 장면이 현재의 장면을 덮어 화면에서 사라진 상태, 자신의 위를 덮은 다른 장면을 걷어내고 다시 자신이 현재의 스크린에 표시되는 상태 등이 있음

- 생성된 객체는 메모리에 로드되고 뷰 컨트롤러 객체는 메모리에서 해제됨

  - 이때 화면 상태에 따라 메모리를 효율적으로 관리하기 위해 세부적인 제어 필요
    - 타이머나 스톱워치가 다른 화면에 덮인 상태라면 굳이 화면을 갱신하지 않고 다시 화면이 표시될 때 한꺼번에 계산해서 처리하는 것이 메모리 낭비를 줄이고 더 효율적임



### 2) ViewController Life Cycle

<img src = "..\image\02\16.png" width = "300">



#### 1. viewDidLoad()

- **`view`가 메모리에 로드(적재)된 이후에 호출**되는 메서드
- 적재는 되었지만 아직 화면에 나타나지 않은 상태
- IB를 사용하든 안 하든 이 메서드는 반드시 한 번 불리게 됨
- 첫 번째 뷰는 앱이 실행될때 메모리에 로드되었으므로 다시 viewDidLoad()가 호출되지 않음
  - 다른 뷰들은 화면 소멸과 함께 메모리가 해제되어 viewDidLoad() 재호출됨
- IB를 사용하는 경우 이 메서드가 호출되기 전까지 다음의 작업들이 선행
  1. 스토리보드의 정보에 근거하여 뷰들을 인스턴스화
  2. 모든 outlet들과 action들을 연결
  3. root view를 VC의 `view` 프로퍼티에 할당
  4. VC의 awakeFromNib() 메서드를 호출
-  `view`와 그 계층에 대한 추가적인 초기화(additional initialization)를 수행
  - 하위 뷰를 추가하거나 제거하는 것, 레이아웃 제약을 수정하는 것, 뷰를 위한 데이터를 불러오는 작업 등



#### 2) viewWillAppear

- **`view`가 화면에 보여지기 직전에 호출**되는 메서드 (VC가 입장할 때마다 필요한 사전준비)
- viewDidLoad()는 한 번만 호출되지만 이 메서드는 VC가 사라지고 나타날 때마다 호출
- 화면이 등장할 때마다 데이터를 갱신해 주고 싶을때 활용
  - present된 다른 VC가 dismiss할 때 또는 push했던 다른 VC를 pop하여 돌아올 때, 데이터를 매번 업데이트하여 보여주고 싶다면 이 메서드를 활용



#### 3) viewDidAppear

- **`view`가 화면에 보여지고 나서 호출**되는 메서드
- 화면이 보여지고 난 뒤 이어서 애니메이션 효과를 보여주고 싶을 때 에 메서드를 활용



============================= < 화면 생성 > =============================



#### 4) viewWillDisappear

- **`view`가 화면에서 사라지기 전에 호출**되는 메서드
- VC가 퇴장하기 전에 마무리 작업을 하는 곳
  - 다른 액션이 일어나 화면의 전환이 이루어지거나 홈 버튼을 눌러 앱이 백그라운드로 내려가는 등 스크린에서 화면이 퇴장하는 상태 변화가 발생할 때 생성
- 현재 VC의 데이터 변경사항을 최종적으로 반영한다든가 `resignFirstResponder()`를 호출하여 키보드를 먼저 숨기고자 할 때 활용하면 좋음



#### 5) viewDidDisappear

- **`view`가 화면에서 사라진 뒤에 호출**되는 메서드
-  `view`가 사라진 후에 추가적으로 필요한 해체 작업을 이곳에서 수행



============================= < 화면 소멸 > =============================

**[ 화면 이동 비교 - Full Screen ]**

<img src = "..\image\02\17.png">

>1번 화면 (흰색)

- 등장 : viewDidLoad() -> viewWillAppear() -> viewDidAppear() 순으로 호출
- 소멸 : viewWillDisappear() -> viewDidDisappear() 순으로 호출
  - **viewWillDisappear()** : viewDidLoad()와 viewWillAppear() 사이에 호출
  - viewDidDisappear() : 2번 화면이 모두 생성되고 나서 호출

>2번 화면 (파란색)

- 등장 :  viewDidLoad() -> viewWillAppear() -> viewDidAppear() 순으로 호출
- 소멸 : viewWillDisappear() -> viewDidDisappear() 순으로 호출
  - viewWillDisappear() : viewWillAppear() 전에 호출
  - viewDidDisappear() : 1번 화면이 모두 생성되고 나서 호출

>3번 화면 (1번 화면 재등장 - 흰색)

- 등장 : viewWillAppear() -> viewDidAppear() 순으로 호출
  - 첫 번째 뷰는 **앱이 실행될때 메모리에 로드**되었으므로 <u>다시 **viewDidLoad()**가 호출되지 않음</u>
- 소멸 : viewWillDisappear() -> viewDidDisappear() 순으로 호출
  - viewWillDisappear() : viewDidLoad()와 viewWillAppear() 사이에 호출
  - viewDidDisappear() : 2번 화면이 모두 생성되고 나서 호출

>4번 화면 (2번 화면 재등장 - 파란색)

- 등장 : viewDidLoad() -> viewWillAppear() -> viewDidAppear() 순으로 호출

  

**[ 화면 이동 비교 - Automatic ]**

<img src = "..\image\02\18.png" width = "380">



>1번 화면 (흰색)

- 등장 : viewDidLoad() -> viewWillAppear() -> viewDidAppear() 순으로 호출
  - 이후에 2번 화면에서 되돌아가도 어느것도 호출되지 않음
- 소멸 : 없음

>2번 화면 (파란색)

- 등장 :  viewDidLoad() -> viewWillAppear() -> viewDidAppear() 순으로 호출
- 소멸 : viewWillDisappear() -> viewDidDisappear() 순으로 호출

--> 1번 화면 위에 2번 화면이 덮었다 사라지는 형태로 앱실행과 함께 생성한 후 소멸하지 않음 



___



[1] https://oaksong.github.io/2018/02/12/view-controller-life-cycle/

[2] https://medium.com/good-morning-swift/ios-view-controller-life-cycle-2a0f02e74ff5

[3] https://medium.com/ios-development-with-swift/%EC%95%B1-%EC%83%9D%EB%AA%85%EC%A3%BC%EA%B8%B0-app-lifecycle-vs-%EB%B7%B0-%EC%83%9D%EB%AA%85%EC%A3%BC%EA%B8%B0-view-lifecycle-in-ios-336ae00d1855

[4] https://medium.com/@kiljh11/ios-viewcontroller-life-cycle-9b1d813dd920

[5] https://gaki2745.github.io/ios/2019/10/14/iOS-Basic-13/



