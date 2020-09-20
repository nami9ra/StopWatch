//
//  ViewController.swift
//  StopWatch
//
//  Created by 渡辺奈実 on 2020/09/14.
//  Copyright © 2020 Watanabe nami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var PerfectLabel: UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func up(){
        //countを0.01足す
        count += 0.01
        //ラベルに小数点以下2桁まで表示
        label.text = String(format: "%.2f", count)
    }
    
    @IBAction func start(){
        
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true)
        }
        PerfectLabel.text = ""
    }

    @IBAction func stop(){
        if timer.isValid{
            //タイマーが動作していたら停止する
            timer.invalidate()
            //hanteiメソッドを呼び出し，結果を表示する
            self.hantei()
        }
    }
    
    @IBAction func reset(){
        if timer.isValid{
            timer.invalidate()
        }
        count = 0.0
        label.text = String(format: "%.2f", count)
        PerfectLabel.text = ""
    }
    
    func hantei(){
        if 9.80 <= count && count <= 10.20{
            PerfectLabel.text = "PERFECT!!"
            PerfectLabel.textColor = UIColor.red
        }else if 9.70 <= count && count <= 10.30{
            PerfectLabel.text = "GREAT!!"
            PerfectLabel.textColor = UIColor.yellow
        }else if 9.60 <= count && count <= 10.40{
            PerfectLabel.text = "GOOD!!"
            PerfectLabel.textColor = UIColor.green
        }else{
            PerfectLabel.text = "BAD!!"
            PerfectLabel.textColor = UIColor.blue
        }
    }
}

