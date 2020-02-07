//
//  HammingDistanceCalculatorViewController.swift
//  iOSUnit1Build
//
//  Created by Jeremiah Knopp, assisted by Mirza Pasalic, on 2/6/20.
//  Copyright © 2020 Eldritch Design. All rights reserved.
//

import UIKit

class HammingDistanceCalculatorViewController: UIViewController {
    
    // Connects the label that will show the Hamming Distance
    @IBOutlet weak var hamNum: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showText()

        // Do any additional setup after loading the view.
    }
    

    // Raises the hamNum Label with the start of the screen.
    func showText() {
        self.hamNum.text = calculateHammingNum()
    }

    

}
