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
    let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate

    
    
    private func createToast(message: String, type: ToasType) -> UIView {
//        self.view = UIView(frame: frame)
//        self.view.backgroundColor = .clear

        self.title = UILabel(frame: CGRect(x:20.0, y:(appDel.window?.rootViewController?.view.frame.size.height)!-80, width:(appDel.window?.rootViewController?.view.frame.size.width)!-40, height:60))
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
    
    

    func warningToast( message: String)  {
        appDel.window?.rootViewController?.view.addSubview(self.createToast(message: message, type: .warning))
    }
    
    func infoToast(message: String) {
        appDel.window?.rootViewController?.view.addSubview(self.createToast(message: message, type: .info))
        
    }
    
    func dangerToast(frame: CGRect, message: String)  {
        appDel.window?.rootViewController?.view.addSubview(self.createToast(message: message , type: .danger))
    }
    
    private init() {
        self.view = UIView()
        self.title = UILabel()
        

    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("CircleView is not NSCoding compliant")
    }
    
    

}

enum ToasType {
    case info, danger, warning
}
