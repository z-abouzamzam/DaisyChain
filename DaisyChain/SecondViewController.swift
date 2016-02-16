//
//  SecondViewController.swift
//  DaisyChain
//
//  Created by Kevin Wu on 2/13/16.
//  Copyright © 2016 Zafir Abou-Zamzam. All rights reserved.
//


import UIKit
// import mediaplayer
let secondColor = UIColor.blackColor().CGColor

class SecondViewController: UIViewController {

    @IBOutlet var Join: UIButton!
    @IBOutlet var Host: UIButton!
    override func viewDidAppear(animated: Bool) {

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        Host.layer.cornerRadius = 10
        Join.layer.cornerRadius = 10
        Host.layer.borderWidth = 1
        Join.layer.borderWidth = 1
        Join.layer.borderColor = secondColor
        Host.layer.borderColor = secondColor
    }
    
}
