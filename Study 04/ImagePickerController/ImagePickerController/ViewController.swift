//
//  ViewController.swift
//  ImagePickerController
//
//  Created by 정수현 on 2020/11/21.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    // 이미지 피커 인스턴스 생성
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 델리게이트 지정
        picker.delegate = self
    }
    
    
    // 프로토콜 메소드 1 - 이미지 피커에서 이미지를 선택하거나 카메라 촬영을 완료했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 이미지를 이미지 뷰에 표시 : Any타입을 UIImage 타입으로 캐스팅
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imageView.image = originalImage
        } else {
            print("ee")
        }
        self.picker.dismiss(animated: true, completion: nil)
    }
    
    // 프로토콜 메소드 2 - 이미지 피커에서 이미지를 선택하지 않고 취소했을 때 호출되는 메소드
    // 이미지 피커 컨트롤러 창을 닫아줌
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // 버튼
    @IBAction func pickImage(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // 이미지 소스 선택
            picker.sourceType = .photoLibrary
            // 이미지 편집 가능 여부 설정
            picker.allowsEditing = true
           
            // 이미지 피커 컨트롤러 실행 (모달로 올려주기)
            self.present(picker, animated: true, completion: nil)
        }
    }
}

