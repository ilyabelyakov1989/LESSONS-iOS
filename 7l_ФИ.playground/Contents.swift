import UIKit

//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//
//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

struct DescriptionAtraction {
    var volumeOfAtraction: Int
    let nameOfAtraction: String
    var price: Int
    var countTicket: Int
}

enum Errors: Error {
    case invalidAtraction
    case outOfStock
    case noFunds(moneyNeeded: Double)
}

var moneyHave = 10_000

class Atraction {
    var atraction = ["CAR": DescriptionAtraction(volumeOfAtraction: 40, nameOfAtraction: "Машинки", price: 70, countTicket: 10),
                     "DAR": DescriptionAtraction(volumeOfAtraction: 2, nameOfAtraction: "Дартс", price: 100, countTicket: 100),
                     "WHE": DescriptionAtraction(volumeOfAtraction: 100, nameOfAtraction: "Колесо обозрения", price: 100, countTicket: 150),
                     "MIR": DescriptionAtraction(volumeOfAtraction: 30, nameOfAtraction: "Кривые зеркала", price: 20_000, countTicket: 17)]
    
    
    func findDescription(atractionCode: String) -> (DescriptionAtraction?, Errors?) {
        guard let descriptionAtraction = atraction[atractionCode] else {
            return (nil, Errors.invalidAtraction)
        }
        return (descriptionAtraction, nil)
    }
    
    func buyTicket(atractionCode: String) throws -> DescriptionAtraction {
        guard let descriptionAtraction = atraction[atractionCode] else {
            throw Errors.invalidAtraction
        }
        guard descriptionAtraction.countTicket > 0 else {
            throw Errors.outOfStock
        }
        guard descriptionAtraction.price <= moneyHave else {
            throw Errors.noFunds(moneyNeeded: Double(descriptionAtraction.price - moneyHave))
        }
        
        moneyHave -= descriptionAtraction.price
        var newDescription = descriptionAtraction
        newDescription.countTicket -= 1
        atraction[atractionCode] = newDescription
        return newDescription
    }
}

let atraction = Atraction()
let descriptionAtraction = atraction.findDescription(atractionCode: "ФФФ")
if let description = descriptionAtraction.0 {
    print("По вашему запросу найден атракцион: \(description.nameOfAtraction)")
} else if descriptionAtraction.1 != nil {
    print("Произошла ошибка: Не найден атракцион")
}

do {
    let purchase1 = try atraction.buyTicket(atractionCode: "CAR")
    print("По вашему запросу найден aтракцион: \(purchase1.nameOfAtraction) и куплен билет. Билетов осталось: \(purchase1.countTicket)")
    print("Денег в кошельке \(moneyHave)")
} catch Errors.invalidAtraction {
    print("С кодом \(atraction) не существует атракциона")
} catch Errors.outOfStock {
    print("На атракцион нет билетов в продаже.")
}catch Errors.noFunds(let moneyNeeded) {
    print("В кошельке недостаточно денег. У вас в кошельке \(moneyHave), а необходимо \(moneyNeeded)")
} catch let error {
    print("Произошла ошибка: \(error.localizedDescription)")
}


do {
    let purchase2 = try atraction.buyTicket(atractionCode: "MIR")
    print("По вашему запросу найден aтракцион: \(purchase2.nameOfAtraction) и куплен билет. Билетов осталось: \(purchase2.countTicket)")
    print("Денег в кошельке \(moneyHave)")
} catch Errors.invalidAtraction {
    print("Не существует атракциона")
} catch Errors.outOfStock {
    print("В аэропорту нет билетов в продаже.")
}catch Errors.noFunds(let moneyNeeded) {
    print("В кошельке недостаточно денег. У вас в кошельке \(moneyHave), а необходимо \(moneyNeeded)")
} catch let error {
    print("Произошла ошибка: \(error.localizedDescription)")
}

do {
    let purchase3 = try atraction.buyTicket(atractionCode: "DED")
    print("По вашему запросу найден aтракцион: \(purchase3.nameOfAtraction) и куплен билет. Билетов осталось: \(purchase3.countTicket)")
    print("Денег в кошельке \(moneyHave)")
} catch Errors.invalidAtraction {
    print("Не существует атракциона")
} catch Errors.outOfStock {
    print("Нет билетов в продаже.")
}catch Errors.noFunds(let moneyNeeded) {
    print("В кошельке недостаточно денег. У вас в кошельке \(moneyHave), а необходимо \(moneyNeeded)")
} catch let error {
    print("Произошла ошибка: \(error.localizedDescription)")
}
