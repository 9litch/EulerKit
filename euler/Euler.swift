//
//  Euler.swift
//  euler
//
//  Created by David Grandinetti on 9/2/14.
//  Copyright (c) 2014 David Grandinetti. All rights reserved.
//

import Foundation

private var eulerProblems = Dictionary<Int, AnyObject>()

class EulerProblem {
  
  class func registerProblems() {
    registerProblem(1, obj:Problem1())
    registerProblem(2, obj:Problem2())
    registerProblem(3, obj:Problem3())
    registerProblem(4, obj:Problem4())
    registerProblem(5, obj:Problem5())
    registerProblem(6, obj:Problem6())
    registerProblem(7, obj:Problem7())
    registerProblem(8, obj:Problem8())
    registerProblem(9, obj:Problem9())
    registerProblem(10, obj:Problem10())
    registerProblem(11, obj:Problem11())
    registerProblem(12, obj:Problem12())
    registerProblem(13, obj:Problem13())
    registerProblem(14, obj:Problem14())
    registerProblem(16, obj:Problem16())
    registerProblem(17, obj:Problem17())
    registerProblem(18, obj:Problem18())
  }
  
  class func registerProblem(num:Int, obj:AnyObject) {
    eulerProblems[num] = obj
  }
  
  func run() {
    println("OVERRIDE ME")
  }
  
  class func problems() -> Dictionary<Int, AnyObject> {
    return eulerProblems
  }
}

//
// extensions to base classes
//

private var primeCache = Dictionary<Int, Int>()

extension Int {
  func isMultipleOf(i: Int) -> Bool {
    return (i == 0 ? false : self % i == 0 )
  }
  
  func isMultipleOf(nums:[Int]) -> Bool {
    for i in nums {
      if self.isMultipleOf(i) {
        return true
      }
    }
    return false
  }
  
  func isDivisibleUpTo(max:Int) -> Bool {
    for i in stride(from: max, through: 2, by: -1) {
      if self % i != 0 {
        return false
      }
    }
    return true
  }
  
  func even() -> Bool {
    return self % 2 == 0
  }
  func odd() -> Bool {
    return !self.even()
  }
  
  func isPrime() -> Bool {
    if self < 2 {
      return false
    }
    if self == 2 || self == 3 {
      return true
    }
    if self % 2 == 0 {
      return false
    }
    if let cachedVal = primeCache[self] {
      return true
    }
    
    let squareRoot:Int = Int(sqrt(Float(self)))
    let upperBound = squareRoot
    for i in 3...upperBound {
      if self % i == 0 {
        return false
      }
    }
    primeCache[self] = 1
    return true
  }

  func primeFactors() -> [Int] {
    var current = self
    var factors = Dictionary<Int,Int>()
    var try = 2
    
    while try <= current {
      if try.isPrime() && (current % try == 0) {
        current = current / try
        if let f = factors[try] {
          factors[try] = f+1
        } else {
          factors[try] = 1
        }
      } else {
        try++
      }
    }
    
    return Array(factors.values)
  }
  
  func factorial() -> Int {
    if self == 1 {
      return 1
    }
    return self * (self-1).factorial()
  }
}

extension String {
  var length: Int { return countElements(self) }
  
  subscript(i: Int) -> String {
    return String(Array(self)[i])
  }
}

//
// sequence tools
//

//
// An infinite sequence of Fibonacci numbers
//
class FibonacciSequence: SequenceType {
  func generate() -> GeneratorOf<Int> {
    var last = 0
    var current = 1
    
    return GeneratorOf<Int> {
      let next = last + current
      last = current
      current = next
      return next
    }
  }
}

//
// An infinite sequence of Prime numbers
//

class PrimeSequence: SequenceType {
  func generate() -> GeneratorOf<Int> {
    var currentPrime = 1
    var nextPrime = 1
    
    return GeneratorOf<Int> {
      nextPrime = currentPrime+1
      while !nextPrime.isPrime() {
        nextPrime += 1
      }
      currentPrime = nextPrime
      return nextPrime
    }
  }
}

//
// A wrapper to stop a Sequence when it grows to
// a maximum value.
//
class MaxLimitSequence<S: SequenceType, T where T == S.Generator.Element, T:Comparable>: SequenceType {
  let max:T
  var sequence:S
  
  init(max:T, sequence:S) {
    self.max = max
    self.sequence = sequence
  }
  
  func generate() -> GeneratorOf<T> {
    var generator = self.sequence.generate()
    
    return GeneratorOf<T> {
      var next = generator.next()
      if next != .None && next < self.max {
        return next
      }
      return .None
    }
  }
}

//
// A wrapper to stop a Sequence after it emits a certain
// number of elements.
//
class MaxCountSequence<S: SequenceType, T where T == S.Generator.Element>: SequenceType {
  let max:Int
  var counter:Int
  var sequence:S
  
  init(max:Int, sequence:S) {
    self.max = max
    self.sequence = sequence
    self.counter = 0
  }
  
  func generate() -> GeneratorOf<T> {
    var generator = self.sequence.generate()
    
    return GeneratorOf<T> {
      var next = generator.next()
      self.counter += 1
      if next != nil && (self.counter < self.max) {
        return next
      }
      return .None
    }
  }
}
