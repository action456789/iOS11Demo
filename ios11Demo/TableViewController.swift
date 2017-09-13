//
//  TableViewController.swift
//  ios11Demo
//
//  Created by sen.ke on 2017/9/13.
//  Copyright © 2017年 sen.ke. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let searchResultsVC = SearchResultTabelViewVC(nibName: nil, bundle: nil)
    lazy var searchController: UISearchController = {
        let vc = UISearchController(searchResultsController: searchResultsVC)
        vc.searchResultsUpdater = self.searchResultsVC
        
        vc.hidesNavigationBarDuringPresentation = true
        vc.dimsBackgroundDuringPresentation = true
        
        vc.searchBar.placeholder = "搜索设备"
        vc.searchBar.enablesReturnKeyAutomatically = false
        vc.searchBar.sizeToFit()
        
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
        // 1. iOS11 大标题
        // 导航控制器的`prefersLargeTitles`为大标题的总开关
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 各个控制器可以自己通过 largeTitleDisplayMode，如果导航控制器的 `prefersLargeTitles` 为 NO，largeTitleDisplayMode 将没有效果
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.title = "大王"
        navigationItem.prompt = "prompt"
        
        // 2. iOS11 设置搜索
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        // 3. iOS11 Safe Area Insets
        additionalSafeAreaInsets = UIEdgeInsets(top: 100, left: 0, bottom: 100, right: 100)
        
        // 4. UITableView separatorInsetReference
        // UITableView disable self-sizing
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        
        tableView.separatorInsetReference = .fromAutomaticInsets
        tableView.separatorInset.left = 60
    }
    
    override func viewSafeAreaInsetsDidChange() {
        print(#function)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = "我是标题"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detail = DetailViewController(nibName: nil, bundle: nil)
        detail.navigationItem.title = "详细信息"
        navigationController?.pushViewController(detail, animated: true)
    }
    
    // iOS11 UITableViewCell 左划
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "收藏") { (action, view, completionHandler) in
            // 执行收藏操作
            // ...
            completionHandler(true)
        }
        action.image = #imageLiteral(resourceName: "favorite")
        action.backgroundColor = UIColor.red
        
        let configuration = UISwipeActionsConfiguration(actions: [action])
        
        return configuration
    }
    
    // iOS11 UITableViewCell 右划
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "删除") { (action, view, completionHandler) in
            // remove item
            // ...
            completionHandler(true)
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [action])
        
        return configuration
    }
}
