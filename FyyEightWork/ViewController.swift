//
//  ViewController.swift
//  FyyEightWork
//
//  Created by student on 2018/11/3.
//  Copyright © 2018年 2016110305. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    //学生与老师
    var students = [Student]()
    var teachers = [Teacher]()
    let tableTitle = ["Student","Teacher"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //生成3个Teacher对象
        let teacher1 = Teacher(firstName: "li", lastName: "min", age: 40, gender: .female, title: "best", department: .first)
        teachers.append(teacher1)
        let teacher2 = Teacher(firstName: "tang", lastName: "bo", age: 44, gender: .male, title: "wonderful", department: .third)
        teachers.append(teacher2)
        let teacher3 = Teacher(firstName: "li", lastName: "gy", age: 35, gender: .unknow, title: "amazing", department: .second)
        teachers.append(teacher3)
        //生成3个Student对象
        let student1 = Student(firstName: "fan", lastName: "yy", age: 20, gender: .male, stuNo: 05, department: .second)
        students.append(student1)
        let student2 = Student(firstName: "luo", lastName: "jl", age: 21, gender: .unknow, stuNo: 25, department: .third)
        students.append(student2)
        let student3 = Student(firstName: "my", lastName: "secret", age: 19, gender: .female, stuNo: 41, department: .first)
        students.append(student3)
        
        //按全名排序
        teachers.sort { return $0.fullName < $1.fullName }
        students.sort { return $0.fullName < $1.fullName }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //分为两个section显示
        if section == 0 {
            return students.count
        }else {
            return teachers.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = tableTitle[indexPath.section]
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        switch identifier {
        case "Student":
            cell?.detailTextLabel?.text = "\(students[indexPath.row].gender) , "+"\(students[indexPath.row].age)岁"
            cell?.textLabel?.text = students[indexPath.row].fullName
        case "Teacher":
            
        default:
            break
        }
        
    }
    //Section的标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String{
        return tableTitle[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableTitle.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

