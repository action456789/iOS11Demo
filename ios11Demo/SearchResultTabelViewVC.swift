//
//  SearchResultTabelViewVC.swift
//  RICISmartSwift
//
//  Created by sen.ke on 2017/6/6.
//  Copyright © 2017年 ke sen. All rights reserved.
//

import UIKit

class SearchResultTabelViewVC: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.definesPresentationContext = true
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = "咬我啊"

        return cell
    }
}

extension SearchResultTabelViewVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text ?? "")
    }
}
