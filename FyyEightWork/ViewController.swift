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
    let tableTitle = ["Teacher","Student"]

    @IBOutlet weak var MyLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
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
           return teachers.count
        }else {
           return students.count
        }
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = tableTitle[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        switch identifier {
        case "Student":
            cell?.detailTextLabel?.text = "\(students[indexPath.row].gender) , "+"\(students[indexPath.row].age)岁"
            cell?.textLabel?.text = students[indexPath.row].fullName
        case "Teacher":
            cell?.detailTextLabel?.text = "\(teachers[indexPath.row].gender) , "+"\(teachers[indexPath.row].age)岁"
            cell?.textLabel?.text = teachers[indexPath.row].fullName
        default:
            cell?.textLabel?.text = "Nothing"
            cell?.detailTextLabel?.text = "Nothing"
            break
        }
        return cell!
    }
    //Section的标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return tableTitle[section]
    }
    
    //Section的数量
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableTitle.count
    }
    
    //选择某一个cell时
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 0){
            MyLabel.text = "You are choosing: \(teachers[indexPath.row].fullName)"
        }
        else {
            MyLabel.text = "You are choosing: \(students[indexPath.row].fullName)"
        }
    }
    
    //支持编辑
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //支持删除
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            if editingStyle == UITableViewCellEditingStyle.delete {
                if indexPath.section == 0 {
                    teachers.remove(at: indexPath.row)
                } else {
                    students.remove(at: indexPath.row)
                }
                
                tableView.deleteRows(at: [indexPath], with: .left)
            }
        }
    }
   
    @IBAction func AddClicked(_ sender: UIButton) {
    }
    
    @IBAction func EditClicked(_ sender: UIButton) {
        tableView.isEditing = !tableView.isEditing
    }
    
    //响应addView的prepare方法，unwind segue
    @IBAction func unwindToTeachers(sender : UIStoryboardSegue){
        if let sourceViewController = sender.source as? AddViewController,let teacher = sourceViewController.teacher {
            let newIndexPath = IndexPath(row: teachers.count, section: 0)
            teachers.append(teacher)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        if let sourceViewController = sender.source as? AddViewController,let student = sourceViewController.student {
            let newIndexPath = IndexPath(row: students.count, section: 1)
            students.append(student)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

