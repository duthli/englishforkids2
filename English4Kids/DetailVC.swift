//
//  DetailVC.swift
//  English4Kids
//
//  Created by hoangdangtrung on 1/5/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var stringTitle: String!
    var dictData: NSDictionary!
    var arrayKeys: NSArray!
    var z : Int!
    var key: String!
    var arrVal:NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = stringTitle
        
        self.createDataWithName(stringTitle)
        
        self.tableView.registerClass((UITableViewCell.self), forCellReuseIdentifier: "Cell")

    }
    func createDataWithName(title: String) {
        var path: String = ""
        if (title == "Fruits") {
            path = NSBundle.mainBundle().pathForResource("FruitsList", ofType: "plist")!
        }
        if (title == "Animals") {
            path = NSBundle.mainBundle().pathForResource("AnimalsList", ofType: "plist")!
        }
        dictData = NSDictionary(contentsOfFile: path)!
        arrayKeys = dictData.allKeys
        arrVal = dictData.allValues
        arrayKeys = arrayKeys.sortedArrayUsingSelector("compare:")
        
        arrVal = arrVal.sortedArrayUsingSelector("compare:")
        
    }

  
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayKeys.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        key = arrayKeys[indexPath.row] as! String
        cell.textLabel?.text = key
        z = indexPath.row
        cell.imageView?.image = UIImage(named: "\(dictData[key]!)")
        
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("\(indexPath.row) - \(arrayKeys[indexPath.row])")
        
        print(arrVal[indexPath.row])
        
        let imageVC = storyboard?.instantiateViewControllerWithIdentifier("imgVC") as! ImgVC
        
        imageVC.nameImage = arrVal[indexPath.row] as? String
        navigationController?.pushViewController(imageVC, animated: true)
        
    }

}







