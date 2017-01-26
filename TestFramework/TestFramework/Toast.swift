//
//  Toast.swift
//  TestFramework
//
//  Created by Salomé Russier on 25/01/2017.
//  Copyright © 2017 Salomé Russier. All rights reserved.
//

import Foundation
import UIKit

open class Toast : UIView {
    
    var title: UILabel
    
    convenience init(frame: CGRect, title: String) {
        self.init(frame: frame)
        self.title.text = title
        self.title.textColor = .black
        self.backgroundColor = .red
        self.title.text = "yolo"

    }
    
    
    convenience init( title: String, view: UIView) {
        self.init(frame: CGRect(x:20.0, y:view.frame.size.height-80, width:view.frame.size.width-40, height:60))
        
        self.title.text = title
        self.title.textColor = .black
        self.backgroundColor = .red
        self.title.text = title
        
    }
    
    override init(frame: CGRect) {
        self.title = UILabel.init(frame: CGRect(x:0.0, y:0.0, width:frame.size.width, height:frame.size.height))
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("CircleView is not NSCoding compliant")
    }
    
    //fonction changement couleur background
    
    //fonction choix icone
    

}
