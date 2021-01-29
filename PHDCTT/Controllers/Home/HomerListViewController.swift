//
//  HomerListViewController.swift
//  PHDCTT
//
//  Created by liupenghui on 2021/1/29.
//

import UIKit
import MJRefresh
import Alamofire
import SDWebImage

class HomerListViewController: BaseTableViewController {
    
    var pageNumber:Int = 1;
    
    private var _type: String!
    
    private var _categry: String!
    
    private var loadDataSuccess: Bool = false
    
    
    init(_ type: String , categry: String = "sy") {
        super.init(nibName: nil, bundle: nil)
        _type = type
        _categry = categry
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(hasPublishSuccessNoti(_:)), name: kHasPublishedSuccessNotification, object: nil)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @objc func hasPublishSuccessNoti(_ noty:Notification) {
        if let info = noty.userInfo,let type = info["type"] as? String {
            if _type != type || _type == "0" {
                tableView.mj_header.beginRefreshing()
            }
        }
    }


}
