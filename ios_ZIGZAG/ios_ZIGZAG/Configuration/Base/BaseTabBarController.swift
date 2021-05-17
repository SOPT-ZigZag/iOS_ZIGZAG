//
//  BaseTabBarController.swift
//  ios_ZIGZAG
//
//  Created by Yi Joon Choi on 2021/05/17.
//

import Foundation
import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    let homeViewController  = HomeViewController()
    let storeViewController = StoreViewController()
    let moaViewController  = MoaViewController()
    let likeViewController  = LikeViewController()
    var mypageViewController = MyPageViewController()
    
    let homeTabBarItem  = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 0)
    let storeTabBarItem = UITabBarItem(title: "스토어", image: UIImage(systemName: "star.fill"), tag: 1)
    let moaTabBarItem  = UITabBarItem(title: "모아보기", image: UIImage(systemName: "line.horizontal.3"), tag: 2)
    let likeTabBarItem  = UITabBarItem(title: "찜", image: UIImage(systemName: "magnifyingglass"), tag: 3)
    let mypageTabBarItem  = UITabBarItem(title: "마이페이지", image: UIImage(systemName: "person.fill"), tag: 4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        let storeNavigationController = UINavigationController(rootViewController: storeViewController)
        let moaNavigationController = UINavigationController(rootViewController: moaViewController)
        let likeNavigationController = UINavigationController(rootViewController: likeViewController)
        let mypageNavigationController = UINavigationController(rootViewController: mypageViewController)
        
        homeNavigationController.tabBarItem = homeTabBarItem
        storeNavigationController.tabBarItem = storeTabBarItem
        moaNavigationController.tabBarItem  = moaTabBarItem
        likeNavigationController.tabBarItem  = likeTabBarItem
        mypageNavigationController.tabBarItem  = mypageTabBarItem
       
        self.viewControllers = [homeNavigationController,
                                storeNavigationController,
                                moaNavigationController,
                                likeNavigationController,
                                mypageNavigationController]
        
        self.delegate = self
        
        UITabBar.appearance().tintColor = .grayScaleDarkGray02
        
    }
    
}
