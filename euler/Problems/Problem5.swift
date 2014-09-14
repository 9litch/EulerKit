//
// 2520 is the smallest number that can be divided by each of
// the numbers from 1 to 10 without any remainder.
//
// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
//

class Problem5: EulerProblem {

  override func run() {
    println(smallestDivisibleUpTo(20))
  }

  func smallestDivisibleUpTo(i:Int, current:Int = 1) -> Int {
    if current.isDivisibleUpTo(i) {
      return current
    }
    return smallestDivisibleUpTo(i, current:current+1)
  }
}
