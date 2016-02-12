//
//  QuestionViewController.swift
//  WordList
//
//  Created by Honami on 2016/02/11.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    var isAnswerd: Bool = false
    var wordArray: [AnyObject] = []
    var shuffledWordArray: [AnyObject] = []
    var nowNumber : Int = 0
    
    let saveDate = NSUserDefaults.standardUserDefaults()


    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        wordArray = saveDate.arrayForKey("WORD")!
        shuffle()
        questionLabel.text = shuffledWordArray[nowNumber]["english"] as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonPushed(){
        
        if isAnswerd {
            nowNumber++
            answerLabel.text = ""
            
            //次の問題を表示するか
            if nowNumber < shuffledWordArray.count {
                questionLabel.text = shuffledWordArray[nowNumber]["english"] as? String
                isAnswerd = false
                nextButton.setTitle("答えを表示", forState: UIControlState.Normal)
            } else {
                self.performSegueWithIdentifier("toFinishView", sender: nil)
            }
        } else {
            answerLabel.text = shuffledWordArray[nowNumber]["japanese"] as? String
            isAnswerd = true
            nextButton.setTitle("次へ", forState: UIControlState.Normal)
        }
    }
    
    
    func shuffle(){
        while wordArray.count > 0 {
            let index = Int(rand()) % wordArray.count
            shuffledWordArray.append(wordArray[index])
            wordArray.removeAtIndex(index)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
