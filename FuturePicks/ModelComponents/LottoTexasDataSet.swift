//
//  LottoTexasDataSet.swift
//  FuturePicks
//
//  Created by Robert Martin on 9/6/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//
// Lotto Texas draw frequencies last updated: 11/3/17
// data from last 1000 draws
// TODO list: 1) Seperate data (lotto# freq's) into its own file in resources folder 2) remove all logic (randomNumber and ltNumbersAndDrawFreqMatrix) and place it in a 'controller' specific file

import Foundation

// numbers are from 1-54: 6 numbers are drawn
var ltNumberSet: [Int] =
  [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,
   31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54]

// Frequency of how often each number from previous array gets picked(top10 are heavy hitters)
var ltNumberSetDrawFreq: [Int] = [129,122,116,136,136,125,147,153,122,123,107,136,116,140,141,150,147,138,153,122,154,136,126,154,144,160,140,130,138,108,143,122,119,128,144,132,146,156,134,133,146,143,135,130,103,122,124,117,151,124,122,129,135,131]

//this will add every element in the array and put the sum into ltNumberSetTotalDraws
var ltNumberSetTotalDraws: Int = ltNumberSetDrawFreq.reduce(0,+)

// NOT Finished .. this will allow us to generate random yet weighted numbers from arrays above
// func for powerball # will use parameter(pbPowerBallNumberSetDrawFreq) and reg numbers will use parameter(pbNumberSetDrawFreq)
// change all parameters to reflect lotto Texas file
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
func ltNumbersAndDrawFreqMatrix() -> [Int] {
  // return the matrix so we can draw numbers from it (delete this when we setup the return)
  var ltNumbersAndDrawFreqArray: [Int] = []
  for ltNumbers in ltNumberSet {
    for _ in ltNumberSetDrawFreq {
      //add the current pbNumbers to array, ltNumbersFreq amount of times
      ltNumbersAndDrawFreqArray.append(ltNumbers)
    }
  }
  return ltNumbersAndDrawFreqArray
}

