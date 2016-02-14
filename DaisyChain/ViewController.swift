//
//  ViewController.swift
//  DaisyChain
//
//  Created by Zafir Abou-Zamzam on 2/13/16.
//  Copyright © 2016 Zafir Abou-Zamzam. All rights reserved.
//

import UIKit
import MediaPlayer
let newColor = UIColor.whiteColor().CGColor
var defaults = NSUserDefaults.standardUserDefaults().objectForKey("userName")

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var goButton: UIButton!
    @IBOutlet var State: UITextField!
    @IBOutlet var Name: UITextField!
    @IBOutlet var Error: UILabel!
    @IBAction func Go(sender: AnyObject)
    {
        if State.text == "" || Name.text == ""
        {
            Error.text = "Please fill in both boxes"
        }
        if State.text != "" && Name.text != ""
        {
            Error.text = ""
            defaults = State.text! + "." + Name.text!
            NSUserDefaults.standardUserDefaults().setObject(defaults, forKey: "userName")
            // NSUserDefaults.standardUserDefaults().synchronize()
                // forces save to disk since nsusedefaults saves in background
                // saves in main thread - thus could freeze UI momentarily
            print(defaults!)
            self.performSegueWithIdentifier("TurnUp", sender: UIButton())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let placeholder = NSAttributedString(string: "Alan Smithee", attributes: [NSForegroundColorAttributeName:UIColor.grayColor()])
        let placeholder1 = NSAttributedString(string: "New York", attributes: [NSForegroundColorAttributeName:UIColor.grayColor()])
        State.layer.cornerRadius = 10
        Name.layer.cornerRadius = 10
        State.layer.borderWidth = 1
        Name.layer.borderWidth = 1
        State.layer.borderColor = newColor
        Name.layer.borderColor = newColor
        State.attributedPlaceholder = placeholder1
        Name.attributedPlaceholder = placeholder
        goButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view, typically from a nib.
        self.State.delegate = self
        self.Name.delegate = self
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
        // closes keyboard if tapped outside
    {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(TextField: UITextField) -> Bool
    {
        TextField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        UIView.animateWithDuration(0.25) { () -> Void in
        self.view.frame.origin.y = self.view.frame.origin.y - 100
        }
    }
    func textFieldDidEndEditing(textField: UITextField) {
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        UIView.animateWithDuration(0.25) { () -> Void in
        self.view.frame.origin.y = self.view.frame.origin.y + 100
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

