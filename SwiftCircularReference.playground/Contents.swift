//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//解决循环引用使用"weak"关键字

//1.创建类
class Person {
    var name:String = ""
    var book: Book?
    
    deinit {
        print("Person------deinit")
    }

}
class Book {
    var price: Double = 0
    /**
     OC中表示弱引用
        __weak或者__unsafe_unretained(容易产生野指针错误)
     Swift中表示弱引用
        weak与unowned(容易产生野指针错误)
        unowned:不能用于修饰可选类型
     */
    //unowned var owner: Person = Person(),使用时需要解包
    weak var owner: Person?
    deinit {
        print("Book------deinit")
    }
}

//2.创建两个对象
var person: Person? = Person()
person!.name = "why"
var book: Book? = Book()
book!.price = 60.0

person!.book = book;
book!.owner = person

person = nil
book = nil
