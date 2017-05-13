//
//  WriteViewController.swift
//  MoodyDiary
//
//  Created by Aida Fitryani on 5/6/17.
//  Copyright © 2017 IS535. All rights reserved.
//

import UIKit
import CoreData

class WriteViewController: UIViewController {

    var moodTemp = "";
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var moodTempLabel: UILabel!
    
    @IBOutlet weak var storyTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moodTempLabel.text = moodTemp
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backButtonPressed(_ sender: AnyObject) {
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
