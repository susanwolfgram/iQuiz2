//
//  QuestionViewController.swift
//  iQuizDemo
//
//  Created by Susan Wolfgram on 11/10/15.
//  Copyright © 2015 Susan Wolfgram. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var questions = [Question]()
    var correctAnswer = String()
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        for button in self.view.subviews {
//            if button.isKindOfClass(UIButton) {
//                let b = button as! UIButton
//                b.addTarget(self, action: "moveToAnswer:", forControlEvents: UIControlEvents.TouchUpInside)
//                b.hidden = true
//            }
//        }
        self.answer1.hidden = true
        self.answer1.addTarget(self, action: "moveToAnswer:", forControlEvents: UIControlEvents.TouchUpInside)
        self.answer2.hidden = true
        self.answer2.addTarget(self, action: "moveToAnswer:", forControlEvents: UIControlEvents.TouchUpInside)
        self.answer3.hidden = true
        self.answer3.addTarget(self, action: "moveToAnswer:", forControlEvents: UIControlEvents.TouchUpInside)
        self.answer4.hidden = true
        self.answer4.addTarget(self, action: "moveToAnswer:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func moveToAnswer(sender : UIButton) {
        self.performSegueWithIdentifier("goToAnswer", sender: sender)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("QuizCell") as! QuizCell
        cell.quizquestion.text = self.questions[indexPath.row].question
        self.correctAnswer = self.questions[indexPath.row].correctAnswer
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questions.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let q = questions[indexPath.row]
        self.answer1.hidden = false
        self.answer2.hidden = false
        self.answer3.hidden = false
        self.answer4.hidden = false
        
        self.answer1.titleLabel?.text = q.answers[0]
        self.answer2.titleLabel?.text = q.answers[1]
        self.answer3.titleLabel?.text = q.answers[2]
        self.answer4.titleLabel?.text = q.answers[3]
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let view = segue.destinationViewController as! AnswerViewController
        let button = sender as! UIButton
        view.selectedAnswer = (button.titleLabel?.text)!
        view.correctAnswer = self.correctAnswer
    }
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
