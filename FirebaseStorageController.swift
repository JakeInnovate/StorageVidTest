//
//  FirebaseStorageController.swift
//  FirebaseVideoStorageTest
//
//  Created by Jake Hardy on 9/19/16.
//  Copyright © 2016 NSDesert. All rights reserved.
//

import Foundation
import Firebase


// TODO 
// Add download status capability
// <><><><><> Add upload status capability <><><><><>
// <><><><><> Better error handling <><><><><>


class FirebaseStorageController {
    static func downloadFromFIRRefToLocalURL(fireRef: FIRStorageReference,
                                             fileName: String,
                                             completion: (URL: NSURL?) -> Void) {
        let directoryPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = directoryPaths[0]
        let filePath = "file:\(documentsDirectory)/\(fileName)"
        // Download to the local filesystem
        guard let fireURL = NSURL(string: filePath)
            else { completion(URL: nil) ; return }
        fireRef.writeToFile(fireURL) { (URL, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
                print("In Error!")
                completion(URL: nil)
            } else {
                completion(URL: URL)
            }
        }
    }
    
    static func uploadToFIRRefFromLocalURL(fireRef: FIRStorageReference,
                                           localFile: NSURL,
                                           completion: (success: Bool) -> Void) {
        fireRef.putFile(localFile, metadata: nil) { metadata, error in
            if let error = error {
                print(error.localizedDescription)
                completion(success: false)
            } else {
//                May need to refactor for URL storage
//                let downloadURL = metadata!.downloadURL
                completion(success: true)
            }
        }
        
        
    }
    
    
    
}