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
        let toastView = Toast(title: "yolo", view: self.view)
        self.view.addSubview(toastView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

