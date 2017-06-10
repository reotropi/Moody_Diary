//
//  StoryDetailsViewController.swift
//  MoodyDiary
//
//  Created by Aida Fitryani on 5/13/17.
//  Copyright © 2017 IS535. All rights reserved.
//

import UIKit
import ChameleonFramework
import AVFoundation

class StoryDetailsViewController: UIViewController {

    var dateTemp = ""
    var moodTemp = ""
    var storyTemp = ""
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var moodImage: UIImageView!
    
    
    @IBOutlet weak var imageBottomLayout: NSLayoutConstraint!

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var storyLabel: UITextView!
    
    var audioPlayer: AVAudioPlayer!
    
    func chooseColor(){
        
        if moodTemp == "Happy" {
            
            view.backgroundColor = UIColor.flatYellow().lighten(byPercentage: 80)
            
        }
            
        else if moodTemp == "Angry" {
            
            view.backgroundColor = UIColor.flatRed().lighten(byPercentage: 80)
            
        }
            
        else if moodTemp == "Confused" {
            
            view.backgroundColor = UIColor.cyan.lighten(byPercentage: 80)
            
        }
            
            
        else if moodTemp == "Depressed" {
            
            view.backgroundColor = UIColor.gray.lighten(byPercentage: 80)
            
        }
            
        else if moodTemp == "Bored" {
            
            view.backgroundColor = UIColor.flatLime().lighten(byPercentage: 80)
            
        }
            
        else if moodTemp == "In Love" {
            
            view.backgroundColor = UIColor.flatPink().lighten(byPercentage: 95)
            
        }
            
            
        else if moodTemp == "Proud" {
            
            view.backgroundColor = UIColor.blue.lighten(byPercentage: 80)
            
        }
            
        else if moodTemp == "Sad" {
            
            view.backgroundColor = UIColor.darkGray.lighten(byPercentage: 80)
            
        }
            
        else if moodTemp == "Shocked" {
            
            view.backgroundColor = UIColor.red.lighten(byPercentage: 80)
            
        }
            
        else if moodTemp == "Tired" {
            
            view.backgroundColor = UIColor.flatGreen().lighten(byPercentage: 80)
            
        }
        
    }
    
    override func viewDidLoad() {
        
        chooseColor()
        
        
        let myAudioUrl = Bundle.main.url(forResource: "theMusic2", withExtension: "mp3")!
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: myAudioUrl)
        } catch {
            print("cannot load file: \(myAudioUrl)")
        }
        
        audioPlayer.currentTime = 0
        audioPlayer.play()
        
        super.viewDidLoad()
        imageBottomLayout.constant = -148
        dateLabel.text = dateTemp
        storyLabel.text = storyTemp
        
        var title = moodTemp + ".png"
        
        let thePict = UIImage(named: title)!
        moodImage.image = thePict
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.imageBottomLayout.constant = 19
        UIImageView.animate(withDuration: 5) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        audioPlayer.stop()
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
