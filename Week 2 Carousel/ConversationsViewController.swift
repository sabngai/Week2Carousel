//
//  ConversationsViewController.swift
//  Week 2 Carousel
//
//  Created by Ngai, Sabrina on 8/28/16.
//  Copyright © 2016 Ngai, Sabrina. All rights reserved.
//

import UIKit

class ConversationsViewController: UIViewController {
    
    @IBAction func onBackButton(sender: AnyObject) {
        //return back to previous page
        navigationController?.popToRootViewControllerAnimated(true)
        
        //how is this different than above
        //navigationController!.popViewControllerAnimated(true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
