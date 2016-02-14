//
//  ViewController.swift
//  ConnectedColors
//
//  Created by Ralf Ebert on 28/04/15.
//  Copyright (c) 2015 Ralf Ebert. All rights reserved.
//

import UIKit
import XCDYouTubeKit
import MultipeerConnectivity

class FifthViewController: UIViewController {
    var videoPlayerViewController = XCDYouTubeVideoPlayerViewController()
    let colorService = ColorServiceManager()
    
    @IBOutlet weak var Connection: UILabel!
    @IBOutlet weak var search: UITextField!
    
    var cellVideo: Video?
    var video: [Video] = [Video]()
    var model = VideoModel()
    var disCon = ColorServiceManager().session
//    var timer, timer2: NSTimer!
//    var date: NSDate?
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func searchTextEnd(sender: AnyObject) {
        print(self.search.text!)
        
        if let searchBar = self.search.text {
            self.model.search = searchBar
            print("the search var is \(searchBar)")
        }
//        self.date = NSDate(timeIntervalSinceNow: 5)
//        print(self.date)
        // getVideo callback to call the finish
        self.model.getVideo { () -> Void in
            self.finish()
            
        }
    }
    
    // Create the View and the VideoPlayer for YouTube videos
    func finish() {
        self.defaults = NSUserDefaults.standardUserDefaults()
        let videoArray = self.defaults.objectForKey("videoArray")
        if let video = videoArray?.objectAtIndex(0) as? String {
            print(video)
            
            colorService.sendColor(video)
            
            // Setting width and hight + add new View for VideoPlayer
            let width = self.view.frame.size.width
            let height = width / 320 * 180
            let videoView = UIView(frame: CGRectMake(0, height / 4.0, width, height))
            self.view.addSubview(videoView)
            
            // YouTube VideoPlayer
            videoPlayerViewController = XCDYouTubeVideoPlayerViewController(videoIdentifier: video)
            videoPlayerViewController.presentInView(videoView)
            videoPlayerViewController.moviePlayer.play()
//            timer.fireDate = date!
            }
        else
        {
            print("there is nothing to set on web view")
            print(self.cellVideo)
        }
    }
    
    func playVideo(colorString: String)
    {
        // Setting width and hight + add new View for VideoPlayer
        let width = self.view.frame.size.width
        let height = width / 320 * 180
        let videoView = UIView(frame: CGRectMake(0, height / 4.0, width, height))
        self.view.addSubview(videoView)
        
        // YouTube VideoPlayer
        videoPlayerViewController = XCDYouTubeVideoPlayerViewController(videoIdentifier: colorString)
        videoPlayerViewController.presentInView(videoView)
        videoPlayerViewController.moviePlayer.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorService.delegate = self
        self.Connection.text = ""
//        timer = NSTimer.init(timeInterval: 0.0, target: self, selector: Selector(update()), userInfo: nil, repeats: false)
//        timer2 = NSTimer.init(timeInterval: 0.0, target: self, selector: Selector(update2()), userInfo: nil, repeats: false)
        // if there is something playing on other device
    }
    
//    func update()
//    {
//        videoPlayerViewController.moviePlayer.play()
//    }
//    func update2()
//    {
//        videoPlayerViewController.moviePlayer.play()
//    }
//    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        videoPlayerViewController.moviePlayer.stop()
        self.disCon.disconnect()
    }
    
}

extension FifthViewController : ColorServiceManagerDelegate {
    func connectedDevicesChanged(manager: ColorServiceManager, connectedDevices: [String]) {
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
            self.Connection.text = ("Connections: \(connectedDevices)")
        }
    }
    
    func colorChanged(manager: ColorServiceManager, colorString: String) {
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
//            self.timer2.fireDate = self.date!
//            print(self.date!)
            if (self.videoPlayerViewController.moviePlayer.playbackState == MPMoviePlaybackState.Playing) {
                self.videoPlayerViewController.moviePlayer.stop()
            }
            self.playVideo(colorString)
        }
    }
    
}

