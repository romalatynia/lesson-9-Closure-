//
//  ViewController.swift
//  Block
//
//  Created by Harbros47 on 22.12.20.
//

import UIKit

class ViewController: UIViewController {
    private var array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        blockFunc(block: ())
        
        let intArray = [4, 5, 7, 3, 1, 9, 0, 10, 231, -5]
        
        print(sortAscending(intArray: intArray))
        print(sortDescending(intArray: intArray))
        
        print(intFunc(array: intArray, block: { (value, value1) -> Bool in
                        value > value1 ?? 0 }))
        
        print(intFunc(array: intArray, block: { (value, value1) -> Bool in
                        value < value1 ?? 0 }))
        
        let string = "ячсмитьбю/эЖдлорпаВыфйцук567890зхъх-098ё7654321<>?:|}{_)(*&^%$#@!"
        
        newArray(string: string)
        print(sortArray(array: array))
        
    }
    
    private func blockFunc(block: ()) {
        for i in 1...10 {
            print(i)
            if i == 10 {
                block
//                print(i)
            }
        }
    }
    
    private func intFunc(array: [Int], block: (_ int1: Int, _ int2: Int?) -> Bool) -> Int {
        var newArray: Int?
        for compare in array {
            if block(compare, newArray) {
                newArray = compare
            }
        }
        return newArray ?? 0
    }
    
    private func sortAscending(intArray: [Int]) -> [Int] {
        intArray.sorted(by: <)
    }
    
    private func sortDescending(intArray: [Int]) -> [Int] {
        intArray.sorted(by: >)
    }
    
    private func comparison(string: String) -> Int {
        switch string.lowercased() {
        case "а", "е", "ё", "и", "о", "у", "ы", "э", "я", "ю":
            return 0
        case "б"..."ь" :
            return 1
        case "0"..."9" :
            return 2
        default:
            return 3
        }
    }
    
    private func newArray(string: String) {
        string.forEach { array.append(String($0)) }
    }
    
    private func sortArray(array: [String]) -> [String] {
        let sort = array.sorted {
            switch (comparison(string: $0), comparison(string: $1)) {
            case let(x, y) where x < y :
                return true
            case let(x, y) where x > y :
                return false
            default:
                return $0.lowercased() <= $1.lowercased()
            }
        }
        return sort
    }
}
