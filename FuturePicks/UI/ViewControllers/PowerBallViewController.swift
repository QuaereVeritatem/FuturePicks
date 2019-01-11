//
//  PowerBallViewController.swift
//  FuturePicks
//
//  Created by Robert Martin on 10/30/17.
//  Copyright © 2017 Robert Martin. All rights reserved.

// TODO list: 1) arrays of variables should be using the struct created in the model 2) an array of labels will allow you to iterate through a loop 3) have random numbers stored in numeric order

import UIKit

class PowerBallViewController: UIViewController {

  @IBOutlet weak var num1: UILabel!
  @IBOutlet weak var num2: UILabel!
  @IBOutlet weak var num3: UILabel!
  @IBOutlet weak var num4: UILabel!
  @IBOutlet weak var num5: UILabel!
  @IBOutlet weak var powerBallNum: UILabel!
  
  var numberArray: [Int] = []
  // create an array of labels
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     var PBNumbers = generateAllTheNumbers(ballNumbers: 5, matrixToDrawFrom: pbNumbersAndDrawFreqMatrix())
     var PBPowerBallNumber = generateTheSpecialBall(matrixToPickFrom: pbPowerBallNumbersAndDrawFreqMatrix())
      
      
      //loop for 5 normal powerball numbers
      for numDraw in 0...4 {
        numberArray.append(PBNumbers[numDraw])
        print("The number \(numDraw + 1) number drawn is \(numberArray[numDraw])")
      }
      
      // change this to print each label in the loop (use map 0$)
      num1.text = String(numberArray[0])
      num2.text = String(numberArray[1])
      num3.text = String(numberArray[2])
      num4.text = String(numberArray[3])
      num5.text = String(numberArray[4])
      
      //the powerball number
      numberArray.append(PBPowerBallNumber)
      powerBallNum.text = String(PBPowerBallNumber)
      print("The Power Ball number drawn is \(PBPowerBallNumber)")
      
  
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
