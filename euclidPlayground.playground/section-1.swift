import Foundation

//var rows:[[Int]] = [
//[75],
//[95, 64],
//[17, 47, 82],
//[18, 35, 87, 10],
//[20, 04, 82, 47, 65],
//[19, 01, 23, 75, 03, 34],
//[88, 02, 77, 73, 07, 63, 67],
//[99, 65, 04, 28, 06, 16, 70, 92],
//[41, 41, 26, 56, 83, 40, 80, 70, 33],
//[41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
//[53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
//[70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
//[91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
//[63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
//[04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23]
//]
//
//for i in stride(from: rows.count-2, through: 0, by: -1) {
//  for j in 0..<rows[i].count {
//    rows[i][j] = rows[i][j] + max(rows[i+1][j],rows[i+1][j+1])
//  }
//}
//rows[0]
////
//// The Drake method, start from the bottom.
//// You don't need to know the specific route, only the maximum sum.
////

//reduce(1...10,0,+)

//let sum = (1...10).map({n in n*n}).reduce(0,+)
//print(sum)


//(1...10).map({ n in n*n }) // .reduce(0,+)
//(1...10).reduce(0) { $0 * $0 }


//extension Int {
//    func isMultipleOf(i: Int) -> Bool {
//        if i == 0 { return false }
//        return self % i == 0
//    }
//}
//
//let sum = filter(1...999, { $0.isMultipleOf(3) || $0.isMultipleOf(5) }).reduce(0,+)

var arr = [1,2,3,2,1,25]
var arr2 = arr.filter {$0 != 2}
println(arr2)

