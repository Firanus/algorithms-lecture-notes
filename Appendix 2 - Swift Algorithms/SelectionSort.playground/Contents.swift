import UIKit

// My original implementation on an array
extension Array where Element: Comparable {
    mutating func selectionSort() {
        for (index, _) in self.enumerated() {
            var min = index
            for (innerIndex, innerItem) in self[index...].enumerated() {
                if innerItem < self[min] {
                    min = innerIndex + index
                }
            }
            swapAt(min, index)
        }
    }
}

// A better implementation on MutableCollection
extension MutableCollection where Element: Comparable {
    func selectionSorted() -> Self {
        var elements = self
        for index in indices {
            let slice = elements[index...]
            let (_, minIndex) = zip(slice, slice.indices).min(by: { $0.0 < $1.0 })!
            elements.swapAt(minIndex, index)
        }
        return elements
    }
}

var array = [2, 3, 7, 5, 77, 34, 12, 73, 98, 4, 0]
array.selectionSorted()
