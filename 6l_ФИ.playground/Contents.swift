import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

struct GenericQueue<QueueT> {
    var elements: [QueueT] = []
    
    mutating func queueIn(_ element: QueueT) {
        elements.append(element)
    }
    
    mutating func queueFrom() -> QueueT? {
        guard elements.count > 0 else { return nil }
        return elements.removeFirst()
    }
}

extension GenericQueue {
    func filter(predicate: (QueueT) -> Bool) -> [QueueT] {
        var res = [QueueT]()
        for element in elements {
            if predicate(element) {
                res.append(element)
            }
        }
        return res
    }
    
    subscript (elementsInt: Int) -> String? {
        var answer = ""
        if elementsInt > elements.count - 1 {
            return nil
        } else {
            answer = "\(elements[elementsInt])"
        }
        return answer
    }
}

var queueCollection = GenericQueue<Int>()
queueCollection.queueIn(1)
queueCollection.queueIn(2)
queueCollection.queueIn(3)
queueCollection.queueIn(4)
queueCollection.queueIn(5)
queueCollection.queueIn(8)
queueCollection.queueIn(6)
queueCollection.queueIn(12)
print(queueCollection)

queueCollection.queueFrom()
queueCollection.queueFrom()
queueCollection.queueFrom()
queueCollection.queueFrom()

print(queueCollection)

queueCollection[2]

let filteredCollection = queueCollection.filter { $0 % 2 == 0 }
filteredCollection

filteredCollection.sorted(by: <)
filteredCollection.sorted(by: >)

queueCollection.elements.sorted(by: <)
queueCollection.elements.sorted(by: >)
