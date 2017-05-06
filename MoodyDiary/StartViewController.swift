//
//  StartViewController.swift
//  MoodyDiary
//
//  Created by Aida Fitryani on 4/29/17.
//  Copyright © 2017 IS535. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var moodPicker: MoodPickerView!
    var moodPass = ""
    
    let moodString = ["Happy", "In Love", "Proud", "Bored", "Sad", "Broken", "Depressed"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return moodString.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return moodString[row]
    }
    
    @IBAction func writeButtonPressed(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "writeSegue", sender: nil)
        
    }
    
    @IBAction func readButtonPressed(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "readSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "writeSegue" {
        let a = segue.destination as! WriteViewController
        a.moodTemp = moodPass
        }
            else {
                let b = segue.destination as!ReadViewController
                b.moodTemp = moodPass
            }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        moodPass = moodString[row]
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
