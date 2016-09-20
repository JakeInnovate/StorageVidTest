//
//  ViewController.swift
//  FirebaseVideoStorageTest
//
//  Created by Jake Hardy on 9/15/16.
//  Copyright © 2016 NSDesert. All rights reserved.
//

import UIKit
import Firebase
import AVKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let litStorage = FIRStorage.storage()
        let storageRef = litStorage.referenceForURL("gs://nsustoragetest.appspot.com")
        let firRef = storageRef.child("/NAS.mp4")
        
        FirebaseStorageController.downloadFromFIRRefToLocalURL(firRef, fileName: "NAS.mp4") { (URL) in
            self.playVideoFromURL(URL)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func playVideoFromURL(URL: NSURL?) {
        let player = AVPlayer(URL: URL!)
        let playerController = AVPlayerViewController()
        playerController.player = player
        presentViewController(playerController, animated: true) {
            player.play()
        }
    }

}

