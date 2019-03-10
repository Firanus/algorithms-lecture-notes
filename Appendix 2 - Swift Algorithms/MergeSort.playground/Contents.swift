import UIKit

// Collection need to be both Mutable and RandomAccess. Array is only class
// that satisfies both requirements
extension Array where Element: Comparable {
    
    // MARK: - Regular Merge sort (without optimizations)
    
    func mergeSorted() -> Array {
        var elements = self

        mergeSort(array: &elements, loIndex: elements.startIndex, hiIndex: elements.index(before: elements.endIndex))
        
        return elements
    }
    
    private func mergeSort(array: inout Array, loIndex: Index, hiIndex: Index) {
        let indexSeperation = array.distance(from: loIndex, to: hiIndex)
        guard indexSeperation > 0 else { return }
        
        let midIndex = array.index(loIndex, offsetBy: indexSeperation / 2)
    
        mergeSort(array: &array, loIndex: loIndex, hiIndex: midIndex)
        mergeSort(array: &array, loIndex: array.index(after: midIndex), hiIndex: hiIndex)
        merge(array: &array, loIndex: loIndex, midIndex: midIndex, hiIndex: hiIndex)
    }
    
    // MARK: - Bottom Up Merge sort
    
    func bottomUpMergeSorted() -> Array {
        var elements = self
        
        var size = 1
        while size < elements.count {
            var index = elements.startIndex
            while index < elements.endIndex - size {
                let theoreticalFinalIndex = elements.index(index, offsetBy: 2*size - 1)
                let actualFinalIndex = theoreticalFinalIndex >= elements.endIndex ? elements.index(before: elements.endIndex) : theoreticalFinalIndex
                merge(array: &elements, loIndex: index, midIndex: index + size - 1, hiIndex: actualFinalIndex)
                
                index = elements.index(index, offsetBy: 2 * size)
            }
                
            size = size * 2
        }
        
        return elements
    }
    
    // MARK: - Utility merge method
    
    private func merge(array: inout Array, loIndex: Index, midIndex: Index, hiIndex: Index) {
        let auxLo = array[loIndex...midIndex]
        let auxHi = array[array.index(after: midIndex)...hiIndex]

        var i = auxLo.startIndex
        var j = auxHi.startIndex
        var k = loIndex
        
        while k <= hiIndex {
            if i >= auxLo.endIndex {
                array[k] = auxHi[j]
                j = auxHi.index(after: j)
            }
            else if j >= auxHi.endIndex {
                array[k] = auxLo[i]
                i = auxLo.index(after: i)
            }
            else if auxHi[j] < auxLo[i] {
                array[k] = auxHi[j]
                j = auxHi.index(after: j)
            }
            else {
                array[k] = auxLo[i]
                i = auxLo.index(after: i)
            }
            k = array.index(after: k)
        }
    }
}

var array = [7, 2, 3, 5, 77, 34, 12, 73, 98, 4, 0]
array.bottomUpMergeSorted()

