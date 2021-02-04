import UIKit

// 1.Решить квадратное уравнение. ax2 + bx + c = 0

var a: Double = 5.0
var b: Double = 10.0
var c: Double = 2.0
var x1: Double = 0
var x2: Double = 0

let discriminant = (b*b) - (4*a*c)

if discriminant < 0
{
    print("None")
}

if discriminant == 0
{
    x1 = (-b) / (2*a)
    print("Дискриминант равен нулю, уравнение имеет один корень")
}

if discriminant > 0 {
    x1 = (-b - (sqrt(discriminant))) / (2 * a)
    x2 = (-b + (sqrt(discriminant))) / (2 * a)
    print("Дискриминант имеет 2 корня")
}

// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

var cat1: Double = 3
var cat2: Double = 4


let square = cat1 * cat2 / 2
print(square)

var hypotenuse = (cat1 * cat1) + (cat2 * cat2)
hypotenuse = sqrt(hypotenuse)
print(hypotenuse)

let perimetr = cat1 + cat2 + hypotenuse
print(perimetr)


// 3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.


var summa: Double = 1000  // сумма вклада
let procent: Double = 10  //  годовой процент
let year: Int = 5    // количество лет
var count: Int = 1

summa = summa + (summa / 100 * procent)
summa = summa + (summa / 100 * procent)
summa = summa + (summa / 100 * procent)
summa = summa + (summa / 100 * procent)
summa = summa + (summa / 100 * procent)

print(summa)
