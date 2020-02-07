//
//  PickImageViewController2.swift
//  iOSUnit1Build
//
//  Created by Jeremiah Knopp, assisted by Mirza Pasalic, on 2/5/20.
//  Copyright © 2020 Eldritch Design. All rights reserved.
//

import UIKit

class PickImageViewController2: UIViewController, ImagePickerDelegate {
    
    // ImagePickerDelegate method
    func didSelect(image: UIImage?) {
        self.imageView.image = image
        // Unwraps the optional UIImage (image)
        if let value = image {
            // Appends image to public array. 
            imageArray.append(value)
        }

    }

    // The outlet connecting the UIImageView to code.
    
    @IBOutlet var imageView: UIImageView!
    
    // Binds an instance of the ImagePicker class to a variable.
    var imagePicker: ImagePicker!

    // Calls imagePicker when VC is first called.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
           // Do any additional setup after loading the view.
       }
    
    // Called when you press the "Add Photo" button.
    
    @IBAction func showImagePicker(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
    
}
       


