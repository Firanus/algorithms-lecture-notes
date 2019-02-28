import UIKit

extension Array {
    func knuthShuffled() -> Array {
        var elements = self
        for index in indices {
            let randomIndex = Int.random(in: index..<endIndex)
            elements.swapAt(index, randomIndex)
        }
        return elements
    }
}

var array = [2, 3, 7, 5, 77, 34, 12, 73, 98, 4, 0]
array.knuthShuffled()
array.knuthShuffled()
array.knuthShuffled()
array.knuthShuffled()
