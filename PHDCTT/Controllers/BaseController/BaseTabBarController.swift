//
//  BaseTabBarController.swift
//  PHDCTT
//
//  Created by liupenghui on 2021/1/12.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTabBar();// 初始化tabBar
        // Do any additional setup after loading the view.
    }
    
    func initTabBar() {
        let itemTitleArr = [
            "首页",
            "话题",
            "",
            "生活",
            "我的"
        ]
        let icon_normal = [
            "tabbar_icon_home",
            "tabbar_icon_friend",
            "tabbar_icon_publish" ,
            "tabbar_icon_all",
            "tabbar_icon_me"
        ]
        
        let icon_selected = [
            "tabbar_icon_home_selected",
            "tabbar_icon_friend_selected",
            "tabbar_icon_publish" ,
            "tabbar_icon_all_selected",
            "tabbar_icon_me_selected"
        ]
        
        let vcnames = [
                "HomeViewController",
                "FriendRootController",
                "BaseViewController",
                "AllViewController",
                "MeViewController"
        ]
        
        var viewControllerArr:Array = [UIViewController]()
        
        for i in 0..<vcnames.count {
            let appName = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
            
            let cls = NSClassFromString(appName + "." + vcnames[i]) as! BaseViewController.Type
            
            var vc: UIViewController!
            
            if i < vcnames.count {
                vc = cls.init()
            }else{
                vc = UIStoryboard.init(name: "me", bundle: nil).instantiateViewController(withIdentifier: "me_stroryboar_identity")
            }
            let barItem = UITabBarItem (title: itemTitleArr[i], image: UIImage (named: icon_normal[i])?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage (named: icon_selected[i])?.withRenderingMode(.alwaysOriginal))
            barItem.tag = i
            if i == 2 {
                barItem.imageInsets = UIEdgeInsets.init(top: -10, left: 0, bottom: 0, right: 0)
            }
            
            barItem.setTitleTextAttributes(convertToOptionalNSAttributedStringKeyDictionary([convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor):UIColor.black]), for: .selected)
            vc.tabBarItem = barItem
            vc.title = itemTitleArr[i]
            
            let navigationvc = BaseNavigationController(rootViewController:vc)
            viewControllerArr.append(navigationvc)
        }
        
        viewControllers = viewControllerArr
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
    guard let input = input else { return nil }
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
    return input.rawValue
}

