import UIKit

// Collection need to be both Mutable and Bidirectional. Array is only class
// that satisfies both requirements
extension Array where Element: Comparable {
    func insertionSorted() -> Array {
        var elements = self
        for index in indices {
            var activeIndex = index
            while activeIndex > startIndex && elements[activeIndex] < elements[elements.index(before: activeIndex)] {
                elements.swapAt(activeIndex, elements.index(before: activeIndex))
                activeIndex = elements.index(before: activeIndex)
            }
        }
        return elements
    }
}

var array = [2, 3, 7, 5, 77, 34, 12, 73, 98, 4, 0]
array.insertionSorted()
