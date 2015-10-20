//
//  tutorialViewController.swift
//  iOS-HW2-Carousel
//
//  Created by Jon Baron on 10/19/15.
//  Copyright © 2015 Walmart. All rights reserved.
//

import UIKit

class tutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var tutorialScrollView: UIScrollView!
    
    @IBOutlet weak var tutorialPageControl: UIPageControl!
    
    @IBOutlet weak var timeLineButton: UIButton!
    

    
    func scrollViewDidEndDecelerating(tutorialScrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(tutorialScrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        tutorialPageControl.currentPage = page
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        tutorialScrollView.delegate = self
        
        tutorialScrollView.contentSize = CGSize(width: 1280, height:568)
        

        
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
