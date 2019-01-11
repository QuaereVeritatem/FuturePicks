//
//  LottoTexasViewController.swift
//  FuturePicks
//
//  Created by Robert Martin on 10/30/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//

import UIKit

class LottoTexasViewController: UIViewController {

  var numberArray: [Int] = []
  @IBOutlet weak var num1: UILabel!
  @IBOutlet weak var num2: UILabel!
  @IBOutlet weak var num3: UILabel!
  @IBOutlet weak var num4: UILabel!
  @IBOutlet weak var num5: UILabel!
  @IBOutlet weak var num6: UILabel!
  
    override func viewDidLoad() {
      super.viewDidLoad()
      var LTNumbers = generateAllTheNumbers(ballNumbers: 6, matrixToDrawFrom: ltNumbersAndDrawFreqMatrix())

  //loop for 5 normal powerball numbers
  for numDraw in 0..<LTNumbers.count {
  numberArray.append(LTNumbers[numDraw])
  print("The number \(numDraw + 1) number drawn is \(numberArray[numDraw])")
  }
  
  // change this to print each label in the loop (use map 0$)
  num1.text = String(numberArray[0])
  num2.text = String(numberArray[1])
  num3.text = String(numberArray[2])
  num4.text = String(numberArray[3])
  num5.text = String(numberArray[4])
  num6.text = String(numberArray[5])
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
