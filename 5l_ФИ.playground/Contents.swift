import UIKit

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести сами объекты в консоль.

enum Engine: String {
    case on = "Заведен", off = "Выключен"
}

enum Windows: String {
    case open = "Открыты", close = "Закрыты"
}


enum GeneralActions {
    case engineState(Engine)
    case windowsState(Windows)
}


enum Actions {
     case trunkUpload(Int)
     case trunkUnload(Int)
     case sportMode
}


// Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
protocol Car {
    var mark: String {get set}
    var year: Int {get set}
    var engine: Engine { get set }
    var windows: Windows {get set}
    func action (_ action: Actions)
}


//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

extension Car {
    mutating func generalAction (_ action: GeneralActions) {
        switch action {
        case .engineState (let engineState):
            self.engine = engineState
        case .windowsState (let windowsState):
            self.windows = windowsState
        }
    }
    
    func printCar () {
        print("Марка машины: \(mark)")
        print("Года выпуска: \(year)")
        print("Двигатель: \(engine.rawValue)")
        print("Окна: \(windows.rawValue)")
        print("_____________________________________")
    }
}

//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

class TrunkCar: Car {
    
    var mark: String
    var year: Int
    var engine: Engine
    var windows: Windows
    var loadTrunk: Int
    
    func action (_ action: Actions) {
        switch action {
        case .trunkUpload(let upload):
            loadTrunk += upload
            print("Загружено", upload)
        case .trunkUnload(let unload):
            loadTrunk -= unload
            print("Выгружено", unload)
        default:
            print("Невозможно выполнить действие для такой машины")
        }
    }
    
    init(mark: String, year: Int, engine: Engine, windows: Windows, loadTrunk: Int) {
        self.mark = mark
        self.year = year
        self.engine = engine
        self.windows = windows
        self.loadTrunk = loadTrunk
    }
}

class SportCar: Car {

    var mark: String
    var year: Int
    var engine: Engine
    var windows: Windows
    var sportMode: Bool
    
    func action(_ action: Actions) {
        switch action {
        case .sportMode:
            sportMode = true
            print("Режит Спорт включен")
            sportMode = false
        default:
            print("Невозможно выполнить действие для такой машины")
        }
    }
    
    init(mark: String, year: Int, engine: Engine, windows: Windows, sportMode: Bool) {
        self.mark = mark
        self.year = year
        self.engine = engine
        self.windows = windows
        self.sportMode = sportMode
    }
}

// 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

extension TrunkCar: CustomStringConvertible{
    var description: String {
        return("Грузовик, его можно загрузжать тоннами груза")
    }
}

extension SportCar: CustomStringConvertible{
    var description: String {
        return("Спортивная машина может включить режим Sport")
    }
}

var car1 = SportCar(mark: "Honda", year: 1998, engine: .off, windows: .close, sportMode: true)
print(car1)
car1.generalAction(.windowsState(.open))
car1.action(.sportMode)
car1.action(.trunkUpload(68))
car1.printCar()


var car2 = TrunkCar(mark: "KAMAZ", year: 1976, engine: .on, windows: .open, loadTrunk: 400)
print(car2)
car2.generalAction(.engineState(.off))
car2.action(.trunkUpload(70))
car2.action(.trunkUnload(30))
car2.action(.sportMode)
car2.printCar()
