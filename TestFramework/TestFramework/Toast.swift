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

    
    
    private func createToast(message: String, MainView: UIView,type: ToasType, duration: ToastDuration, img: UIImage?, position: ToastPosition, textColor: UIColor, backgroundColor: UIColor) -> UIView {
        
        let finalView = UIView()
        finalView.frame = MainView.frame

        if img == nil {
            self.title = UILabel()
            self.title.text = "⚠️ " + message
            self.title.sizeToFit()
            let width = self.title.frame.width
            let height = self.title.frame.height
            let sizeToast = toastSize(view: finalView, width: width, height: height)
            self.title = UILabel(frame:CGRect(x: toastPosition(position: position, view: finalView, width: sizeToast.width + 20, height: sizeToast.height + 20).x, y: toastPosition(position: position, view: finalView, width: width + 20, height: height + 20).y, width: sizeToast.width + 20, height: sizeToast.height + 20))
            finalView.addSubview(self.title)
            self.title.lineBreakMode = .byWordWrapping
            self.title.numberOfLines = 0
        } else {
            //  TODO: j'ai pas encore trop regardé ni réussi pour afficher l'image + texte
            
//            finalView.addSubview(self.imageV)
//            finalView.addSubview(self.title)
//            self.title = UILabel(frame: CGRect(x:20.0, y:(MainView.frame.size.height)-120, width:(MainView.frame.size.width)-40, height:100))
//            self.imageV = UIImageView(image: img)
//            self.imageV.frame = CGRect(x:20.0, y:(MainView.frame.size.height)-300, width:(img?.size.width)!, height:(img?.size.height)!)
//            self.imageV.translatesAutoresizingMaskIntoConstraints = false
//            self.imageV.centerXAnchor.constraint(equalTo: finalView.centerXAnchor).isActive = true
            
        }
        
        self.title.textAlignment = .center
        self.title.layer.cornerRadius = 15
        self.title.layer.masksToBounds = true
        
        
        switch type {
        case .warning:
            self.title.backgroundColor = backgroundColor
            self.title.textColor = textColor
            self.title.text = "⚠️ " + message
        case .danger:
            self.title.backgroundColor = backgroundColor
            self.title.textColor = textColor
            self.title.text = "⚠️ " + message
        case .info:
            self.title.backgroundColor = backgroundColor
            self.title.textColor = textColor
            self.title.text = "ℹ️ " + message
        case .custom:
            self.title.backgroundColor = backgroundColor
            self.title.textColor = textColor
            self.title.text = message
        }
    
    

        toastDuration(duration: duration)
        
        return finalView
    }
    
    func imageToast(message: String, viewMain:UIView, duration: ToastDuration, img: UIImage, position: ToastPosition){
        viewMain.addSubview(self.createToast(message: message, MainView: viewMain,type: .warning,duration: duration, img: img, position: position, textColor: .black, backgroundColor: .blue))
    }

    func warningToast( message: String, viewMain:UIView, duration: ToastDuration, position: ToastPosition)  {
        viewMain.addSubview(self.createToast(message: message, MainView: viewMain,type: .warning,duration: duration, img: nil, position: position, textColor: .black, backgroundColor: .yellow))
    }
    
    func infoToast(message: String,viewMain:UIView, duration: ToastDuration, position: ToastPosition) {
       viewMain.addSubview(self.createToast(message: message, MainView: viewMain,type: .info,duration: duration, img: nil, position: position, textColor: .black, backgroundColor: .gray))
    }
    
    func dangerToast( message: String,viewMain:UIView, duration: ToastDuration, position: ToastPosition)  {
        viewMain.addSubview(self.createToast(message: message , MainView: viewMain, type: .danger,duration: duration, img: nil, position: position, textColor: .black, backgroundColor: .red))
    }
    func customToast( message: String,viewMain:UIView, duration: ToastDuration, position: ToastPosition, textColor: UIColor, backgroundColor: UIColor)  {
        viewMain.addSubview(self.createToast(message: message , MainView: viewMain, type: .danger,duration: duration, img: nil, position: position, textColor: textColor, backgroundColor: backgroundColor))
    }

    
    private init() {
        self.view = UIView()
        self.title = UILabel()
        self.imageV = UIImageView()
    }
    
    
    //  implémente la durée du toast
    func toastDuration(duration: ToastDuration) {
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
    }
    
    //  Calcule de la position du toast en fonction de la taille de l'écran et de la hauteur de UILabel
    func toastPosition(position: ToastPosition, view: UIView, width: CGFloat, height: CGFloat) -> CGPoint {
        // y.top
        let viewHeight = view.frame.size.height
        let topYPosition = viewHeight * 0.1
        
        // y.center
        let yCenterView = viewHeight / 2
        let halfHeightToast = height / 2
        let yCenter = yCenterView - halfHeightToast
        
        // y.bottom
        let spaceBottom = viewHeight * 0.1
        let yBottom = viewHeight - spaceBottom - height
        
        // x position
        let viewWidth = view.frame.size.width
        let xCenterView = viewWidth / 2
        let halfWidthToast = width / 2
        let x = xCenterView - halfWidthToast
        
        switch position {
        case .top:
            return CGPoint(x: x, y: topYPosition)
        case .center:
            return CGPoint(x: x, y: yCenter)
        case .bottom:
            return CGPoint(x: x, y: yBottom)
        }
    }
    
    //  Calcule de la taille du toast UILabel en fonction de la taille du message
    func toastSize(view: UIView, width: CGFloat, height: CGFloat) -> CGSize {
        let viewWidth = view.frame.size.width
        let maxToastWidth = viewWidth * 0.8
        var newHeightToast = height
        var newWidthToast = width
        
        if width > maxToastWidth {
            let denominator = Int(width) % Int(maxToastWidth)
            var res: CGFloat
            if denominator == 0 {
                res = width / maxToastWidth
            } else {
                res = ((width - CGFloat(denominator)) / maxToastWidth) + 1
            }
            newWidthToast = maxToastWidth
            newHeightToast = height * res
        }
        return CGSize(width: newWidthToast, height: newHeightToast)
    }
    

}
// Listing des variables

enum ToasType {
    case info, danger, warning, custom
}
enum ToastDuration {
    case long, short
}
enum ToastPosition {
    case top, center, bottom
}
