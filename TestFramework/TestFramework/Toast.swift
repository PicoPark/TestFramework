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
    
    var imageV: UIImageView
    let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate

    
    
    private func createToast(message: String, MainView: UIView,type: ToasType, duration: ToastDuration, img: UIImage?) -> UIView {

        if img == nil {
            self.title = UILabel(frame: CGRect(x:20.0, y:(MainView.frame.size.height)-80, width:(MainView.frame.size.width)-40, height:60))
        } else {
            self.title = UILabel(frame: CGRect(x:20.0, y:(MainView.frame.size.height)-80, width:(MainView.frame.size.width)-40, height:160))
//            self.imageV = UIImageView(frame: CGRect(x:20.0, y:(MainView.frame.size.height)-160, width:(MainView.frame.size.width)-40, height:60))
            self.imageV = UIImageView(image: img)
            self.imageV.frame = CGRect(x:20.0, y:(MainView.frame.size.height)-500, width:(img?.size.width)!, height:(img?.size.height)!)
        }
        
        self.title.textAlignment = .center
        self.title.layer.cornerRadius = 8
        self.title.layer.masksToBounds = true
        
        
        
        switch type {
            case .warning:
                self.title.backgroundColor = .yellow
                self.title.textColor = .black
                self.title.text = "⚠️ " + message

            
            case .danger:
                self.title.backgroundColor = .red
                self.title.textColor = .white
                self.title.text = "⚠️ " + message

            
            case .info:
                self.title.backgroundColor = .blue
                self.title.textColor = .white
                self.title.text = "ℹ️ " + message

        }
        
        switch duration {
            case .long:
                UIView.animate(withDuration: 1.0, delay: 6.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                    self.title.alpha = CGFloat(0.0)
                    }, completion: nil)
            
            case .short:
                UIView.animate(withDuration: 1.0, delay: 3.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                    self.title.alpha = CGFloat(0.0)
                }, completion: nil)
        }
        
        let finalView = UIView()
        finalView.addSubview(self.title)
        finalView.addSubview(self.imageV)
        return finalView
    }
    
    func imageToast(message: String, viewMain:UIView, duration: ToastDuration, img: UIImage){
        viewMain.addSubview(self.createToast(message: message, MainView: viewMain,type: .warning,duration: duration, img: img))
    }

    func warningToast( message: String, viewMain:UIView, duration: ToastDuration)  {
      viewMain.addSubview(self.createToast(message: message, MainView: viewMain,type: .warning,duration: duration, img: nil))
    }
    
    func infoToast(message: String,viewMain:UIView, duration: ToastDuration) {
       viewMain.addSubview(self.createToast(message: message, MainView: viewMain,type: .info,duration: duration, img: nil))
    }
    
    func dangerToast( message: String,viewMain:UIView, duration: ToastDuration)  {
        viewMain.addSubview(self.createToast(message: message , MainView: viewMain, type: .danger,duration: duration, img: nil))
    }
    
    private init() {
        self.view = UIView()
        self.title = UILabel()
        self.imageV = UIImageView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("CircleView is not NSCoding compliant")
    }
    
    

}
// Listing des variables

enum ToasType {
    case info, danger, warning
}
enum ToastDuration {
    case long, short
}
