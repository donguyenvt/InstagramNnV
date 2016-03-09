//
//  PhotoDetailsViewController.swift
//  InstagramNnV
//
//  Created by victor aguirre on 3/9/16.
//  Copyright © 2016 Nguyen Do. All rights reserved.
//

import UIKit
import AFNetworking

class PhotoDetailsViewController: UIViewController {

    @IBOutlet weak var photoDetailsImageView: UIImageView!
    var photoUrl: NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoDetailsImageView.setImageWithURL(photoUrl)
        // Do any additional setup after loading the view.
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
