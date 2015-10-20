//
//  signInViewController.swift
//  iOS-HW2-Carousel
//
//  Created by Jon Baron on 10/16/15.
//  Copyright © 2015 Walmart. All rights reserved.
//

import UIKit

class signInViewController: UIViewController {

    @IBOutlet weak var signInScrollView: UIScrollView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButtonView: UIView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signInLoadingIndicator: UIActivityIndicatorView!
    
    
    var initialYScrollView: CGFloat!
    let scrollViewOffset: CGFloat = -85
    
    var initialYButtonView: CGFloat!
    let buttonViewOffset: CGFloat = -275
    
    
//    let alertController = UIAlertController(title: "Whoa Nelly!", message: "Make sure to enter your email address and password!", preferredStyle: .Alert)
    
    // create an OK action to use in alert controllers
    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
        // handle response here.
    }
    
    // alertController.addAction(OKAction)

    
    
    func keyboardWillShow(notification:
        NSNotification!) {
            
            var userInfo = notification.userInfo!
            
            // Get the keyboard height and width from the notification
            // Size varies depending on OS, language, orientation
            var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
            var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
            var animationDuration = durationValue.doubleValue
            var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
            var animationCurve = curveValue.integerValue
            
            UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
                
                // Set view properties in here that you want to match with the animation of the keyboard
                // If you need it, you can use the kbSize property above to get the keyboard width and height.
                
                self.signInScrollView.frame.origin = CGPoint(x: self.signInScrollView.frame.origin.x, y: self.initialYScrollView + self.scrollViewOffset)
                
                self.signInButtonView.frame.origin = CGPoint(x: self.signInButtonView.frame.origin.x, y: self.initialYButtonView + self.buttonViewOffset)
                
                self.signInScrollView.contentOffset.y = 0
                
                
                }, completion: nil)
    }
    
    
    func keyboardWillHide(notification: NSNotification!) {
        
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
            
            self.signInScrollView.frame.origin = CGPoint(x: self.signInScrollView.frame.origin.x, y: self.initialYScrollView)
            
            self.signInButtonView.frame.origin = CGPoint(x: self.signInButtonView.frame.origin.x, y: self.initialYButtonView)
            
            
            
            }, completion: nil)
        
        
    }


    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
    @IBAction func onFieldTap(sender: AnyObject) {
        
            //scroll the sign in view to the top when email or PW fields are tapped
        
            signInScrollView.contentOffset.y = 186
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
    
        // tapping in a blank area (on the tap gesture recognizer) signals an end to editing and dismisses the keyboard
        
        signInScrollView.endEditing(true)
        
    
    }
    
    @IBAction func signIn(sender: AnyObject) {
        
        // empty field error
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
        
            let alertController = UIAlertController(title: "Whoa Nelly!", message: "Make sure to enter your email address and password!", preferredStyle: .Alert)

            alertController.addAction(OKAction)
            
            presentViewController(alertController, animated: true) {
            
                // optional code for what happens after the alert controller has finished presenting
            }

        }
        
        
        //correct password
        else if emailTextField.text == "jb" && passwordTextField.text == "pass" {

            
            self.signInLoadingIndicator .startAnimating()
            
            // Delay for 2 seconds, then run the code between the braces.
            delay(2) {
                self.signInLoadingIndicator .stopAnimating()
                
                // code to sign in goes here
                self.performSegueWithIdentifier("signInSegue", sender: nil)
            }

            
            
        }
        
        
        //incorrect password
        else {

            self.signInLoadingIndicator .startAnimating()
            
            // Delay for 2 seconds, then run the code between the braces.
            delay(2) {
                self.signInLoadingIndicator .stopAnimating()

                let alertController = UIAlertController(title: "Sorry, no dice!", message: "You're either bogus or a bad typist.", preferredStyle: .Alert)
                
                alertController.addAction(self.OKAction)
                
                self.presentViewController(alertController, animated: true) {

                
                }
            }
            
            
            
        }
    
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        signInScrollView.contentSize = CGSize(width: 310, height:186)

        signInLoadingIndicator .stopAnimating()
        

        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        //set the intial Y locations of the scrollview and the login button
        
        initialYScrollView = signInScrollView.frame.origin.y
        initialYButtonView = signInButtonView.frame.origin.y

        

        
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
