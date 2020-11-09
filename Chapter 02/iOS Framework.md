## iOS Framework와 Architecture

### 1. iOS Framework

>Cocoa, Cocoa touch는 macOS, iOS에서 실행되는 앱을 개발하기 위한 API 

- Cocoa : 애플 환경에서 맥(macOS)을 제작하기 위한 도구들의 모음

- Cocoa touch :  iOS, tvOS, and watchOS제작 하기 위한 도구들의 모음

  - 코코아 터치 클래스 : UI를 iOS용으로 변경하고 다양한 터치 관련 기능을 클래스로 만들어 놓은 것(**뷰컨트롤러**에 관한 클래스 포함)

    \* 뷰가 전환되면서 특정한 동작이나 작업을 하기 위해 스위프트 소스 코드와 아울렛 변수 및 액션 함수를 추가해야 함

  <img src = "..\image\02\05.png" >

- **프레임워크 접두어** : 코코아 터치 프레임워크의 주요 프레임워크들은 자신들에게 속해있는 객체의 이름에 특정 접두어를 붙이는 경향이 있음 

  - @(Annotation) : 프로퍼티나 메소드의 성격을 알려줌
  - @IBOulet - IB(Interface Builder)의 객체를 참조하는 프로퍼티
    - @IBAction - IB(Interface Builder)의 객체에서 일어나는 이벤트를 받는 메소드
  
  |    프레임워크     | 접두어 |
  | :---------------: | :----: |
  |    Foundation     |   NS   |
  |       UIKit       |   UI   |
  | UserNotifications |   UN   |
  |      MapKit       |   MK   |
  |  Core Foundation  |   CF   |
  |   Core Graphics   |   CG   |
  |   AVFoundation    |   AV   |




### 2. iOS Architecture

>iOS Architecture는 Cocoa Touch, Media, Core Services. Core OS 4개의 층으로 구성

- **상위 계층**에 위치한 프레임워크일수록 구체적이고 Application에게 가까움
  - 상위 프레임워크에 필요한 기능을 모두 직접 구현하는 것이 아닌 하위 프레임워크를 통해 구현된 기능에 보다 구체적인 기능만 덧붙이는 형식 -> 상위 프레임워크는 하위 프레임워크에 의존적
- **하위 계층**에 위치한 프레임워크일수록 추상적이고 하드웨어에 가까움
  - 하드웨어와 직접 커뮤니케이션할 수 없는 애플리케이션이 몇 줄의 코드로 하드웨어 장치를 구동할 수 있는 것은 이같은 프레임워크 계층을 통해 간접적으로 하드웨어를 제어할 수 있기 때문

<img src = "..\image\02\04.png" width = "300">

**Cocoa Touch Layer** (UIKit 포함)

***

> 애플리케이션 프레임워크 계층이라고도 불리며 애플리케이션을 직접 지원하는 역할
>
> iOS에 설치되고 실행되는 모든 애플리케이션은 코코아터치 계층에서 제공하는 프레임워크를 이용해 기능을 구현하고 동작함

`UIKit` → UI element, life cycle management, gestures, touch …

- 아이폰이나 아이패드, 애플 와치나 애플TV 등에서 실행되는 애플리케이션의 유저 인터페이스를 제공하는 프레임워크

`Address Book` → Contact, editing ….

`Event Kit` → Calendar events ..

`Game Kit` → Game Center, p2p networking ..

`iAd` → Apple’s advertisement platform ..

`Map Kit` → Apple map, Google map ..

`Message Kit` → Email, SMS ..



**Media Layer**

***

> **photos, videos, audios, animations, graphics** 등과 관련된 프레임워크를 상위 계층인 코코아터치 계층에 제공해 그래픽 관련 서비스나 멀티미디어 관련 서비스를 제공

`Assets Library` → Photos and videos in the device

`AVFoundation` → Advanced audio and video (ex: qr or barcode scanner)

`Core Audio` → Low level audio

`Core Graphics` → Such as 2D drawing …

`Core Text` → Advanced text layouts and fonts

`Image I/O` → Importing and exporting images

`Media Player` → Simple audio, video playback

`OpenAL`→ Positional Audio

`OpenGLES` → 2D and 3D Drawing

`QuartzCore` → Animations



**Core Services Layer** (Foundation 포함)

***

>문자열 처리, 데이터 집합 관리, 네트워크, 주소록 관리, 환경 설정 등 *핵심적인 서비스 제공*하며, GPS, 나침반, 가속도 센서나 자이로스코프 센서와 같이 *디바이스의 하드웨어 특성에 기반한 서비스 제공*

`Foundation`→ Core foundation such as utility classes

- 애플리케이션의 핵심 객체와 네트워크, 문자열 처리 등의 서비스를 제공하는 프레임워크 
  ex) NSDate, NSURL, NString, NSException

`Address Book` → Lower layer contacts

`CFNetwork` → Socket level networking

`Core Data`→ Data Model

`Core Location` → GPS, celular or wi-fi based location services

`Core Media` → low level media used by AV

`Core Telephony`→ phone interface

`Event Kit`→ low level calendar events

`Mobile Core Services`→ Uniform type identifier support

`Quick Look`→ Previewing files

`Store Kit`→ In App Purchase



**Core OS Layer**

***

>iOS가 운영체제로 기능하기 위한 핵심적인 영역으로 <u>커널, 파일 시스템, 네트워크, 보안, 전원 관리, 디바이스 드라이버 등이 포함</u>

`Accelerate` → Big number and DSP calculations

`External Accessory` → Communicate with hardware accessories.

`Security` → Certificates and Cryptography

`System` → low level Operating system methods.



***

https://medium.com/@anuradhs/ios-architecture-a2169dad8067