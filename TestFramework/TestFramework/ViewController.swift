//
//  ViewController.swift
//  TestFramework
//
//  Created by Salomé Russier on 25/01/2017.
//  Copyright © 2017 Salomé Russier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Toast.shared.warningToast(message: "azerty azerty azerty azerty azerty azerty azerty azerty azerty azerty azerty azerty azerty azerty azerty azerty azerty azerty ", viewMain: self.view, duration: .long, position: .center,sound: true)
    
       Toast.shared.simpleToast(message: "message test", viewMain: self.view, duration: .long, position: .center, sound: true)

    }

}

