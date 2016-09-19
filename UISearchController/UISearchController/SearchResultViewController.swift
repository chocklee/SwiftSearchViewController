//
//  SearchResultViewController.swift
//  UISearchController
//
//  Created by chocklee on 16/8/4.
//  Copyright © 2016年 北京超信. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController {

    var tableView: UITableView!
    
    var dataArray: Array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SearchResultViewController : UITableViewDataSource,UITableViewDelegate {
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

extension SearchResultViewController {

    func createTableView()  {
        tableView = UITableView(frame: CGRectMake(0, -44, view.frame.size.width, view.frame.size.height), style: UITableViewStyle.Plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
    }
}