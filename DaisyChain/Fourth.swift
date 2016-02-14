//
//  FourthViewController.swift
//  DaisyChain
//
//  Created by Kevin Wu on 2/13/16.
//  Copyright © 2016 Zafir Abou-Zamzam. All rights reserved.
//

import UIKit
var cells = ["kitten"]

class FourthViewController: UIViewController, UITableViewDelegate  {

    // fills with data from server
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cells.count
            // creates a table of the numder of indexes
            // runs the func below three times
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = cells[indexPath.row]
            // the row of the indexpath dicate which index of cell to call
        return cell
            // defines the table sections created above
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(cells[indexPath.row])
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
