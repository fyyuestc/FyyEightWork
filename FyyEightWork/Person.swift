//
//  Person.swift
//  FyyEightWork
//
//  Created by student on 2018/11/3.
//  Copyright © 2018年 2016110305. All rights reserved.
//

import Foundation

enum Gender : Int{
    case male,female,unknow
    //重载>
    static func > (lhs : Gender,rhs : Gender) -> Bool{
        return lhs.rawValue > rhs.rawValue
    }
}
//公寓枚举
enum Department {
    case first,second,third
}
//学校协议
protocol SchoolProtocol {
    var department : Department { get set }
    func lendBook()
}
//实现person类
class Person : CustomStringConvertible {
    var firstName : String
    var lastName : String
    var age :Int
    var gender :Gender
    var fullName : String { return firstName + lastName }               //计算属性
    init(firstName : String,lastName : String,age : Int,gender : Gender) {      //指定构造函数
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    convenience init(firstName : String){                               //便利构造函数
        self.init(firstName: firstName, lastName: "", age: 18, gender: Gender.female)
    }
    convenience init(firstName : String,age : Int,gender : Gender){      //便利构造函数
        self.init(firstName: firstName, lastName: "", age: age, gender: gender)
    }
    
    var description : String {                                          //可以用print输出
        return "name : \(self.fullName) age: \(self.age) gender : \(self.gender)"
    }
    
    static func == (lhs : Person,rhs : Person) -> Bool {                //重载== ！=
        return lhs.fullName == rhs.fullName && lhs.age == rhs.age && lhs.gender == rhs.gender
    }
    static func != (lhs : Person,rhs : Person) -> Bool {
        return !(lhs == rhs)
    }
    func run() {                                                        //输出函数
        print("Person \(self.fullName) is running")
    }
}


class Teacher : Person,SchoolProtocol{
    var title : String              //增加的title属性
    var department : Department     //增加的department属性
    init(firstName : String,lastName : String,age : Int,gender : Gender,title : String,department : Department) {
        self.title = title
        self.department = department
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    //重写父类的计算属性
    override var description : String {
        return "title : \(self.title) , fullName : \(self.fullName),age : \(self.age),gender : \(self.gender)，department: \(self.department)"
    }
    //重载父类run方法
    override func run() {
        print("Teacher \(self.fullName) is running")
    }
    //遵循协议
    func lendBook() {
        print("Teacher \(self.fullName) has lent a book!")
    }
}

class Student : Person,SchoolProtocol {                 //定义学生类，继承person类，遵守Schoolprotocol协议
    var stuNo : Int
    var department : Department
    init(firstName : String,lastName : String,age : Int,gender : Gender,stuNo : Int,department : Department) {      //指定构造器
        self.department = department
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    override var description: String {                  //重写方法
        return "stuNo : \(self.stuNo),fullName : \(self.fullName),age : \(self.age),gender : \(self.gender),department : \(self.department)"
    }
    override func run() {
        print("Student \(self.fullName) is running")
    }
    func  lendBook() {                                 //遵守协议
        print("Student \(self.fullName) has lent a book!")
    }
    
}
