//
//  ViewController.swift
//  ConnectedColors
//
//  Created by Ralf Ebert on 28/04/15.
//  Copyright (c) 2015 Ralf Ebert. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
    
    @IBOutlet var newTitle: UILabel!
    @IBOutlet var Channel: UILabel!
    let colorService = newSongManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorService.delegate = self
    }
    
}

extension FifthViewController : ColorServiceManagerDelegate {
    
    func connectedDevicesChanged(manager: newSongManager, connectedDevices: [String]) {
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
        }
    }
    
    func songChanged(manager: newSongManager, videoID: String) {
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
            // play video on other device

            }
        }
    }
    
