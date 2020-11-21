## Delegate Pattern

### Delegate Pattern(위임 패턴) 정의

- 미리 정의된 델리게이트 메소드 사용
- 델리게이트 프로토콜
- 특정 클래스의 구현 중 일부를 다른 클래스에서 구현할 수 있도록 하는 패턴
- 프로토콜 : 객체간 소통을 위한 강력한 통신 규약으로 데이터나 메시지를 전달할 때 사용

델리게이트 패턴 순서

1. Protocol 생성 (delegate method)
2. **채택** (class에 delegate이름 작성)
3. 대리자 위임
4. **준수** (함수 구현)

---

### 01. 텍스트 필드(UITextField)

1. 텍스트 필드에 대한 델리게이트 프로토콜을 구현
   - 프로토콜명 : UITextFieldDelegate(객체의 클래스명 + 델리게이트)
   - 메소드 작성
2. 텍스트 필드의 델리게이트 속성을 뷰 컨트롤러에 연결
   - 델리게이트 속성 : 델리게이트 메소드가 구현되어 있는 객체 
   - p.422



### 02. 이미지 피커 컨트롤러

- 카메라/앨범 등을 통해 이미지를 선택할 때 사용하는 컨트롤러로 단순히 이미지를 선택해서 가져오는 기능
- 이미지를 불러올 소스를 어떤 것으로 설정하느냐에 따라 앨범이나 카메라 기능을 사용할 수 있음

- 화면 전체를 덮기 때문에 운영체제가 일시적으로 앱에 대한 제어 권한을 가져감
- 작동 과정 : 개발자가 의도한 시점에 소스 코드를 통해 호출되어 앱의 제어 권한을 가져온 다음, 사용자가 카메라로 사진을 촬영하거나 앨범에서 사진을 선택하면 그 이미지 정보를 델리게이트로 지정된 객체에 메소드 호출을 통해 인자값으로 전달해주어 우리가 선택한 이미지를 사용할 수 있도록 해줌
- 실행 과정 : UIImagePickerController 클래스의 인스턴스를 생성하고 여기에 몇 가지 기능 관련 속성을 설정한 다음 present() 메소드에 인자값을 넣어 호출





- Delegate 속성은 선택한 이미지를 반환받을 대상을 지정하는 속성 
- 속성값으로 self를 지정하면 이미지를 자기 자신의 뷰 컨트롤러로 받겠다는 의미 -> 선택한 이미지는 델리게이트 메소드를 통해 전달받게 되므로 이를 위해 **델리게이트 프로토콜**을 구현해야 함
  - UIImagePickerControllerDelegate, UINavigationControllerDelegate
- UIImagePickerControllerDelegate 메소드 구현
  - **func** imagePickerController(**_** picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : **Any**])
    - 두 개의 인자값을 전달 
      1. 이 메소드를 호출하는 이미지 피커 컨트롤러 객체 : 하나의 뷰 컨트롤러에서 두 개 이상의 이미지 피커 컨트롤러를 사용하고 있을 경우, 첫 번째 인자값을 이용하여 어느 이미지 피커 컨트롤러가 호출된 것인지 확인할 수 있음
      2. 우리가 원하는 이미지에 대한 데이터 : 단순히 선택한 이미지가 아닌 이미지 객체에 대한 종합 정보가 딕셔너리 형태로 전달되므로 전달받은 인자값에 적절한 키를 사용하면 원하는 정보를 추출할 수 있음
  - **func** imagePickerControllerDidCancel(**_** picker: UIImagePickerController)



- Info.plist에서 카메라 사용을 위한 접근 키 설정
- [Privacy - Photo Library Usage Description]
  - Privacy - 로 시작하는 대부분의 키 값들은 사적 데이터 공간에 접근하기 위해 설정해야 하는 항목들