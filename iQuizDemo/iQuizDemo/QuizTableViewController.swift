//
//  QuizTableViewController.swift
//  iQuizDemo
//
//  Created by Susan Wolfgram on 11/10/15.
//  Copyright © 2015 Susan Wolfgram. All rights reserved.
//

import UIKit

struct Question {
    var question : String
    var answers: [String]
    var correctAnswer : String
}

class QuizTableViewController: UITableViewController {
    let quizName = ["Math", "Marvel", "Science"]
    let quizImages = [UIImage(named: "math"),UIImage(named: "marvel"), UIImage(named: "science")]
    
    let MathQuiz = [Question(question: "2+2?", answers: ["4", "5", "6", "7"], correctAnswer: "4"), Question(question: "3+3?", answers: ["4", "5", "6", "7"], correctAnswer: "6")]
    let MarvelQuiz = [Question(question: "What does the R is JARVIS stand for?", answers: ["Rich", "Rather", "Run", "Robot"], correctAnswer: "Rather"), Question(question: "Capt. America's shield contains steel &...", answers: ["Vibranium", "Iron", "Gold", "Bronze"], correctAnswer: "Vibranium")]
    let ScienceQuiz = [Question(question: "What is absolute zero?", answers: ["0°F", "167°F", "-459.67°F", "-500°F"], correctAnswer: "-459.67°F"), Question(question: "Who is known as the father of physics?", answers: ["Albert Einstein", "Isaac Newton", "Henry Ford", "Tony Stark"], correctAnswer: "Isaac Newton")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationController?.navigationBar.topItem?.title = "Pick a quiz!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("QuizCell", forIndexPath: indexPath) as! QuizCell
        cell.label.text = self.quizName[indexPath.row]
        cell.quizimage.image = self.quizImages[indexPath.row]
        // Configure the cell...

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = sender as! QuizCell
        let questionController = segue.destinationViewController as! QuestionViewController
        
        switch cell.label.text! {
        case "Math" :
            questionController.questions = self.MathQuiz
            questionController.navigationItem.title = "Math Quiz"
        case "Marvel" :
            questionController.questions = self.MarvelQuiz
            questionController.navigationItem.title = "Marvel Quiz"
        case "Science" :
            questionController.questions = self.ScienceQuiz
            questionController.navigationItem.title = "Science Quiz"
        default :
            break
        }
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
