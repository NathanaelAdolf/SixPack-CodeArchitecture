//
//  ExerciseViewController.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import WebKit

class ExerciseViewController: UIViewController {

    @IBOutlet weak var exerciseView : ExerciseView!
    
    var count = 30
    var timer: Timer?
    var isVideo: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup View
        exerciseView.videoView()
    }
    
    @IBAction func informationExercise(_ sender: Any) {
        
    }
    
    @IBAction func previous(_ sender: Any) {
        
    }
    
    @IBAction func next(_ sender: Any) {
        if isVideo % 2 == 1 {
            exerciseView.restView()
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDownTimer), userInfo: nil, repeats: true)
            isVideo += 1
        } else {
            timer?.invalidate()
            count = 30
            exerciseView.countDownView(count: "30")
            switch isVideo {
            case 2:
                exerciseView.videoView()
                isVideo += 1
            case 4:
                exerciseView.videoView()
                isVideo += 1
                
            case 6:
                exerciseView.videoView()
            case 8:
                exerciseView.videoView()
            case 10:
                exerciseView.videoView()
            default:
                exerciseView.videoView()
                
                
            }
            
            // var x = 0
            // if
        }
    }
    
    @objc func countDownTimer(){
        var countString = String(count)
        if (count >= 0) {
            if count >= 10 {
                exerciseView.countDownView(count: countString)
                count -= 1
            } else {
                countString = "0\(countString)"
                exerciseView.countDownView(count: countString)
                count -= 1
            }
        }
    }
}
