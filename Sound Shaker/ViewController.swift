//
//  ViewController.swift
//  Sound Shaker
//
//  Created by remy on 6/9/15.
//  Copyright (c) 2015 LiquidGroup. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    var soundEffects = ["bean", "belch", "giggle", "pew", "pig", "snore", "static", "uuu"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        
        if event.subtype == UIEventSubtype.MotionShake {

            var randomNumber = Int(arc4random_uniform(UInt32(soundEffects.count)))
            
            var fileLocation = NSBundle.mainBundle().pathForResource(soundEffects[randomNumber], ofType: "mp3")
            
            var error: NSError? = nil
            
            player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!), error: &error)
            
            player.play()
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

