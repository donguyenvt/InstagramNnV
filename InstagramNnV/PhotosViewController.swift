//
//  PhotosViewController.swift
//  InstagramNnV
//
//  Created by Nguyen T Do on 3/9/16.
//  Copyright © 2016 Nguyen Do. All rights reserved.
//

import UIKit
import AFNetworking

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var rawData: [NSDictionary]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 320
        
        
        let clientId = "e05c462ebd86446ea48a5af73769b602"
        let url = NSURL(string:"https://api.instagram.com/v1/media/popular?client_id=\(clientId)")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                            //NSLog("response: \(responseDictionary)")
                            self.rawData = responseDictionary["data"] as! [NSDictionary]
                            print(self.rawData)
                            self.tableView.reloadData()
                    }
                }
        });
        task.resume()
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rawData?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoTableViewCell
        let content = rawData![indexPath.row] as! NSDictionary
        let images = content["images"] as! NSDictionary
        let standard_resolution = images["standard_resolution"]
        let photoUrl = standard_resolution!["url"] as! String
        let url = NSURL(string: photoUrl)
        
        cell.photoImageView.setImageWithURL(url!)
        
        return cell
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var vc = segue.destinationViewController as! PhotoDetailsViewController
        var indexPath = tableView.indexPathForCell(sender as! UITableViewCell)
        
        let content = rawData![indexPath!.row] as! NSDictionary
        let images = content["images"] as! NSDictionary
        let standard_resolution = images["standard_resolution"]
        let photoUrl = standard_resolution!["url"] as! String
        vc.photoUrl = NSURL(string: photoUrl)!
        
    }


}

