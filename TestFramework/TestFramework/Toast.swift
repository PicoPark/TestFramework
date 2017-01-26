//
//  Toast.swift
//  TestFramework
//
//  Created by Salomé Russier on 25/01/2017.
//  Copyright © 2017 Salomé Russier. All rights reserved.
//

import Foundation
import UIKit

open class Toast {
    
    static var shared = Toast()
    
    var view: UIView!
    
    var title: UILabel!
    
    
    private func createToast(message: String, frame: CGRect, type: ToasType) -> UIView {
//        self.view = UIView(frame: frame)
//        self.view.backgroundColor = .clear
        
        self.title = UILabel(frame: frame)
        self.title.textAlignment = .center
        self.title.text = message
        self.title.textColor = UIColor.black
        
        switch type {
        case .warning:
            self.title.backgroundColor = .yellow
            
        case .danger:
            self.title.backgroundColor = .red
            
        case .info:
            self.title.backgroundColor = .blue
        }
        
        self.title.layer.cornerRadius = 10
        self.title.layer.masksToBounds = true
        
        return self.title
    }
    
    
    
    func warningToast(frame: CGRect, message: String) -> UIView {
        return self.createToast(message: message, frame: frame, type: .warning)
    }
    
    func infoToast(frame: CGRect, message: String) {
        let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDel.window?.rootViewController?.view.addSubview(self.createToast(message: message, frame: frame, type: .info))
        
//        UIApplication.shared.keyWindow?.rootViewController?.view.addSubview(self.createToast(message: message, frame: frame, type: .info))
    }
    
    func dangerToast(frame: CGRect, message: String) -> UIView {
        return self.createToast(message: message, frame: frame, type: .danger)
    }
    
    private init() {
        self.view = UIView()
        self.title = UILabel()
    }
    
    
//    init(message: String, view: UIView) {
//        super.init(frame: CGRect(x:20.0, y:view.frame.size.height-80, width:view.frame.size.width-40, height:60))
//        self.title.center = CGPoint(x: 160, y: 285)
//        self.title.textAlignment = .center
//        self.title.text = message
//        self.backgroundColor = .red
//
//    }
    
//    convenience init(frame: CGRect, title: String) {
//        self.init(frame: frame)
//        self.title.text = title
//        self.title.textColor = .black
//        self.backgroundColor = .red
//        self.title.text = "yolo"
//
//    }
//    
//    
//    
//    
//    
//    convenience init( title: String, view: UIView) {
//        self.init(frame: CGRect(x:20.0, y:view.frame.size.height-80, width:view.frame.size.width-40, height:60))
//        
//        self.title.text = title
//        self.title.textColor = .black
//        self.backgroundColor = .red
//        self.title.text = title
//        
//        
//    }
////    
//    override init(frame: CGRect) {
//        self.title = UILabel.init(frame: CGRect(x:20.0, y:0, width:frame.size.width, height:frame.size.height))
//        self.title.text = "yolo"
//        super.init(frame: frame)
//    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("CircleView is not NSCoding compliant")
    }
    
    //fonction changement couleur background
    
    //fonction choix icone
    

}

enum ToasType {
    case info, danger, warning
}
