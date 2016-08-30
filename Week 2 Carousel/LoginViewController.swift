//
//  LoginViewController.swift
//  Week 2 Carousel
//
//  Created by Ngai, Sabrina on 8/28/16.
//  Copyright © 2016 Ngai, Sabrina. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {  //declare uiscrollviewdelagate

    
    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var loginSpinner: UIActivityIndicatorView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    @IBAction func onTapLoginBackButtom(sender: AnyObject) {
       navigationController!.popViewControllerAnimated(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view.
        
        //set scroll view delegate
        loginScrollView.delegate = self
        
        //set scrollview content size and inset
        loginScrollView.contentSize = loginScrollView.frame.size
        loginScrollView.contentInset.bottom = 100
        
        //register for keyboard events
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120
        
    }
    
    //defining keyboard methods to be called
    func keyboardWillShow(notifications: NSNotification!) {
        print ("keyboardWillShow")
        
        //move button above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        
        //scroll the scrollview up
        loginScrollView.contentOffset.y = loginScrollView.contentInset.bottom
    
    }
    
    func keyboardWillHide(notifications: NSNotification!){
        print ("keyboardWillHide")
        
        buttonParentView.frame.origin.y = buttonInitialY
    }
    
    
    
    
    //on tap gesture recognizer (tap outside bounds) stop editing
    @IBAction func onTapGestureRecognizer(sender: AnyObject) {
        //stop editing, automatically dismisses keyboard
        view.endEditing(true)
        
        //reposition elelements
        buttonParentView.frame.origin.y = buttonInitialY
        loginScrollView.contentOffset.y = loginScrollView.contentInset.top
    }

    
    @IBAction func onTapSignInButton(sender: AnyObject) {
        loginSpinner.startAnimating()
        loginButton.selected = true
        
        if inputEmail.text == "e" && inputPassword.text == "p" {
            delay(0.5){
                
                print("delay ")
                self.loginSpinner.stopAnimating()
                self.loginButton.selected = false
                
                //What is the difference between nil and self
                //self.performSegueWithIdentifier("loginSeque", sender: nil)
                self.performSegueWithIdentifier("loginSeque", sender: self)
            }
        }
            
        else {
            delay(0.5){
    
                self.loginSpinner.stopAnimating()
                self.loginButton.selected = false
                let alert = UIAlertController(title: "Oopsie Daisies", message: "Fill 'em both out", preferredStyle: .Alert)
                
                let okAction = UIAlertAction(title: "OK", style: .Default,
                    handler: { (UIAlertAction) in
                        print("wrong")
                        
                })
                
                alert.addAction(okAction)
                
                self.presentViewController(alert, animated:true, completion:nil)
                
            }
        }
        
    }
    
    @IBAction func editingChanged(sender: AnyObject) {
        if inputEmail.text!.isEmpty || inputPassword.text!.isEmpty {
            loginButton.enabled = false
        }
        else {
            loginButton.enabled = true
        }
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
