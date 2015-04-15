//
//  ViewController.swift
//  Tap Me
//
//  Created by Main Account on 10/3/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {
    
    var buttonBeep = AVAudioPlayer()
    var secondBeep = AVAudioPlayer()
    var backgroundMusic = AVAudioPlayer()
    


  @IBOutlet var scoreLabel: UILabel!
  @IBOutlet var timerLabel: UILabel!
  var count = 0
  var seconds = 0
  var timer = NSTimer()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    buttonBeep = self.setupAudioPlayWithFile("ButtonTap", type: "wav")
    secondBeep = self.setupAudioPlayWithFile("SecondBeep", type: "wav")
    backgroundMusic = self.setupAudioPlayWithFile("HallOfTheMountainKing", type: "mp3")
    
    buttonBeep.play()
    secondBeep.play()
    backgroundMusic.volume = 0.3
        backgroundMusic.play()

    
    

        setupGame()
    view.backgroundColor = UIColor.purpleColor()
    scoreLabel.backgroundColor = UIColor(patternImage: UIImage(named: "field_score.png")!)
        timerLabel.backgroundColor = UIColor(patternImage: UIImage(named: "field_time.png")!)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func buttonPressed()  {
    count++
    scoreLabel.text = "Score \n\(count)"
    view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_tile.png")!)
  }

  func setupGame()  {
    seconds = 30
    count = 0
   
    timerLabel.text = "Time: \(seconds)"
    scoreLabel.text = "Score: \(count)"
    
    timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
  }
  
  func subtractTime() {
    seconds--
    timerLabel.text = "Time: \(seconds)"
     
    if(seconds == 0)  {
      timer.invalidate()
      let alert = UIAlertController(title: "Time is up!",
         message: "You scored \(count) points",
         preferredStyle: UIAlertControllerStyle.Alert)
      alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: {
        action in self.setupGame()
      }))
      presentViewController(alert, animated: true, completion:nil)
    }
  }
    
       func setupAudioPlayWithFile(file:NSString, type: NSString)->AVAudioPlayer{
        
        var path = NSBundle.mainBundle().pathForResource(file, ofType: type)
        var url = NSURL.fileURLWithPath(path!)
        var error: NSError?
        var audioPlayer : AVAudioPlayer?
        audioPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
        
        return audioPlayer!
    }

}

