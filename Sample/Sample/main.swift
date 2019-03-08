//
//  main.swift
//  Sample
//
//  Created by Avinash Singh on 10/02/19.
//  Copyright © 2019 Avinash Singh. All rights reserved.
//

import Foundation

print("Hello, World!")

let array = [7, 2, 6, 3, 9, 5]

//Merge Sort implementation
func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    //Exit condition when the count drops to 1
    guard array.count > 1 else {
        return array
    }
    
    let middleIndex = array.count/2
    
    //Call merge sort recursively to  split the array till only 1 element is left in it.
    let leftArray = mergeSort( Array(array[0..<middleIndex]))
    let rightArray =  mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
}

private func merge<T: Comparable>(_ left:[T], _ right: [T]) -> [T]{
    var leftIndex = 0
    var rightIndex = 0
    var sortedArray : [T] = []
    
    //Merge logic
    while leftIndex < left.count && rightIndex < right.count{
        let leftElement =  left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement{
            sortedArray.append(leftElement)
            leftIndex += 1
        }else if leftElement > rightElement{
            sortedArray.append(rightElement)
            rightIndex += 1
        }else{
            sortedArray.append(leftElement)
            leftIndex += 1
            sortedArray.append(rightElement)
            rightIndex += 1
        }
        
    }
    
    while leftIndex < left.count {
        sortedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        sortedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return sortedArray
}
print(array)
print(mergeSort(array))
