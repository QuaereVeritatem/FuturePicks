//
//  PowerBallDataSet.swift
//  FuturePicks
//
//  Created by Robert Martin on 8/25/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//
// info at http://www.powerball.com/powerball/pb_frequency.asp , http://myarkansaslottery.com/?q=games/powerball®-frequently-asked-questions
// POWERBALL draw frequencies last updated:  11/3/17

// TODO list: 1) Seperate data (lotto# freq's) into its own file in resources folder 2) remove all logic (randomNumber, pbNumbersAndDrawFreqMatrix and pbPowerBallNumbersAndDrawFreqMatrix) and place it in a 'controller' specific file

import Foundation

// PowerBall numbers are from 1-69 (5 are drawn) and the "Power Ball" numbers are from 1-26 (1 is drawn)
// 6 numbers in total are drawn and Power ball CAN duplicate one of the other numbers drawn!
var pbNumberSet: [Int] =
    [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,
     31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,
     61,62,63,64,65,66,67,68,69]

// Frequency of how often each number from previous array gets picked(top10 are heavy hitters)
var pbNumberSetDrawFreq: [Int] =
    [13,13,20,10,16,12,13,13,17,19,15,17,12,12,11,23,16,16,17,18,16,16,25,12,18,13,15,22,17,15,
     17,28,19,9,7,11,13,12,13,20,20,15,13,16,13,11,14,14,14,13,8,21,16,18,12,12,19,9,15,14,
     20,22,22,25,12,20,18,19,24]

//this will add every element in the array and put the sum into pbNumberSetTotalDraws
var pbNumberSetTotalDraws: Int = pbNumberSetDrawFreq.reduce(0,+)

var pbPowerBallNumberSet: [Int] =
    [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]

// Frequency of how often each Power Ball from previous array gets picked
var pbPowerBallNumberSetDrawFreq: [Int] =
    [7,7,9,9,9,9,6,9,14,11,8,9,9,3,10,6,10,5,11,7,10,9,6,10,9,6]

//this will add every element in the array and put the sum into pbPowerBallNumberSetTotalDraws
var pbPowerBallNumberSetTotalDraws: Int = pbPowerBallNumberSetDrawFreq.reduce(0,+)

// NOT Finished .. this will allow us to generate random yet weighted numbers from arrays above
// func for powerball # will use parameter(pbPowerBallNumberSetDrawFreq) and reg numbers will use parameter(pbNumberSetDrawFreq)
func randomNumber(probabilities: [Double]) -> Int {
    
    // Sum of all probabilities (so that we dont have to require that the sum is 1.0):
    let sum = probabilities.reduce(0, +)
    // Random number in the range 0.0 <= rnd < dum :
    let rnd = sum * Double(arc4random_uniform(UInt32.max)) / Double(UInt32.max)
    // Find the first interval of accumulated probabilities in to which 'rnd' falls:
    var accum = 0.0
    for (i, p) in probabilities.enumerated() {
        accum += p
        if rnd < accum {
            return i
        }
    }
    // This point mght be reached due to floating point inaccuracies:
    return (probabilities.count - 1)
}

func pbNumbersAndDrawFreqMatrix() -> [Int] {
  // return the matrix so we can draw numbers from it (delete this when we setup the return)
  var pbNumbersAndDrawFreqArray: [Int] = []
  for pbNumbers in pbNumberSet {
    for _ in pbNumberSetDrawFreq {
      //add the current pbNumbers to array, pbNumbersFreq amount of times
      pbNumbersAndDrawFreqArray.append(pbNumbers)
    }
  }
  return pbNumbersAndDrawFreqArray
}

func pbPowerBallNumbersAndDrawFreqMatrix() -> [Int] {
  // return the matrix so we can draw numbers from it (delete this when we setup the return)
  var pbPowerBallNumbersAndDrawFreqArray: [Int] = []
  for pbPowerBallNumbers in pbPowerBallNumberSet {
    for _ in pbPowerBallNumberSetDrawFreq {
     pbPowerBallNumbersAndDrawFreqArray.append(pbPowerBallNumbers)
    }
  }
  return pbPowerBallNumbersAndDrawFreqArray
}







