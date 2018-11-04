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
    
    //下面两个遵守成为键盘输入代理的协议的方法
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    //使saveButton在键盘输入时无效
    func textFieldDidBeginEditing(_ textField: UITextField) {
        teacherSaveButton.isEnabled = false
    }
    //如果输入为空则让saveButton无效
    private func updateSaveButtonState(){
        let text = teacherTitle.text ?? ""
        teacherSaveButton.isEnabled = !text.isEmpty
    }
    override func viewDidLoad() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        //当提交按钮被按下时
        guard let button = sender as? UIButton,button === teacherSaveButton else {
            os_log("The submit button was not pressed", log: OSLog.default, type: .debug)
            return
        }
        let theFirstName = firstName.text ?? ""
        let theLastName = lastName.text ?? ""
        let theAge = age.text ?? ""
        let theGender = gender.text ?? ""
        let theTitle = teacherTitle.text ?? ""
        teacher = Teacher(firstName: theFirstName, lastName: theLastName, age: 1, gender: Gender(rawValue: theGender)!, title: theTitle, department: Department.first)
    }
}
