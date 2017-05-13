//
//  StoryDetailsViewController.swift
//  MoodyDiary
//
//  Created by Aida Fitryani on 5/13/17.
//  Copyright © 2017 IS535. All rights reserved.
//

import UIKit

class StoryDetailsViewController: UIViewController {

    var dateTemp = ""
    var storyTemp = ""
    

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var storyLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.text = dateTemp
        storyLabel.text = storyTemp
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: AnyObject) {
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
