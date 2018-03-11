//
//  ViewController.swift
//  ChatBubbleAdvanced
//
//  Created by Dima on 3/10/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        showOutgoingMessage(text: "An arbitrary text which we use to demonstrate how our label sizes' calculation works.")
        
        showIncomingMessage()
    }
    
    func showIncomingMessage() {
        let width: CGFloat = 0.66 * view.frame.width
        let height: CGFloat = width / 0.75
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 22, y: height))
        bezierPath.addLine(to: CGPoint(x: width - 17, y: height))
        bezierPath.addCurve(to: CGPoint(x: width, y: height - 17), controlPoint1: CGPoint(x: width - 7.61, y: height), controlPoint2: CGPoint(x: width, y: height - 7.61))
        bezierPath.addLine(to: CGPoint(x: width, y: 17))
        bezierPath.addCurve(to: CGPoint(x: width - 17, y: 0), controlPoint1: CGPoint(x: width, y: 7.61), controlPoint2: CGPoint(x: width - 7.61, y: 0))
        bezierPath.addLine(to: CGPoint(x: 21, y: 0))
        bezierPath.addCurve(to: CGPoint(x: 4, y: 17), controlPoint1: CGPoint(x: 11.61, y: 0), controlPoint2: CGPoint(x: 4, y: 7.61))
        bezierPath.addLine(to: CGPoint(x: 4, y: height - 11))
        bezierPath.addCurve(to: CGPoint(x: 0, y: height), controlPoint1: CGPoint(x: 4, y: height - 1), controlPoint2: CGPoint(x: 0, y: height))
        bezierPath.addLine(to: CGPoint(x: -0.05, y: height - 0.01))
        bezierPath.addCurve(to: CGPoint(x: 11.04, y: height - 4.04), controlPoint1: CGPoint(x: 4.07, y: height + 0.43), controlPoint2: CGPoint(x: 8.16, y: height - 1.06))
        bezierPath.addCurve(to: CGPoint(x: 22, y: height), controlPoint1: CGPoint(x: 16, y: height), controlPoint2: CGPoint(x: 19, y: height))
        bezierPath.close()
        
        let incomingMessageLayer = CAShapeLayer()
        incomingMessageLayer.path = bezierPath.cgPath
        incomingMessageLayer.frame = CGRect(x: 0,
                                            y: 0,
                                            width: width,
                                            height: height)
        
        let imageView = UIImageView(image: UIImage(named: "alpaca"))
        imageView.frame.size = CGSize(width: width, height: height)
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.mask = incomingMessageLayer
        
        view.addSubview(imageView)
    }
    
    func showOutgoingMessage(text: String) {
        let label =  UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.text = text
        
        let constraintRect = CGSize(width: 0.66 * view.frame.width,
                                    height: .greatestFiniteMagnitude)
        let boundingBox = text.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [.font: label.font],
                                            context: nil)
        label.frame.size = CGSize(width: ceil(boundingBox.width),
                                  height: ceil(boundingBox.height))
        
        let bubbleSize = CGSize(width: label.frame.width + 28,
                                     height: label.frame.height + 20)
        
        let width = bubbleSize.width
        let height = bubbleSize.height
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: width - 22, y: height))
        bezierPath.addLine(to: CGPoint(x: 17, y: height))
        bezierPath.addCurve(to: CGPoint(x: 0, y: height - 17), controlPoint1: CGPoint(x: 7.61, y: height), controlPoint2: CGPoint(x: 0, y: height - 7.61))
        bezierPath.addLine(to: CGPoint(x: 0, y: 17))
        bezierPath.addCurve(to: CGPoint(x: 17, y: 0), controlPoint1: CGPoint(x: 0, y: 7.61), controlPoint2: CGPoint(x: 7.61, y: 0))
        bezierPath.addLine(to: CGPoint(x: width - 21, y: 0))
        bezierPath.addCurve(to: CGPoint(x: width - 4, y: 17), controlPoint1: CGPoint(x: width - 11.61, y: 0), controlPoint2: CGPoint(x: width - 4, y: 7.61))
        bezierPath.addLine(to: CGPoint(x: width - 4, y: height - 11))
        bezierPath.addCurve(to: CGPoint(x: width, y: height), controlPoint1: CGPoint(x: width - 4, y: height - 1), controlPoint2: CGPoint(x: width, y: height))
        bezierPath.addLine(to: CGPoint(x: width + 0.05, y: height - 0.01))
        bezierPath.addCurve(to: CGPoint(x: width - 11.04, y: height - 4.04), controlPoint1: CGPoint(x: width - 4.07, y: height + 0.43), controlPoint2: CGPoint(x: width - 8.16, y: height - 1.06))
        bezierPath.addCurve(to: CGPoint(x: width - 22, y: height), controlPoint1: CGPoint(x: width - 16, y: height), controlPoint2: CGPoint(x: width - 19, y: height))
        bezierPath.close()
        
        let outgoingMessageLayer = CAShapeLayer()
        outgoingMessageLayer.path = bezierPath.cgPath
        outgoingMessageLayer.frame = CGRect(x: view.frame.width/2 - width/2,
                                            y: view.frame.height/2 - height/2,
                                            width: width,
                                            height: height)
        outgoingMessageLayer.fillColor = UIColor(red: 0.09, green: 0.54, blue: 1, alpha: 1).cgColor
        
        view.layer.addSublayer(outgoingMessageLayer)
        
        label.center = view.center
        view.addSubview(label)
    }
}

