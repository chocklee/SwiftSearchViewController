//
//  ViewController.swift
//  UISearchController
//
//  Created by chocklee on 16/8/4.
//  Copyright © 2016年 北京超信. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var searchController: UISearchController!
    var searchResultController: SearchResultViewController!
    
    var tableView: UITableView!
    
    var dataArray: Array = [String]()
    var searchDataArray: Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        searchResultController = SearchResultViewController()
        initData()
        createTableView()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController : UITableViewDataSource,UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if (cell == nil) {
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        }
        cell!.textLabel?.text = dataArray[indexPath.row]
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}

extension ViewController : UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let resultVC = searchController.searchResultsController as! SearchResultViewController
        searchContentForText(searchController.searchBar.text!)
        resultVC.dataArray = searchDataArray
        resultVC.tableView.reloadData()
    }
    
    func searchContentForText(searchText: String)
    {
        searchDataArray.removeAll()
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@",
                                          searchController.searchBar.text!)
        let array = (self.dataArray as NSArray)
            .filteredArrayUsingPredicate(searchPredicate)
        self.searchDataArray = array as! [String]
    }
}

extension ViewController {
    func initData() {
        for i in 0 ..< 30 {
            let str = "测试\(i)"
            dataArray.append(str)
        }
    }
    
    func createTableView()  {
        tableView = UITableView(frame: CGRectMake(0, 0, view.frame.size.width, view.frame.size.height), style: UITableViewStyle.Plain)
        tableView.dataSource = self
        tableView.delegate = self
    
        tableView.tableFooterView = UIView()
        
//        searchController = ({
////            let searchResultController = SearchResultViewController()
//            let controller = UISearchController(searchResultsController: nil)
//            controller.searchResultsUpdater = self
////            controller.searchBar.delegate = self
//            controller.searchBar.sizeToFit()
//            self.tableView.tableHeaderView = controller.searchBar
//            return controller
//        })()
        
        searchController = UISearchController.init(searchResultsController: searchResultController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        
        view.addSubview(tableView)
    }
}
