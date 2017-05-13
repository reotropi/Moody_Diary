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
    
    var tempStoryClicked = "";
    var tempDateClicked = "";
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var stories: [Story] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        getData()
        readTable.reloadData()
    }
    
    func getData() {
        do {
            stories = try context.fetch(Story.fetchRequest())
        } catch {
            print("Fetching Failed")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = readTable.dequeueReusableCell(withIdentifier: "StoryCell") as! StoryTableViewCell
        
        var stories_ = stories[indexPath.row]
        if let moodnya = stories_.mood, let datenya = stories_.date {
        cell.textLabel?.text = moodnya + " - " + datenya
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tempDateClicked = stories[indexPath.row].date!
        tempStoryClicked = stories[indexPath.row].story!
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let detail = segue.destination as! StoryDetailsViewController
            detail.dateTemp = tempDateClicked
            detail.storyTemp = tempStoryClicked
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let story = stories[indexPath.row]
            context.delete(story)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                stories = try context.fetch(Story.fetchRequest())
            } catch {
                print("Fetching Failed")
            }
        }
        tableView.reloadData()
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
