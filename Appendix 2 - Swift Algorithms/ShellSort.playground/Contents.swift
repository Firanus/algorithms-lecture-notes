import UIKit

// For identical reasons to the insertion sort (our collection must be both
// mutable and bidirectional) we have to extend an array. We use a 3x+1 sequence
extension Array where Element: Comparable {
    func shellSorted() -> Array {
        var elements = self
        
        var h = 1
        while h < (count-1) / 3 {
            h = (h * 3) + 1
        }
        
        while h > 0 {
            for index in indices {
                var activeIndex = index
                while activeIndex >= startIndex + h,
                    elements[activeIndex] < elements[elements.index(activeIndex, offsetBy: -h)] {
                        let compareIndex = elements.index(activeIndex, offsetBy: -h)
                        elements.swapAt(activeIndex, compareIndex)
                        activeIndex = compareIndex
                }
            }
            
            h = (h - 1) / 3
        }
        
        return elements
    }
}

var array = [2, 3, 7, 5, 77, 34, 12, 73, 98, 4, 0]
array.shellSorted()
