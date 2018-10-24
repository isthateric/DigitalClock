//
//  ViewController.swift
//  Digital Clock
//
//  Created by Eric Fuentes on 9/25/18.
//  Copyright © 2018 Eric Fuentes. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {
    
    
    
    
    @IBOutlet weak var customViewMinutesFirst: CustomView!
    
    @IBOutlet weak var customViewMinutesSecond: CustomView!
    @IBOutlet weak var customViewSecondsOne: CustomView!
    @IBOutlet weak var customViewSecondsTwo: CustomView!
    
    @IBOutlet weak var customViewHourOne: CustomView!
    
    @IBOutlet weak var customViewHourTwo: CustomView!
    
    @IBOutlet weak var settingB: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var amLabel: UILabel!
    @IBOutlet weak var pmLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    
    var time = 0
    var timer = Timer()
    var isTimerRunning = true
    var is24Time = false
    var currentImage = 0
    var color = UIColor.orange

    
    let defaults = UserDefaults.standard
    let changeT = "changeTime"
    let imageNames = ["img-clock-background-1","img-clock-background-2","img-clock-background-3","img-clock-background-4","img-clock-background-5","img-clock-background-6","img-clock-background-7","img-clock-background-8","img-clock-background-9","img-clock-background-10"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        dateLabel.text = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: DateFormatter.Style.full, timeStyle: DateFormatter.Style.none)
            

        self.perform(#selector(changeColor), with: nil, afterDelay: 0.5)
        imageView.isUserInteractionEnabled = true
//        settingB.isUserInteractionEnabled = true

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        imageView.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        imageView.addGestureRecognizer(swipeLeft)
        
//        imageView.image = UIImage(named:imageNames[5])
        
       imageView.backgroundColor = UIColor(patternImage: UIImage(named: imageNames[currentImage])!)
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.updateTime()
        }
    }
    func amPm(no: String){
        if no == "A"{
            pmLabel.alpha = 0
        }
        if no == "P"{
            amLabel.alpha = 0
        }
    }
    
    
    func updateTime() {
    
        if isTimerRunning == true {
        if is24Time {
           
                let formatter = DateFormatter()
                // initially set the format based on your datepicker date / server String
                //                formatter.dateFormat = self.is24Time ? "HH:mm:ss" : "h:mm a"
                formatter.dateFormat =  "HH:mm:ss"
                let dateString = formatter.string(from: Date()) // string purpose I add here
                let characters = Array(dateString)
                
                
                let hourOne = Int(String(characters[0]))!
                let hourTwo = Int(String(characters[1]))!
                let minutesOne = Int(String(characters[3]))!
                let minutesTwo = Int(String(characters[4]))!
                let secondsOne = Int(String(characters[6]))!
                let secondsTwo = Int(String(characters[7]))!
                
                self.customViewMinutesFirst.show(no: minutesOne )
                self.customViewMinutesSecond.show(no: minutesTwo )
                self.customViewSecondsOne.show(no: secondsOne)
                self.customViewSecondsTwo.show(no: secondsTwo)
                self.customViewHourOne.show(no:hourOne)
                self.customViewHourTwo.show(no:hourTwo)
                self.amLabel.isHidden = true
                self.pmLabel.isHidden = true
          }   else {
            
                  let formatter = DateFormatter()
                formatter.dateFormat =  "hh:mm:ss a"
                let dateString = formatter.string(from: Date()) // string purpose I add here
                let characters = Array(dateString)
                // 12 hours format
                
                let hourOne = Int(String(characters[0]))!
                let hourTwo = Int(String(characters[1]))!
                let minutesOne = Int(String(characters[3]))!
                let minutesTwo = Int(String(characters[4]))!
                let secondsOne = Int(String(characters[6]))!
                let secondsTwo = Int(String(characters[7]))!
                let aa = String(characters[9])
        
                self.customViewMinutesFirst.show(no: minutesOne )
                self.customViewMinutesSecond.show(no: minutesTwo )
                self.customViewSecondsOne.show(no: secondsOne)
                self.customViewSecondsTwo.show(no: secondsTwo)
                self.customViewHourOne.show(no:hourOne)
                self.customViewHourTwo.show(no:hourTwo)
                self.amPm(no: aa)
            
            }
        }
    }
    
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {


            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.left:
                if currentImage == imageNames.count - 1 {
                    currentImage = 0

                }else{
                    currentImage += 1
                }
                imageView.image = UIImage(named: imageNames[currentImage])

            case UISwipeGestureRecognizerDirection.right:
                if currentImage == 0 {
                    currentImage = imageNames.count - 1
                }else{
                    currentImage -= 1
                }
                imageView.image = UIImage(named: imageNames[currentImage])
            default:
                break
            }
        }
    }
    @objc func changeColor(sender: UIButton) {
        let origImage = UIImage(named: "icons8-settings-50")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        settingB.setImage(tintedImage, for: .normal)
        settingB.tintColor = color
        amLabel.textColor = color
        pmLabel.textColor = color
        dateLabel.textColor = color
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let backColor = defaults.object(forKey: "backColor") as? String {
            switch backColor {
            case "red":
                color = UIColor.red
                break
            case "green":
                color = UIColor.green
            case "blue":
                color = UIColor.blue
            default: break
            }
        print("Milatary time: \(is24Time)")
        
        self.customViewMinutesFirst.changeColor(color)
        self.customViewMinutesSecond.changeColor(color)
        self.customViewSecondsOne.changeColor(color)
        self.customViewSecondsTwo.changeColor(color)
        self.customViewHourOne.changeColor(color)
        self.customViewHourTwo.changeColor(color)
        
        if let is24Def = defaults.value(forKey: changeT) as? Bool  {
            is24Time = is24Def
        }
        
        
        self.updateTime()
            
    
}
        
}
//    func date(no: String){
//        let dateString = "2016-12-15T22:10:00Z"
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//        let date = dateFormatter.date(from: dateString)
//        dateFormatter.dateFormat = "yyyy/MM/dd"
//        let s = dateFormatter.string(from: date!)
//
//        dateLabel.text = s
//    }
    
}
