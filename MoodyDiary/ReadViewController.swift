//
//  ReadViewController.swift
//  MoodyDiary
//
//  Created by Aida Fitryani on 5/6/17.
//  Copyright © 2017 IS535. All rights reserved.
//

import UIKit

class ReadViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var moodLabel: UILabel!
    
    @IBOutlet weak var readTable: UITableView!
    
    var moodTemp = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moodLabel.text = moodTemp
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = readTable.dequeueReusableCell(withIdentifier: "StoryCell") as! StoryTableViewCell
        cell.storyLabel.text = "1"
        return cell
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
