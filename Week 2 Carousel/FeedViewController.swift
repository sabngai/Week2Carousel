//
//  FeedViewController.swift
//  Week 2 Carousel
//
//  Created by Ngai, Sabrina on 8/28/16.
//  Copyright © 2016 Ngai, Sabrina. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        feedScrollView.contentSize = feedImage.image!.size
        
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
