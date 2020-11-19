//
//  ViewController.swift
//  Alert
//
//  Created by 정수현 on 2020/11/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

   
    @IBAction func alert(_ sender: Any) {
        // 메시지창 객체 생성
        let alert = UIAlertController(title: "선택", message: "항목을 선택해 주세요", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        let defaultAction = UIAlertAction(title: "default", style: .default)
        let destructiveAction = UIAlertAction(title: "destructive", style: .destructive)
        
        // 버튼을 컨트롤러에 등록
        alert.addAction(cancel)
        alert.addAction(defaultAction)
        alert.addAction(destructiveAction)
        // 메시지 창 실행
        self.present(alert, animated: false, completion: nil)
    }
    
    @IBAction func logInButoon(_ sender: Any) {
        let alert = UIAlertController(title: "iTunes Store에 로그인",
                                      message: "사용자의 Apple ID '.        '의 암호를 입력하십시오.",
                                      preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        let okAction = UIAlertAction(title: "확인", style: .default) { (_) in
            if let tf = alert.textFields?[0] {
                print("입력된 값은 \(tf.text!) 입니다.")
            } else {
                print("입력된 값이 없습니다.")
            }
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        // textField 추가
        alert.addTextField { (tf) in
            // textField 속성설정
            tf.placeholder = "암호" // 안내 메시지
            tf.isSecureTextEntry = true // 비밀번호 처리
        }
        
        present(alert, animated: false, completion: nil)
    }
    
    @IBAction func authButton(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "로그인", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        let okAction = UIAlertAction(title: "확인", style: .default) { (_) in
            let logInText = alert.textFields?[0].text
            let passwordText = alert.textFields?[1].text
        
        }
        // 아이디 텍스트필드 추가
        alert.addTextField { (tf) in
            tf.placeholder = "ID" // 미리 보여줄 안내메시지
            tf.isSecureTextEntry = false // 입력시 * 처리 안함
        }
        // 비밀번호 텍스트필드 추가
        alert.addTextField { (tf) in
            tf.placeholder = "Password" // 미리 보여줄 안내메시지
            tf.isSecureTextEntry = true // 입력시 * 처리
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
    
        present(alert, animated: false, completion: nil)
    }
    
    
}

