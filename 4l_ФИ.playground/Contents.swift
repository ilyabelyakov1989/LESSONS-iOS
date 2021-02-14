import UIKit

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.

enum Engine: String {
    case on = "Запущен", off = "Выключен"
}

enum Windows: String {
    case open = "Открыты", close = "Закрыты"
}


class Car {
    var mark: String
    var year: Int
    var engine : Engine
    var windows: Windows
    
    static var carCount = 0
    
    init (mark: String, year: Int, engine: Engine, windows: Windows) {
        self.mark = mark
        self.year = year
        self.engine = engine
        self.windows = windows
        
        Car.carCount += 1
    }
    
    static func countInfo () {
        print("Выпущено \(carCount) автомобилей.")
    }
    
    func printCar () {
         print("Марка машины: \(mark)")
         print("Года выпуска: \(year)")
         print("Двигатель: \(engine.rawValue)")
         print("Окна: \(windows.rawValue)")
         print("_____________________________________")
     }
}

enum SportMode: String {
    case on = "Режим спорт включен" , off = "Режим спорт выключен"
}


class SportCar: Car {
    var maxSpeed: Int
    var sportMode : SportMode
    
    init(mark: String, year: Int, engine: Engine, windows: Windows, maxSpeed: Int, sportMode: SportMode) {
        
        self.maxSpeed = maxSpeed
        self.sportMode = sportMode
        
        super.init(mark: mark, year: year, engine: engine, windows: windows)
    }
    
    func onSportMode() {
        sportMode = .on
        print("Режим спорт включен")
    }
    
    func offSportMode(){
        sportMode = .off
        print("Режим спорт выключен")
    }
}

enum TrunkLoad {
    case trunkUpload(Int)
    case trunkUnload(Int)
}

class TrunkCar: Car {
    var maxCapacity: Int
    var loadTrunk: Int
    
    init(mark: String, year: Int, engine: Engine, windows: Windows, maxCapacity: Int, loadTrunk: Int) {
            self.maxCapacity = maxCapacity
            self.loadTrunk = loadTrunk
            super.init(mark: mark, year: year, engine: engine, windows: windows)
        }
    
    func action (_ action: TrunkLoad) {
        switch action {
          case .trunkUpload(let upload):
            loadTrunk += upload
            print("Загружено", upload)
          case .trunkUnload(let unload):
            loadTrunk -= unload
            print("Выгружено", unload)
        }
    }
}


var car1 = SportCar(mark: "Lambo", year: 2021, engine: .off, windows: .open, maxSpeed: 500, sportMode: .on)

var car2 = TrunkCar(mark: "Kamaz", year: 1988, engine: .on, windows: .close, maxCapacity: 1000, loadTrunk: 100)


car1.printCar()
print(car1.engine)
car1.engine = .on
print(car1.engine)
car1.offSportMode()
print("_______________________")

car2.printCar()
car2.windows = .open
car2.action(.trunkUnload(100))
car2.action(.trunkUpload(1000))
car2.printCar()

