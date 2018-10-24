//
//  CustomView.swift
//  Digital Clock
//
//  Created by Eric Fuentes on 9/25/18.
//  Copyright © 2018 Eric Fuentes. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomView: UIView {
    @IBOutlet weak var Top1: UIView!
    @IBOutlet weak var TopRight1: UIView!
    @IBOutlet weak var TopLeft1: UIView!
    @IBOutlet weak var Middle1: UIView!
    
    @IBOutlet weak var BottomLeft1: UIView!
    
    @IBOutlet weak var BottomRight1: UIView!
    
    @IBOutlet weak var Bottom1: UIView!
    let greenC = "colorGreen"
     let defaults = UserDefaults.standard
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadViewFromNib()
    }
   
    func loadViewFromNib() {
        
        let nibName = "CustomView"
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let v = nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
        
        print(self.bounds)
        v?.frame = self.bounds
        addSubview(v!)
      
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        loadViewFromNib()
    }
    
    func show(no: Int) {
       // print("show \(no)")
        
        if no == 1 {
            Top1.alpha = 0.0
            TopLeft1.alpha = 0.0
            TopRight1.alpha = 1.0
            Middle1.alpha = 0.0
            BottomLeft1.alpha = 0.0
            BottomRight1.alpha = 1.0
            Bottom1.alpha = 0.0
            
        }
        if no == 2 {
            Top1.alpha = 1.0
            TopLeft1.alpha = 0.0
            TopRight1.alpha = 1.0
            Middle1.alpha = 1.0
            BottomLeft1.alpha = 1.0
            BottomRight1.alpha = 0.0
            Bottom1.alpha = 1.0
        }
        if no == 3{
            Top1.alpha = 1.0
            TopLeft1.alpha = 0.0
            TopRight1.alpha = 1.0
            Middle1.alpha = 1.0
            BottomLeft1.alpha = 0.0
            BottomRight1.alpha = 1.0
            Bottom1.alpha = 1.0
        }
        if no == 4{
            Top1.alpha = 0.0
            TopLeft1.alpha = 1.0
            TopRight1.alpha = 1.0
            Middle1.alpha = 1.0
            BottomLeft1.alpha = 0.0
            BottomRight1.alpha = 1.0
            Bottom1.alpha = 0.0
            
        }
        if no == 5{
            Top1.alpha = 1.0
            TopLeft1.alpha = 1.0
            TopRight1.alpha = 0.0
            Middle1.alpha = 1.0
            BottomRight1.alpha = 1.0
            BottomLeft1.alpha = 0.0
            Bottom1.alpha = 1.0
        }
        if no == 6{
            Top1.alpha = 1.0
            TopLeft1.alpha = 1.0
            TopRight1.alpha = 0.0
            Middle1.alpha = 1.0
            BottomLeft1.alpha = 1.0
            BottomRight1.alpha = 1.0
            Bottom1.alpha = 1.0
            
        }
        if no == 7{
            Top1.alpha = 1.0
            TopRight1.alpha = 1.0
            TopLeft1.alpha = 0.0
            Middle1.alpha = 0.0
            BottomRight1.alpha = 1.0
            BottomLeft1.alpha = 0.0
            Bottom1.alpha = 0.0
            
        }
        if no == 8{
            Top1.alpha = 1.0
            TopLeft1.alpha = 1.0
            TopRight1.alpha = 1.0
            Middle1.alpha = 1.0
            BottomLeft1.alpha = 1.0
            BottomRight1.alpha = 1.0
            Bottom1.alpha = 1.0
            
            
        }
        if no == 9{
            Top1.alpha = 1.0
            TopLeft1.alpha = 1.0
            TopRight1.alpha = 1.0
            Middle1.alpha = 1.0
            BottomLeft1.alpha = 0.0
            BottomRight1.alpha = 1.0
            Bottom1.alpha = 0.0
            
        }
        if no == 0{
            Top1.alpha = 1.0
            TopLeft1.alpha = 1.0
            TopRight1.alpha = 1.0
            Middle1.alpha = 0.0
            BottomRight1.alpha = 1.0
            BottomLeft1.alpha = 1.0
            Bottom1.alpha = 1.0
        }
      
}

    func changeColor(_ color: UIColor){

        Top1.backgroundColor = color
        TopLeft1.backgroundColor = color
        TopRight1.backgroundColor = color
        Middle1.backgroundColor = color
        BottomLeft1.backgroundColor = color
        BottomRight1.backgroundColor = color
        Bottom1.backgroundColor = color
        
        defaults.set(true, forKey: greenC)

    }
}
