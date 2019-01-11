//
//  MegaMillionsViewController.swift
//  FuturePicks
//
//  Created by Robert Martin on 10/30/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//

import UIKit

class MegaMillionsViewController: UIViewController {

  @IBOutlet weak var num1: UILabel!
  @IBOutlet weak var num2: UILabel!
  @IBOutlet weak var num3: UILabel!
  @IBOutlet weak var num4: UILabel!
  @IBOutlet weak var num5: UILabel!
  @IBOutlet weak var megaBallNum: UILabel!
  
  var numberArray: [Int] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
      // Do any additional setup after loading the view.
      var MMNumbers = generateAllTheNumbers(ballNumbers: 5, matrixToDrawFrom: pbNumbersAndDrawFreqMatrix())
      var MMMegaBallNumber = generateTheSpecialBall(matrixToPickFrom: pbPowerBallNumbersAndDrawFreqMatrix())
      
      
      //loop for 5 normal powerball numbers
      for numDraw in 0...4 {
        numberArray.append(MMNumbers[numDraw])
        print("The number \(numDraw + 1) number drawn is \(numberArray[numDraw])")
      }
      
      // change this to print each label in the loop (use map 0$)
      num1.text = String(numberArray[0])
      num2.text = String(numberArray[1])
      num3.text = String(numberArray[2])
      num4.text = String(numberArray[3])
      num5.text = String(numberArray[4])
      
      //the powerball number
      numberArray.append(MMMegaBallNumber)
      megaBallNum.text = String(MMMegaBallNumber)
      print("The Power Ball number drawn is \(MMMegaBallNumber)")
  }
}
