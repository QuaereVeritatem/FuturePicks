//
//  ViewController.swift
//  FuturePicks
//
//  Created by Robert Martin on 8/24/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//
// This app will random pick numbers(6) based on most drawn numbers and most drawn patterns as well as other criteria
// Other considerations to think about:
//    Odd/Even patterns (2/4, 3/3 and 4/2)
//    Top Drawn/Rarely drawn patterns (2/4, 3/3 and 4/2) 5/1 and 1/5?
//    Sequential numbers VS No Sequential numbers
//    future patterns [amount of numbers under 20]

//app will be based on powerball numbers (at first)

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

  @IBOutlet weak var chooseAlottoGame: UIPickerView!
  
  @IBAction func playBtn(_ sender: UIButton) {
    switch gameChoice {
    case 0: print("We going to screen 1, to play Power Ball")
      performSegue(withIdentifier: "powerBallSegue", sender: sender)
    case 1: print("We going to screen 2, to play Lotto Texas")
      performSegue(withIdentifier: "lottoTexasSegue", sender: sender)
    case 2: print("We going to screen 3, to play Mega Millions")
      performSegue(withIdentifier: "megaMillionsSegue", sender: sender)
    default: print("We aint going no where!")
    }
  }
  
  //screen choice
  var gameChoice: Int = 0 //0 will the the choice until actually selected (it starts on 1st choice by default); then it will be (0, 1 or 2)
  
  //selection of lotto games to play
  var pickerData: [String] = [String]()
  
    override func viewDidLoad() {
      super.viewDidLoad()
       //this should be stored elsewhere
       pickerData = ["Power Ball", "Lotto Texas", "Mega Millions"]
      
      
       self.chooseAlottoGame.delegate = self as? UIPickerViewDelegate
       self.chooseAlottoGame.dataSource = self as? UIPickerViewDataSource

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  // **** All pickerView functions should be in their own file... same with all tableView functions
  
  // The number of columns of data
  func numberOfComponents(in: UIPickerView) -> Int {
    return 1
  }
  
  // The number of rows of data
  func pickerView(_: UIPickerView, numberOfRowsInComponent: Int) -> Int {
    return pickerData.count
  }
  
  // The data to return for the row and component (column) that's being passed in
  func pickerView(_: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return pickerData[row]
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    // do something with selected row
    switch row {
     case 0: gameChoice = 0
     case 1: gameChoice = 1
     case 2: gameChoice = 2
    default: print("We aint going no where!")
    }
    
  }
  
  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    
    var pickerLabel : UILabel    
    if let label = view as? UILabel {
      pickerLabel = label
    } else {
      // If view is nil, no UIView is available to recycle, so create a new one!
      pickerLabel = UILabel()
      // Programmaticly set the label's background!
      let hue = CGFloat(row)/CGFloat(pickerData.count)
      //pickerLabel.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 0.3)
    }
    let titleData = pickerData[row]
    let myTitle = NSAttributedString(string: titleData, attributes: convertToOptionalNSAttributedStringKeyDictionary([convertFromNSAttributedStringKey(NSAttributedString.Key.font):UIFont(name: "Georgia", size: 36.0)!,convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor):UIColor.white]))
    pickerLabel.attributedText = myTitle
    pickerLabel.textAlignment = .center
    return pickerLabel
  }

}


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}
