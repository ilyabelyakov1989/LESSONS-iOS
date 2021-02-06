import UIKit

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum Engine: String {
    case on = "Запущен", off = "Выключен"
}

enum Windows: String {
    case open = "Открыты", close = "Закрыты"
}

enum CarAction {
    case engineAction(Engine)
    case windowsAction(Windows)
    case loadTrunk(Int)
}

struct Car {
    let markauto: String
    let yearOfCar: Int
    var loadTrunk: Int = 0
    var maxTrunkLoad: Int {
        didSet {
            let emptyAfterSomeLoad = maxTrunkLoad - loadTrunk
            print("В багажнике осталось для заполнения \(emptyAfterSomeLoad) кг ")
        }
    }
    var engine : Engine
    var windows : Windows
    
    init(mark: String, year: Int, maxTrunkLoad: Int, engine: Engine, windows : Windows) {
        self.markauto = mark
        self.yearOfCar = year
        self.maxTrunkLoad = maxTrunkLoad
        self.engine = .off
        self.windows = .close
}
    
    mutating func makeAction(carAction: CarAction) {
      switch carAction {
      case .loadTrunk (let load):
        if load < maxTrunkLoad {
            print("Загрузили \(load). Еще есть свободное место в багажнике.")
          } else if load == maxTrunkLoad {
            print("Загрузили \(load). Места больше нет.")
        } else {
            print("Выньте что нибудь - переполнено!")
          }
      case .engineAction(let engineState):
          self.engine = engineState
      case .windowsAction(let windowsState):
          self.windows = windowsState
      }
    }
}

    
    
func printCar (car: Car) {
    print("Марка машины: \(car.markauto)")
    print("Года выпуска: \(car.yearOfCar)")
    print("Вместимость багажника: \(car.maxTrunkLoad) кг")
    print("Двигатель: \(car.engine.rawValue)")
    print("Окна: \(car.windows.rawValue)")
    print("_____________________________________")
}

var sportCar = Car(mark: "Honda", year: 1988, maxTrunkLoad: 150, engine: .off, windows: .close)

var trunkCar = Car(mark: "KAMAZ", year: 1976, maxTrunkLoad: 2000, engine: .on, windows: .open)

printCar(car: sportCar)
sportCar.makeAction(carAction: .loadTrunk(30))
sportCar.makeAction(carAction: .engineAction(.on))
sportCar.makeAction(carAction: .windowsAction(.open))
printCar(car: sportCar)

printCar(car: trunkCar)
trunkCar.makeAction(carAction: .engineAction(.off))
trunkCar.makeAction(carAction: .windowsAction(.close))
trunkCar.makeAction(carAction: .loadTrunk(2005))
printCar(car: trunkCar)
