//
//  ViewController.swift
//  StopWatch
//
//  Created by 金妍廷 on 2022/02/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var hanteiLabel: UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei(){
        if count > 9.80 && count < 10.20{
            hanteiLabel.text = "PERFECT!!"
            hanteiLabel.textColor = UIColor.red
        } else if count > 9.70 && count < 10.30{
            hanteiLabel.text = "GREAT!!"
            hanteiLabel.textColor = UIColor.yellow
        } else if count > 9.50 && count < 10.50{
            hanteiLabel.text = "GOOD!!"
            hanteiLabel.textColor = UIColor.green
        } else {
            hanteiLabel.text = "BAD"
            hanteiLabel.textColor = UIColor.blue
        }
    }
    
    
    @IBAction func start(){

        if !timer.isValid{
            //タイマーが動いていない時
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
        hanteiLabel.text = ""
    }
    @IBAction func stop(){
        if timer.isValid{
            //タイマーが動いている時
            timer.invalidate()
            self.hantei()
        }
    }
    
    @IBAction func reset(){
        if timer.isValid{
            timer.invalidate()
        }
        count = 0.00
        label.text = String(format: "%.2f", count)
        hanteiLabel.text = ""
        
    }


}

