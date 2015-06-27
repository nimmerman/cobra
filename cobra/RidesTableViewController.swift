//
//  RidesTableViewController.swift
//  cobra
//
//  Created by Nathan Immerman on 6/27/15.
//  Copyright (c) 2015 Nathan Immerman. All rights reserved.
//

import UIKit

class RidesTableViewController: UITableViewController, GMBLPlaceManagerDelegate, GMBLCommunicationManagerDelegate {
    
    var rides = [Ride]()
    var ridesNearYou = [Ride]()
    var placeManager : GMBLPlaceManager!
    var commManager : GMBLCommunicationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        Gimbal.setAPIKey("8bd8e578-9613-4df7-b247-45f48a532b0f", options: nil)
        
        placeManager = GMBLPlaceManager()
        commManager = GMBLCommunicationManager()
        placeManager.delegate = self
        commManager.delegate = self
        
        GMBLPlaceManager.startMonitoring()
        
        var newRide = Ride(name: "Rollercoaster")
        rides.append(newRide)
        newRide = Ride(name: "Merry Go Round")
        rides.append(newRide)
        newRide = Ride(name: "Bumper Cars")
        rides.append(newRide)
        newRide = Ride(name: "Water Slide")
        rides.append(newRide)
        newRide = Ride(name: "Baby Roller Coaster")
        rides.append(newRide)
    }
    
    
    func placeManager(manager: GMBLPlaceManager!, didBeginVisit visit: GMBLVisit!) {
        println("didBeginVisit: \(visit.place.name), at: \(visit.arrivalDate)")
        ridesNearYou.append(Ride(name: visit.place.name))
        self.tableView.reloadData()
        for element in ridesNearYou {
            println(element.name)
        }
    }
    
    func placeManager(manager: GMBLPlaceManager!, didEndVisit visit: GMBLVisit!) {
        println("didEndVisit: \(visit.place.name), at: \(visit.departureDate)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Rides Near You"
        }
        else {
            return "Other Rides"
        }
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        if section == 0 {
            return ridesNearYou.count
        }
        else {
            return rides.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        

        if indexPath.section == 0 {
            var ride = ridesNearYou[indexPath.row]
            cell.textLabel?.text = ride.name
        }
        else {
            var ride = rides[indexPath.row]
            cell.textLabel?.text = ride.name
        }
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        var rideDetails = segue.destinationViewController as! RidesViewController
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            rideDetails.currRide = rides[indexPath.row]
        }
    }


}
