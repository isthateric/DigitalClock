//
//  SettingsViewController.swift
//  Digital Clock
//
//  Created by Eric Fuentes on 10/10/18.
//  Copyright © 2018 Eric Fuentes. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIGestureRecognizerDelegate {
    

    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var switch24: UISwitch!
    
    @IBOutlet weak var btnGreen: UIButton!
    
    @IBOutlet weak var btnRed: UIButton!
    
    @IBOutlet weak var btnBlue: UIButton!
    
    var is24 = false
    
    let timeZones = ["Atlantic standard time zone", "Eastern standard time zone", "Central standard time zone", "Mountain standard time zone", "Pacific standard time zone", "Alaska standard time zone", "Hawaii–Aleutian standard time zone", "Samoa standard time zone"]
    var redVal = Float()
    var greenVal = Float()
    var blueVal = Float()
    
    let defaults = UserDefaults.standard
    let changeT = "changeTime"
    let greenC = "colorGreen"
    let chosTime = "choosenTime"
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.isHidden = true
        label.text = timeZones[0]
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(gestureReconizer:)))
        label.addGestureRecognizer(tap)
        label.isUserInteractionEnabled = true
        
        redVal = Float(CGFloat(defaults.double(forKey: "defaultColorRedValue")))
        greenVal = Float(CGFloat(defaults.double(forKey: "defaultColorGreenValue")))
        blueVal = Float(CGFloat(defaults.double(forKey: "defaultColorBlueValue")))
        self.btnRed.backgroundColor = UIColor(red: CGFloat(redVal), green: CGFloat(greenVal), blue: CGFloat(blueVal), alpha: 0.45)
        //self.b.backgroundColor = UIColor(red: redVal, green: greenVal, blue: blueVal, alpha: 0.45)
        
        if let backColor = defaults.string(forKey: "backColor") {
            if(backColor=="green") {
                favorited(button: btnGreen)
            }
            if(backColor=="red") {
                favorited(button: btnRed)
            }
            if(backColor=="blue") {
                favorited(button: btnBlue)
            }
        }
        
    }
    
    func endEditing() {
        view.endEditing(true)
    }
    

        // Do any additional setup after loading the view.
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        switch24.setOn(is24, animated: false)
        
        if let changeHour = defaults.value(forKey: changeT){
            switch24.isOn = changeHour as! Bool

        }
        
        if let previousSelection:Int = defaults.integer(forKey: chosTime) as? Int{
            self.setLabelsForChoice(_choice: previousSelection)
        }
      
//        btnGreen.backgroundColor = .green
//        btnRed.backgroundColor = .red
//        btnBlue.backgroundColor = .blue
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func tap(gestureReconizer: UITapGestureRecognizer) {
        print("*")
        
        pickerView.isHidden = !pickerView.isHidden
        if gestureReconizer.state == .ended {
            self.view.endEditing(true)
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return timeZones[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timeZones.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = timeZones[row]
        defaults.set(row, forKey: chosTime)
        defaults.synchronize()
        self.setLabelsForChoice(_choice: row)
        
        pickerView.isHidden = true
        
    }
    func setLabelsForChoice(_choice:Int){
        label.text = timeZones[_choice]
//        switch _choice{
//        case 0:
//            label.text = "Atlantic standard time zone"
//            break
//        case 1:
//            label.text = "Eastern standard time zone"
//            break
//        case 2:
//            label.text = "Central standard time zone"
//            break
//        case 3:
//            label.text = "Mountain standard time zone"
//            break
//        case 4:
//            label.text = "Pacific standard time zone"
//            break
//        case 5:
//            label.text =  "Alaska standard time zone"
//            break
//        case 6:
//            label.text = "Hawaii–Aleutian standard time zone"
//            break
//        case 7:
//            label.text = "Samoa standard time zone"
//            break
//        default:
//
//            break
//        }
    }
    @IBAction func changeClock(_ sender: UISwitch) {
        is24 = sender.isOn
        defaults.set(is24, forKey: changeT)
        defaults.synchronize()
      //  performSegue(withIdentifier: "connect", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        
        if let color = sender as? UIColor {
            vc.color = color
        }
    }
    @IBAction func green(_ sender: Any) {
      //  performSegue(withIdentifier: "connect", sender: UIColor.green)
        defaults.set("green", forKey: "backColor")
        defaults.synchronize()
       favorited(button: btnGreen)
    
    }
    
    @IBAction func red(_ sender: Any) {
       // performSegue(withIdentifier: "connect", sender: UIColor.red)
        defaults.set("red", forKey: "backColor")
        defaults.synchronize()
       favorited(button: btnRed)
        //defaults.set(redVal, forKey: "defaultColorRedValue")
    }
    
    @IBAction func blue(_ sender: Any) {
       
        //performSegue(withIdentifier: "connect", sender: UIColor.blue)
        defaults.set("blue", forKey: "backColor")
        defaults.synchronize()
         favorited(button: btnBlue)
        
//        defaults.setColor(color: UIColor.red, forKey: "favorited")
//        let myColor = defaults.colorForKey(key: "favorited")
    }
    func favorited(button: UIButton) {
        
        notFavorited(button: btnGreen)
        notFavorited(button: btnBlue)
        notFavorited(button: btnRed)
        
        button.isSelected = true
        button.backgroundColor = UIColor.white
        button.setTitle("Remove from Favorites", for: .selected)
        
        
    }
    
    func notFavorited(button: UIButton) {
        
        button.isSelected = false
        button.backgroundColor = UIColor(red: CGFloat(redVal), green: CGFloat(greenVal), blue: CGFloat(blueVal), alpha: 1.0)
        button.setTitle("Add to Favorites", for: [])
    }
}
