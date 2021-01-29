//
//  AppDelegate.swift
//  PHDCTT
//
//  Created by liupenghui on 2021/1/12.
//



import UIKit

import Alamofire

let bugly_app_id = "6b7becdcc1"
let bugly_app_key = "c80a1d4b-8a8f-44b7-9734-99c95ba61e53"

///微信开放平台ID
let wxAppId = "wx99c8b9a7590b0c04"
let wxAppSecret = "01554d9297c4f65b6094a00cf6ef1f3e"
///QQ开发平台
let qqAppId = "101511561"
let qqAppKey = "b08bacb33bc8d4cd6ad00ce8ebbdf662"


@main
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {

    var window: UIWindow?
    
    var myDeviceToken: String?
    
    var _netWorkReachabilityManager: NetworkReachabilityManager!
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let baseTabBar = BaseTabBarController()
        baseTabBar.delegate = self;
        window?.rootViewController = baseTabBar
        window?.makeKeyAndVisible()
        return true
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}

