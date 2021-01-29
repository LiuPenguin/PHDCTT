//
//  HomeViewController.swift
//  PHDCTT
//
//  Created by liupenghui on 2021/1/12.
//

import UIKit

import RxSwift

import SwiftTTPageController

class HomeViewController: BaseViewController,TTPageViewControllerDelegate,TTHeadViewDelegate {
   

    var vcArr = [BaseTableViewController]()
    var pagevc :TTPageViewController!
    var topview : TTHeadView!
    let _logo_title = "郸城头条"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _init()
        // Do any additional setup after loading the view.
    }
    
    
    func _init() {
        let titles = ["最新","热门","打听","吐槽","公告"]
        let titlesId = [
            "最新":"0",
            "热门":"1",
            "打听":"11",
            "吐槽":"12",
            "公告":"13"
        ]
        let _w: CGFloat = 50 * CGFloat(titles.count) < kCurrentScreenWidth ? 55 : 50
        
        var attri = TTHeadTextAttribute()
        attri.itemWidth = _w
        attri.defaultFontSize = 16
        attri.selectedFontSize = 16
        attri.selectedTextColor = UIColorFromHex(rgbValue: 0xff4500)
        attri.bottomLineColor = UIColorFromHex(rgbValue: 0xff4500)
        attri.bottomLineHeight = 2
        
        let bg = UIView.init(frame: CGRect(x: 0, y: 0, width: kCurrentScreenWidth, height: 35));
        
        topview = TTHeadView (frame: CGRect (x: 0, y: 0, width: _w * CGFloat(titles.count) , height: 35), titles: titles, delegate: self ,textAttributes:attri)
        bg.addSubview(topview);
        self.navigationItem.titleView = bg;
        
        for i in 0..<titlesId.count {
            let t = titles[i]
            
            let v = HomerListViewController(String.isNullOrEmpty(titlesId[t]));
            //v.view.frame =  CGRect (x: 0, y: 0, width: kCurrentScreenWidth, height: _h - 49)
            vcArr.append(v)
        }
        
        pagevc = TTPageViewController(controllers: vcArr, frame: CGRect(x: 0, y: 0, width: kCurrentScreenWidth, height: kCurrentScreenHeight - 50), delegate: self)
        
        self.addChild(pagevc)
        view.addSubview(pagevc.view)
        
        //navigationbar item
        let logo_lable = UILabel (frame: CGRect (x: 0, y: 0, width: kCurrentScreenWidth, height: 30))
        logo_lable.text = _logo_title
        logo_lable.font = UIFont.systemFont(ofSize: 17)
        logo_lable.textColor = UIColorFromHex(rgbValue: 0xdcdcdc);
        logo_lable.textAlignment = .center
//        navigationItem.titleView = logo_lable;
    }
    
   //MARK: - TTHeadView-Delegate
    func tt_pageControllerSelectedAt(_ index: Int) {
        
    }
    
    func tt_headViewSelectedAt(_ index: Int) {
        
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
