//
//  HelperFile.swift
//  iOSUnit1Build
//
//  Created by Jeremiah Knopp, assisted by Mirza Pasalic, on 2/6/20.
//  Copyright © 2020 Eldritch Design. All rights reserved.
//

import Foundation
import UIKit

// Holds images to be compared.
public var imageArray: [UIImage] = []

/*
 Calculates the number of times individual bytes/pixels? don't match up between two strings.

If they're the same image, thus a duplicate, there's a string returned to the user letting them know.
 */
public func calculateHammingNum() -> String {
    
    // Values derived from the function in the extension of UIImage at the bottom of this file.
    let pixels1 = imageArray[0].pixelData()
    let pixels2 = imageArray[1].pixelData()

    // Keeps track of the total comparisons made. By nature, this value is the size of the larger image.
    var totalCount = 0
    
    // Keeps track of the indivdual times the files differ. AKA the "Hamming Distance" - the index for index distance between two images.
    var count1 = 0
    
    // Used to keep count against the size of the smaller value
    var indexCount = 0
    
    // Returns a string telling the user that the images are identical, if they are.
    if pixels1.count == pixels2.count {
        return "Oops! These images are duplicates!"
    }
    else {
        // Checks if image1 is greater than image2
        if pixels1.count > pixels2.count {
        
/*
        These next two lines add the count of absolute variation - AKA the difference that arises from being differently sized images - to the totalCount and count counters.
*/
        count1 += (pixels1.count - pixels2.count)
        totalCount += (pixels1.count - pixels2.count)
        
        // While loop that keeps us from going out of range of the smaller file.
        while indexCount < (pixels2.count - 1) {
            
            // Gives us the objective index being checked.
            for index in 0...(pixels2.count - 1) {
                
                // Indivdual units of pixel data to be compared
                let pixel1 = pixels1[index]
                let pixel2 = pixels2[index]
                
                // Compares the two pixels and alters the counters based on that info.
                if pixel1 != pixel2 {
                    count1 += 1
                    totalCount += 1
                    indexCount += 1
                } else {
                    totalCount += 1
                    indexCount += 1
                }
            }
        }
        
    }
        else {
        
        // The loop that starts when the second file is larger.
            
        // Adds the difference that arises out of size to the counts.
        count1 += (pixels2.count - pixels1.count)
        totalCount += (pixels2.count - pixels1.count)
        
        // While loop that keeps OOI errors from popping up.
        while indexCount < (pixels1.count - 1) {
            
            // index range in line with indexes of pixels2
            for index in 0...(pixels1.count - 1) {
                
                // Allows for the individual comparison of two pixels in this loop.
                let pixel1 = pixels1[index]
                let pixel2 = pixels2[index]
                
                // Checks if the pixels are the same and adjusts the count appropriately.
                if pixel2 != pixel1 {
                    count1 += 1
                    totalCount += 1
                    indexCount += 1
                } else {
                    totalCount += 1
                    indexCount +=  1
                }
            }
        }
    }
}
    // After the rest of the function, returns the Hamming Distance between the two image objects.
    let difference = totalCount - count1
    indexCount = 0
    totalCount = 0
    count1 = 0
    
    return String(difference)
}

/*
Let's us easily derive a UInt8 representation of a UIImage. This was actually a banger pain in the butt to figure out because I didn't know what to google for.
 
 I believe that is a class method. But what do I know?
 
 Found @ (https://stackoverflow.com/questions/33768066/get-pixel-data-as-array-from-uiimage-cgimage-in-swift)
 */


// Can someone tell me what Core Graphics is doing here? Aside from helping me getting a [UInt8] that I can mess around with?
extension UIImage {
    
    func pixelData() -> [UInt8] {
       let size = self.size
       let dataSize = size.width * size.height * 4
       var pixelData = [UInt8](repeating: 0, count: Int(dataSize))
       let colorSpace = CGColorSpaceCreateDeviceRGB()
       let context = CGContext(data: &pixelData,
                               width: Int(size.width),
                               height: Int(size.height),
                               bitsPerComponent: 8,
                               bytesPerRow: 4 * Int(size.width),
                               space: colorSpace,
                               bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue)
       guard let cgImage = self.cgImage else { return [] }
       context?.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))

       return pixelData
   }
}

