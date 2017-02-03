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
//        view.backgroundColor = UIColor.clear
//        view.isOpaque = false
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
//        label.center = CGPoint(x: 160, y: 285)
//        label.textAlignment = .center
//        label.backgroundColor = .red
//        label.text = "I'am a test label"
        
        Toast.shared.imageToast( message: "BaaaaaaaisousBaaaaaaaisousBaaaaaaaisousBaaaaaaaisousBaaaaaaaisousBaaaaaaaisous", viewMain: self.view,duration: .long, img: UIImage(named: "5004497_orig.png")!)
//        Toast.shared.warningToast(message: "NooBaaaaaaaaaa aaaaaaaaaaaa aaaaaaaaaaaa aaaaaaaaaaaa aaaaaaaaaaaaaa aaaaaaaaaaaaaa aaaaaaaaaaaaaa aaaaaaaaaaaaaa aaaaaaaaaaaaaa aaaaaaaaaaaaaa aaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaa aaaaaaaaaaaaaa aaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaisouson", viewMain: self.view, duration: .short)
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

