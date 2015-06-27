//
//  RidesViewController.swift
//  cobra
//
//  Created by Nathan Immerman on 6/27/15.
//  Copyright (c) 2015 Nathan Immerman. All rights reserved.
//

import UIKit

class RidesViewController: UIViewController {
    
    var currRide : Ride?
    @IBOutlet weak var nameOfCurrRide: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameOfCurrRide.text = currRide!.name
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
