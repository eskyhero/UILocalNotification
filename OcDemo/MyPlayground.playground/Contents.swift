//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let ok = [1,2,3]
var mutableArray = Array<Int>()
mutableArray.append(2014)
//mutableArray[]

var mutableArr = Set<Int>()
mutableArr.sort()

var creditDictionary = Dictionary<String,Int>()
//creditDictionary.updateValue(88888, forKey: "Benson")
creditDictionary = [:]

var carArray = [String]()

carArray.append("Mercedes-Benz")
carArray.append("Toyota")
carArray.append("Porsche")

for car in carArray {
    print(car)
}

carArray.indexOf("Porsche")
for (index,value) in carArray.enumerate() {
    print("index\(index):\(value)")
}

var animalLegs = [String:Int]()

animalLegs.updateValue(4, forKey: "deer")
animalLegs.updateValue(8, forKey: "crab")
animalLegs.updateValue(2, forKey: "kangaroo")

for (animal,legs) in animalLegs {
    print("\(animal) has \(legs)leg(s)")
}

var ca1rArray = [String]()

carArray.append("Mercedes-Benz")
carArray.append("Toyota")
carArray.append("Porsche")

carArray[0] = "BMW"  // 奔驰被替换成宝马了 [ replace 操作]

var an1imalLegs = [String:Int]()

animalLegs.updateValue(4, forKey: "deer")
animalLegs.updateValue(8, forKey: "crab")
animalLegs.updateValue(2, forKey: "kangaroo")

animalLegs["sheep"] = 4     // 添加一个元素

animalLegs["deer"] = nil    // 删除一个元素

animalLegs["crab"] = 6      // 替换元素的值

if let legs = animalLegs["kangaroo"] {
    print("kangaroo has \(legs)legs")
} else {
    print("not defined")
}


var countryArray = ["China","Japan","Russia","India","Canada"]

var festivalDic = ["National's Day":"10-01","Christmas Day":"12-25","New Year":"01-01"]


var original = [1,2,3]

var steal = original

steal.append(4)

original.count // 3

steal.count    // 4