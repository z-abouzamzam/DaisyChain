//
//  Third.swift
//  DaisyChain
//
//  Created by Kevin Wu on 2/14/16.
//  Copyright © 2016 Zafir Abou-Zamzam. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let newSong = newSongManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newSong.delegate = self
        cells.removeAll()
        cells.append(defaults! as! String)
    }
    
    /*
    search engine action
    {
        // play video on own device
        self.changeColor(UIColor.redColor())
        // send video id as string
        newSong.sendSong("red")
        // sends red to be called in client phones from code below
    }
    */
    
}

extension ThirdViewController : ColorServiceManagerDelegate {
    
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

    

