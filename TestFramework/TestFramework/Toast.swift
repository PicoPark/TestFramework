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
    }
    
    override init(frame: CGRect) {
        self.title = UILabel.init(frame: CGRect(x:0.0, y:0.0, width:frame.size.width, height:frame.size.height))
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("CircleView is not NSCoding compliant")
    }}
