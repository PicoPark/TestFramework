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
    
    var imageSize = CGSize(width: 80.0, height: 80.0)

    
    
    private func createToast(message: String, MainView: UIView,type: ToasType, duration: ToastDuration, img: UIImage?, position: ToastPosition) -> UIView {
        
        var finalView = UIView()
        finalView.frame = MainView.frame

        if img == nil {
            self.title = UILabel(frame: CGRect(x: toastPosition(position: position, view: finalView).x, y: toastPosition(position: position, view: finalView).y, width:(MainView.frame.size.width)-40, height:60.0))
//            if message.characters.count < 20 {
//                self.title = UILabel(frame: CGRect(x:20.0, y:(MainView.frame.size.height)-80, width:(MainView.frame.size.width)-40, height:60))
//                
//            } else if message.characters.count > 20 {
//                self.title = UILabel(frame: CGRect(x:20.0, y:(MainView.frame.size.height)-120, width:(MainView.frame.size.width)-40, height:100))
//            }else{
//                
//            }
            finalView.addSubview(self.title)
            self.title.lineBreakMode = .byWordWrapping
            self.title.numberOfLines = 0
        } else {
            finalView.addSubview(self.imageV)
            finalView.addSubview(self.title)
            
            self.title = UILabel(frame: CGRect(x:20.0, y:(MainView.frame.size.height)-120, width:(MainView.frame.size.width)-40, height:100))
            self.imageV = UIImageView(image: img)
            self.imageV.frame = CGRect(x:20.0, y:(MainView.frame.size.height)-300, width:(img?.size.width)!, height:(img?.size.height)!)
            self.imageV.translatesAutoresizingMaskIntoConstraints = false
            self.imageV.centerXAnchor.constraint(equalTo: finalView.centerXAnchor).isActive = true
            
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
        
        
        
        
//        finalView.addSubview(self.title)
//        finalView.addSubview(self.imageV)
        return finalView
    }
    
    func imageToast(message: String, viewMain:UIView, duration: ToastDuration, img: UIImage, position: ToastPosition){
        viewMain.addSubview(self.createToast(message: message, MainView: viewMain,type: .warning,duration: duration, img: img, position: position))
    }

    func warningToast( message: String, viewMain:UIView, duration: ToastDuration, position: ToastPosition)  {
        viewMain.addSubview(self.createToast(message: message, MainView: viewMain,type: .warning,duration: duration, img: nil, position: position))
    }
    
    func infoToast(message: String,viewMain:UIView, duration: ToastDuration, position: ToastPosition) {
       viewMain.addSubview(self.createToast(message: message, MainView: viewMain,type: .info,duration: duration, img: nil, position: position))
    }
    
    func dangerToast( message: String,viewMain:UIView, duration: ToastDuration, position: ToastPosition)  {
        viewMain.addSubview(self.createToast(message: message , MainView: viewMain, type: .danger,duration: duration, img: nil, position: position))
    }
    
    private init() {
        self.view = UIView()
        self.title = UILabel()
        self.imageV = UIImageView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("CircleView is not NSCoding compliant")
    }
    
    func toastPosition(position: ToastPosition, view: UIView) -> CGPoint {
        switch position {
        case .top:
            return CGPoint(x: 20.0, y: 20.0)
        case .center:
            return CGPoint(x: 20.0, y: view.bounds.size.height / 2)
        case .bottom:
            return CGPoint(x: 20.0, y: view.bounds.size.height - 60)
        }
    }
    

}
// Listing des variables

enum ToasType {
    case info, danger, warning
}
enum ToastDuration {
    case long, short
}
enum ToastPosition {
    case top, center, bottom
}
