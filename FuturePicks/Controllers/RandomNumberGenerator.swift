//
//  RandomNumberGenerator.swift
//  FuturePicks
//
//  Created by Robert Martin on 9/9/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//
// this will work for lotto texas, mega millions and powerball [COMPLETED]

import Foundation

// ask for number of balls/numbers that need to be generated randomly (not including special balls) then generate them
func generateAllTheNumbers(ballNumbers: Int, matrixToDrawFrom: [Int]) -> [Int] {
  let numberOfBalls = ballNumbers
  var matrix = matrixToDrawFrom
  //temp storage number
  var temp: Int = 0
  var ballNumbersAre: [Int] = []
  var ballNumbersSet = Set<Int>()
  
  for _ in 0...(numberOfBalls-1) {
    // randomly pick a number from 'matrix' and
    temp = matrix[Int(arc4random_uniform(UInt32(matrix.count)))]
    
    //loop while number temp is in the set (re-randomize in while loop)
    while ballNumbersSet.contains(temp) {
      temp = matrix[Int(arc4random_uniform(UInt32(matrix.count)))]
    }
    
    // assign/append that number to a set (so no repeats)
    ballNumbersSet.insert(temp)
    // if the number is not in the set already then append to array 'ballNumbersAre'
    ballNumbersAre.append(temp)
  }
  return ballNumbersAre
}


// will also have a func that generates random numbers for the special ball
func generateTheSpecialBall(matrixToPickFrom: [Int]) -> Int {
  var matrixNet = matrixToPickFrom
  var theOne: Int = 0
  
  // randomly pick a number from 'matrixNet' and assign to theOne
  theOne = matrixNet[Int(arc4random_uniform(UInt32(matrixNet.count)))]
  
  return theOne
}
