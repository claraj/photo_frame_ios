//
//  PhotoStore.swift
//  PhotoFrame
//
//  Created by student1 on 2/17/19.
//  Copyright © 2019 clara. All rights reserved.
//

import Foundation
import UIKit

class PhotoStore {
    
    // Create a URL where the image file will be saved.
    // This class only writes to one file, so can only store one image.
    let imageURL: URL = {
        let imageFilename = "hello_camera"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectory.first!
        return documentDirectory.appendingPathComponent(imageFilename)
    }()
    
    // Save image to disk
    func savePhoto(image: UIImage) {
        if let data = image.jpegData(compressionQuality: 1) {  // 0 is lowest, 1 is highest quality
            try? data.write(to: imageURL, options: [.atomic])  
        }
    }
    
    func getPhoto() -> UIImage? {
        guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path) else {
            return nil
        }
        return imageFromDisk
    }
}
