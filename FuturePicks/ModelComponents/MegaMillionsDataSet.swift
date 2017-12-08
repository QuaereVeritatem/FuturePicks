//
//  MegaMillionsDataSet.swift
//  FuturePicks
//
//  Created by Robert Martin on 9/6/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//
// Mega Millions draw frequencies last updated:   11/3/17
// [Just 100 draws of data]...data skewed since draw numbers changed

// ***New rules change : As of 10/31/17 ...it goes from 5 balls [1-75] + PB[1-15] to the current  5 balls [1-70] + PB[1-25]
// TODO list: 1) Seperate data (lotto# freq's) into its own file in resources folder 2) remove all logic (randomNumber, mmMegaBallNumbersAndDrawFreqMatrix and mmMegaBallNumbersAndDrawFreqMatrix) and place it in a 'controller' specific file

import Foundation

// Mega Millions numbers are from 1-70 (5 are drawn) and the "Mega Ball" numbers are from 1-25 (1 is drawn)
// 6 numbers in total are drawn and Mega ball CAN duplicate one of the other numbers drawn!
var mmNumberSet: [Int] =
  [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,
   31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,
   61,62,63,64,65,66,67,68,69,70]

// Frequency of how often each number from previous array gets picked(top10 are heavy hitters)
var mmNumberSetDrawFreq: [Int] = [7,7,7,9,9,9,7,4,5,5,7,7,8,6,3,7,9,7,3,9,5,3,7,10,4,9,6,10,4,10,12,7,15,9,7,3,8,6,8,3,7,7,6,4,8,2,7,3,10,6,11,6,11,6,5,9,4,11,5,7,4,5,6,5,3,6,5,5,8,3]

//this will add every element in the array and put the sum into mmNumberSetTotalDraws
var mmNumberSetTotalDraws: Int = mmNumberSetDrawFreq.reduce(0,+)

var mmMegaBallNumberSet: [Int] =
  [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]

// Frequency of how often each Power Ball from previous array gets picked
var mmMegaBallNumberSetDrawFreq: [Int] = [7,4,6,4,4,9,8,5,6,10,10,8,4,8,7,0,0,0,0,0,0,0,0,0,0]

//this will add every element in the array and put the sum into mmMegaBallNumberSetTotalDraws
var mmMegaBallNumberSetTotalDraws: Int = mmMegaBallNumberSetDrawFreq.reduce(0,+)

// NOT Finished .. this will allow us to generate random yet weighted numbers from arrays above
// func for powerball # will use parameter(pbPowerBallNumberSetDrawFreq) and reg numbers will use parameter(pbNumberSetDrawFreq)
// change all parameters to reflect Mega Millions file
/*
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
*/
func mmNumbersAndDrawFreqMatrix() -> [Int] {
  // return the matrix so we can draw numbers from it (delete this when we setup the return)
  var mmNumbersAndDrawFreqArray: [Int] = []
  for mmNumbers in mmNumberSet {
    for _ in mmNumberSetDrawFreq {
      //add the current pbNumbers to array, pbNumbersFreq amount of times
      mmNumbersAndDrawFreqArray.append(mmNumbers)
    }
  }
  return mmNumbersAndDrawFreqArray
}

func mmMegaBallNumbersAndDrawFreqMatrix() -> [Int] {
  // return the matrix so we can draw numbers from it (delete this when we setup the return)
  var mmMegaBallNumbersAndDrawFreqArray: [Int] = []
  for mmMegaBallNumbers in mmMegaBallNumberSet {
    for _ in mmMegaBallNumberSetDrawFreq {
      mmMegaBallNumbersAndDrawFreqArray.append(mmMegaBallNumbers)
    }
  }
  return mmMegaBallNumbersAndDrawFreqArray
}
