//
//  WriteViewController.swift
//  MoodyDiary
//
//  Created by Aida Fitryani on 5/6/17.
//  Copyright © 2017 IS535. All rights reserved.
//

import UIKit
import CoreData
import ChameleonFramework
import AVFoundation

class WriteViewController: UIViewController {

    var moodTemp = "";
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var moodTempLabel: UILabel!
    
    @IBOutlet weak var storyTextView: UITextView!
 
    var audioPlayer : AVAudioPlayer!
    
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
            
            view.backgroundColor = UIColor.flatPink().lighten(byPercentage: 80)
            
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
        super.viewDidLoad()
        moodTempLabel.text = moodTemp
        
        
        let myAudioUrl = Bundle.main.url(forResource: "theMusic2", withExtension: "mp3")!
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: myAudioUrl)
        } catch {
            print("cannot load file: \(myAudioUrl)")
        }
        
        audioPlayer.currentTime = 0
        audioPlayer.play()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        audioPlayer.stop()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: AnyObject) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let story_ = Story (context: context)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        
        let strdate = dateFormatter.string(from: datePicker.date)
        
        
        story_.date = strdate
        story_.mood = moodTemp
        story_.story = storyTextView.text
        
        audioPlayer.stop()
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
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
