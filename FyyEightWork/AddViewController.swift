//
//  AddViewController.swift
//  FyyEightWork
//
//  Created by fanyunyimac on 2018/11/3.
//  Copyright © 2018年 2016110305. All rights reserved.
//

import UIKit
import os.log

class AddViewController : UIViewController,UINavigationControllerDelegate,UITextFieldDelegate{
    @IBOutlet weak var teacherSaveButton: UIButton!
    @IBOutlet weak var studentSaveButton: UIButton!
    var teacher : Teacher?
    var student : Student?
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var teacherTitle: UITextField!
    @IBOutlet weak var studentSno: UITextField!
    
    //下面两个遵守成为键盘输入代理的协议的方法
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
    }
    //使saveButton在键盘输入时无效
    func textFieldDidBeginEditing(_ textField: UITextField) {
        teacherSaveButton.isEnabled = false
        studentSaveButton.isEnabled = false
    }
    //如果输入为空则让saveButton无效
    private func updateSaveButtonState(){
        let teacherText = teacherTitle.text ?? ""
        teacherSaveButton.isEnabled = !teacherText.isEmpty
        let stuText = studentSno.text ?? ""
        studentSaveButton.isEnabled = !stuText.isEmpty
    }
    override func viewDidLoad() {
        firstName.delegate = self
        lastName.delegate = self
        age.delegate = self
        gender.delegate = self
        teacherTitle.delegate = self
        studentSno.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //在segue触发时，提供一个地方执行自己的代码
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        //当提交按钮被按下时
        if let button = sender as? UIButton,button === teacherSaveButton{
            let theFirstName = firstName.text ?? ""
            let theLastName = lastName.text ?? ""
            let theAge = Int(age.text ?? "")
            let theGender = gender.text ?? ""
            let theTitle = teacherTitle.text ?? ""
            teacher = Teacher(firstName: theFirstName, lastName: theLastName, age: theAge!, gender: Gender(rawValue: theGender)!, title: theTitle, department: Department.first)
        } else if let button = sender as? UIButton,button === studentSaveButton {
            let theFirstName = firstName.text ?? ""
            let theLastName = lastName.text ?? ""
            let theAge = Int(age.text ?? "")
            let theGender = gender.text ?? ""
            let sno = studentSno.text ?? ""
            student = Student(firstName: theFirstName, lastName: theLastName, age: theAge!, gender: Gender(rawValue: theGender)!, stuNo: Int(sno)!, department: Department.first)
        }else {
            os_log("The submit button was not pressed", log: OSLog.default, type: .debug)
            return
        }
    }
}
