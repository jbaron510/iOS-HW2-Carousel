//
//  timeLineViewController.swift
//  iOS-HW2-Carousel
//
//  Created by Jon Baron on 10/19/15.
//  Copyright © 2015 Walmart. All rights reserved.
//

import UIKit

class timeLineViewController: UIViewController {

    @IBOutlet weak var timeLineScroll: UIScrollView!
    
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var conversationsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        timeLineScroll.contentSize = CGSize(width: 320, height:1564)

        
        
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
