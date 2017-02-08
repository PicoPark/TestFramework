//
//  Toast.swift
//  TestFramework
//
//  Created by Salomé Russier on 25/01/2017.
//  Copyright © 2017 Salomé Russier. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

open class Toast {
    
    private var toastSoundID: SystemSoundID = 0
    static var shared = Toast()
    private var superView: UIView!
    private var finalView: UIView!
    private var title: UILabel!
    private var imageV: UIImageView
    
    private func createToast(message: String, MainView: UIView,type: ToasType, duration: ToastDuration, img: UIImage?, position: ToastPosition, textColor: UIColor, backgroundColor: UIColor, sound: Bool, mp3FileName: String, mp3FileExt: String) -> UIView {
        
        finalView.frame = MainView.frame
        self.title.text = message
        self.title.sizeToFit()
        let width = self.title.frame.width
        let height = self.title.frame.height
        let sizeToast = toastSize(width: width, height: height)
        
        if img == nil {
            
            self.title = UILabel(frame:CGRect(x: toastPosition(position: position, width: sizeToast.width + 20, height: sizeToast.height + 20).x, y: toastPosition(position: position, width: width + 20, height: height + 20).y, width: sizeToast.width + 20, height: sizeToast.height + 20))
            
            finalView.addSubview(self.title)
            
        } else {
            
            // dans le cas où la taille de la frame du message est plus petite que la frame de l'image, on attribut une taille minimale de 90
            let newToastWidth: CGFloat
            if sizeToast.width >= 90 {
                newToastWidth = sizeToast.width + 20
            } else {
                newToastWidth = 90
            }
            
            // title frame initialisation
            self.title = UILabel(frame:CGRect(x: toastPosition(position: position, width: newToastWidth, height: sizeToast.height + 20).x, y: toastPosition(position: position, width: width + 20, height: height + 20).y + 20, width: newToastWidth, height: sizeToast.height + 20))
            
            
            // superView frame initialisation
            superView = UIView(frame: CGRect(x: toastPosition(position: position, width: newToastWidth, height: sizeToast.height + 20).x, y: toastPosition(position: position, width: width + 20, height: height + 20).y - 40, width: newToastWidth, height: sizeToast.height + 70))
            superView.backgroundColor = backgroundColor
            superView.layer.cornerRadius = 15
            superView.layer.masksToBounds = true
            
            // imageView frame initialisation
            imageV = UIImageView(image: img!)
            imageV.frame = CGRect(x: MainView.frame.size.width / 2 - 25, y: toastPosition(position: position, width: width + 20, height: height + 20).y - 30, width: 50, height: 50)
            
            // final toast view assemblage
            finalView.addSubview(superView)
            finalView.addSubview(self.title)
            finalView.addSubview(imageV)
        }
        
        // paramétrage self.title
        self.title.textAlignment = .center
        self.title.layer.cornerRadius = 15
        self.title.layer.masksToBounds = true
        self.title.backgroundColor = backgroundColor
        self.title.textColor = textColor
        self.title.text =  message
        self.title.lineBreakMode = .byWordWrapping
        self.title.numberOfLines = 0
        
        toastDuration(duration: duration)
        
        if sound {
            toastSound(type: type, mp3FileName: mp3FileName, mp3FileExt: mp3FileExt)
        }
        
        return finalView
    }
    

    // LISTE DES TOAST :
    
    // warningToast = warning texte message
    func warningToast( message: String, viewMain:UIView, duration: ToastDuration, position: ToastPosition, sound: Bool)  {
        
        viewMain.addSubview(self.createToast(message: message, MainView: viewMain,type: .warning,duration: duration, img: UIImage(named: "warning.png"), position: position, textColor: .black, backgroundColor: .yellow, sound: sound, mp3FileName: "", mp3FileExt: ""))
        
    }
    
    // infoToast = info texte message
    func infoToast(message: String,viewMain:UIView, duration: ToastDuration, position: ToastPosition, sound: Bool) {
        
       viewMain.addSubview(self.createToast(message: message, MainView: viewMain,type: .info,duration: duration, img:UIImage(named: "info.png"), position: position, textColor: .white, backgroundColor: .blue, sound: sound, mp3FileName: "", mp3FileExt: ""))
        
    }
    
    // dangerToast = danger texte message
    func dangerToast( message: String,viewMain:UIView, duration: ToastDuration, position: ToastPosition, sound: Bool)  {
        
        viewMain.addSubview(self.createToast(message: message , MainView: viewMain, type: .danger,duration: duration, img: UIImage(named: "danger.png"), position: position, textColor: .black, backgroundColor: .red, sound: sound, mp3FileName: "", mp3FileExt: ""))
        
    }
    
    // simpleToast = simple message
    func simpleToast( message: String,viewMain:UIView, duration: ToastDuration, position: ToastPosition, sound: Bool)  {
        
        viewMain.addSubview(self.createToast(message: message , MainView: viewMain, type: .simple ,duration: duration, img: nil, position: position, textColor: .white, backgroundColor: .gray, sound: sound, mp3FileName: "", mp3FileExt: ""))
        
    }
    
    // FONCTIONS :
    
    // play a sound when the toast appears
    func toastSound(type: ToasType, mp3FileName: String, mp3FileExt: String) {
        
        switch type {
        case .warning:
            if let soundURL = Bundle.main.url(forResource: "warning", withExtension: "mp3") {
                AudioServicesCreateSystemSoundID(soundURL as CFURL, &toastSoundID)
            }
            AudioServicesPlaySystemSound(self.toastSoundID)
            
        case .danger:
            if let soundURL = Bundle.main.url(forResource: "danger", withExtension: "wav") {
                AudioServicesCreateSystemSoundID(soundURL as CFURL, &toastSoundID)
            }
            AudioServicesPlaySystemSound(self.toastSoundID)
            
        case .info:
            if let soundURL = Bundle.main.url(forResource: "info", withExtension: "wav") {
                AudioServicesCreateSystemSoundID(soundURL as CFURL, &toastSoundID)
            }
            AudioServicesPlaySystemSound(self.toastSoundID)

        case .simple:
            if let soundURL = Bundle.main.url(forResource: "info", withExtension: "wav") {
                AudioServicesCreateSystemSoundID(soundURL as CFURL, &toastSoundID)
            }
            AudioServicesPlaySystemSound(self.toastSoundID)
        }
        
    }
    
    //  implémente la durée du toast
    func toastDuration(duration: ToastDuration) {
        
        switch duration {
        case .long:
            UIView.animate(withDuration: 1.0, delay: 6.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.finalView.alpha = CGFloat(0.0)
            }, completion: nil)
            
        case .short:
            UIView.animate(withDuration: 1.0, delay: 3.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.finalView.alpha = CGFloat(0.0)
            }, completion: nil)
        }
        
    }
    
    //  Calcule de la position du toast en fonction de la taille de l'écran et de la hauteur de UILabel
    func toastPosition(position: ToastPosition, width: CGFloat, height: CGFloat) -> CGPoint {
        
        // y.top
        let viewHeight = finalView.frame.size.height
        let topYPosition = viewHeight * 0.1
        
        // y.center
        let yCenterView = viewHeight / 2
        let halfHeightToast = height / 2
        let yCenter = yCenterView - halfHeightToast
        
        // y.bottom
        let spaceBottom = viewHeight * 0.1
        let yBottom = viewHeight - spaceBottom - height
        
        // x position
        let viewWidth = finalView.frame.size.width
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
    func toastSize(width: CGFloat, height: CGFloat) -> CGSize {
        
        let viewWidth = finalView.frame.size.width
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
    
    private init() {
        self.superView = UIView()
        self.finalView = UIView()
        self.title = UILabel()
        self.imageV = UIImageView()
    }
}

// Listing des variables
enum ToasType {
    case info, danger, warning, simple
}

enum ToastDuration {
    case long, short
}

enum ToastPosition {
    case top, center, bottom
}
