//
//  Problem23.swift
//  euler
//
//  Created by David Grandinetti on 9/18/14.
//  Copyright (c) 2014 David Grandinetti. All rights reserved.
//

import Foundation

//
// A perfect number is a number for which the sum of its proper divisors is
// exactly equal to the number. For example, the sum of the proper divisors
// of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect
// number.
//
// A number n is called deficient if the sum of its proper divisors is less
// than n and it is called abundant if this sum exceeds n.
//
// As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
// number that can be written as the sum of two abundant numbers is 24. By
// mathematical analysis, it can be shown that all integers greater than
// 28123 can be written as the sum of two abundant numbers. However, this
// upper limit cannot be reduced any further by analysis even though it is
// known that the greatest number that cannot be expressed as the sum of two
// abundant numbers is less than this limit.
//
// Find the sum of all the positive integers which cannot be written as the
// sum of two abundant numbers.
//
class Problem23: EulerProblem {
  func properDivisors(n:Int) -> [Int] {
    return filter(1...n/2, { n % $0 == 0 })
  }
  
  func aliquotSum(n:Int) -> Int {
    return properDivisors(n).reduce(0,+)
  }
  
  func isAbundant(n:Int) -> Bool {
    return aliquotSum(n) > n
  }
  
  func allAbundantNumbersBelow(n:Int) -> [Int] {
    return filter(2..<n) { self.isAbundant($0) }
  }
  
  func allPairsAsSum(n:[Int], lessThan:Int) -> NSMutableSet {
    var sums = NSMutableSet()
    for head in n {
      for tail in n {
        if head + tail > lessThan { break; }
        sums.addObject(head+tail)
      }
    }
    return sums
  }

  override func run() {
    let abundantNumbers = allAbundantNumbersBelow(28123)
    let sums = allPairsAsSum(abundantNumbers, lessThan: 28123)
    var sum = filter(1...28123, { !sums.containsObject($0) }).reduce(0,+)
    println("sum = \(sum)")
  }
}