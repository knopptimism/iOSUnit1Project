//
//  PickImageViewController1.swift
//  iOSUnit1Build
//
//  Created by Jeremiah Knopp, assisted by Mirza Pasalic, on 2/5/20.
//  Copyright © 2020 Eldritch Design. All rights reserved.
//

import UIKit




class PickImageViewController1: UIViewController, ImagePickerDelegate {
    // ImagePickerDelegate Method. This is what sets the image chosen by the user in memory to be messed with.
    func didSelect(image: UIImage?) {
      self.imageView.image = image
        // Unwraps the optional UIImage (image)
      if let value = image {
        // Appends the image to the public array in HelperFile.
        imageArray.append(value)
      }
    }

    // The outlet connecting the UIImageview to code.
    @IBOutlet var imageView: UIImageView!
    
    // Expicitly forces an instance of ImagePicker to the variable imagePicker to be messed with.
    var imagePicker: ImagePicker!
    
    // Loads the picker when the page is loaded.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        // Do any additional setup after loading the view.
        }
    
    // What happens when you press "Add Photo".
    @IBAction func showImagePicker(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
        }
    
    // Let's us unwind the app.
    @IBAction func restartApp(_ unwindSegue: UIStoryboardSegue) {
        imageArray = []
        self.imageView.image = nil
        
    }

    
   
}







