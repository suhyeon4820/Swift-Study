//
//  AppCoordinator.swift
//  RxSwiftMVVM
//
//  Created by 정수현 on 2020/11/28.
// Lecture 01 - Project Setup and Coordinator
// Lecture 02 - Model & Observable To Fetch JSON
// Lecture 03 - View Model & RxCocoa Binding
/*
 - https://medium.com/@jang.wangsu/%EB%94%94%EC%9E%90%EC%9D%B8-%ED%8C%A8%ED%84%B4-swift-coordinator-pattern-426a7628e2f4
 - http://labs.brandi.co.kr/2020/06/16/kimjh.html
 - https://medium.com/@ch41150266/coordinator-pattern-bf4a1bc46930
 */
// Coordinators Pattern은 화면들(ViewControllers)의 계층을 관리하는 것, 화면간의 연결을 해결하는 중요한 개념(navigation 코드가 필요 없음?


import Foundation
import UIKit

class AppCoordinator {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    // 중요 rootviewcontroller
    func start() {
        let viewController = ViewController.instantiate(viewModel: RestaurantsListViewModel())
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
