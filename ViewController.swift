//
//  ViewController.swift
//  6666666
//
//  Created by macos on 2018/10/23.
//  Copyright © 2018年 macos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var sort :Int = 0    //选择运算种类
    var memory :Double = 0.0     //储存结果
    var number1 :Double = 0.0    //处理数1
    var number2 :Double = 0.0    //处理数2
    var number3 :Double = 0.0     //处理数3
    var pointExist :Int = 0       //判断之前是否存在小数点
    var touchState :Int = 0       //判断当前按键种类
    
    
//============================下面对数字控制按钮进行处理===========================================
    
    @IBAction func re1(_ sender: UIButton) {
        self.oh.text = self.oh.text!+"1"
        touchState = 0
    }
    
    @IBAction func re2(_ sender: UIButton) {
        self.oh.text = self.oh.text!+"2"
        touchState = 0
    }
    
    @IBAction func re3(_ sender: UIButton) {
        self.oh.text = self.oh.text!+"3"
        touchState = 0
    }
    
    @IBAction func re4(_ sender: UIButton) {
        self.oh.text = self.oh.text!+"4"
        touchState = 0
       
    }
    
    @IBAction func re5(_ sender: UIButton) {
        self.oh.text = self.oh.text!+"5"
        touchState = 0
    
    }
    
    @IBAction func re6(_ sender: UIButton) {
        self.oh.text = self.oh.text!+"6"
        touchState = 0
    }
    
    @IBAction func re7(_ sender: UIButton) {
        self.oh.text = self.oh.text!+"7"
        touchState = 0
       
    }
    
    @IBAction func re8(_ sender: UIButton) {
        self.oh.text = self.oh.text!+"8"
        touchState = 0
       
    }
    
    @IBAction func re9(_ sender: UIButton) {
        self.oh.text = self.oh.text!+"9"
        touchState = 0
      
    }
    
    @IBAction func re0(_ sender: UIButton) {
        self.oh.text = self.oh.text!+"0"
        touchState = 0
       
    }
    
    @IBAction func point(_ sender: UIButton) {
        pointExist = 0
        for index in self.oh.text!
        {
            if index == "."
            { pointExist = 1}
        }
        if self.oh.text!.isEmpty
        {self.oh.text = self.oh.text!+"0."}
        else if pointExist != 1
        {self.oh.text = self.oh.text!+"."}
        touchState = 0
    }
    
//==========================下面对运算符按钮进行处理===========================================
    
    @IBAction func plus(_ sender: UIButton)
{
       if touchState != 1             //防止连续两次按加导致bug
    {
        if sort == 0 {                //处理第一次输入
            if oh.text == ""
            { number1 = 0}
            else if  self.oh.text![self.oh.text!.index(before: self.oh.text!.endIndex)] == "."       //防止小数点后缺0导致无法识别
            { self.oh.text = self.oh.text! + "0"      //正常情况
                 self.number1 = Double((self.oh?.text!)!)!
            }
            else {self.number1 = Double((self.oh?.text!)!)!}
        }
        else{                      //处理第一次以后的输入
            if oh.text == ""       //防止输入为空
            {self.number2 = 0}
            else if  self.oh.text![self.oh.text!.index(before: self.oh.text!.endIndex)] == "."
            { self.oh.text = self.oh.text! + "0"
                 self.number2 = Double((self.oh?.text!)!)!
            }
            else { self.number2 = Double((self.oh?.text!)!)! }
            
      //读取上一个运算符，来对number1赋值
            switch self.sort {
            case 1:
                number1 += number2
            case 2:
                number1 -= number2
            case 3:
                number1 *= number2
            case 4:
                number1 /= number2
            default:
                self.oh.text = "你搞错了！"
                self.store.text = "友情提醒"
            }
            number2 = 0.0          //清空number2
        }
        
        self.sort = 1            //确定运算符种类
        self.oh.text = ""
        self.store.text = "\(number1) \n +" //辅助显示框
    }
        touchState = 1             //确认加的特殊按键状态
}
    
    @IBAction func minus(_ sender: UIButton)
{
    if touchState != 2
    {
        if sort == 0 {                //处理第一次输入
            if oh.text == ""
            { number1 = 0}
            else if  self.oh.text![self.oh.text!.index(before: self.oh.text!.endIndex)] == "."
            { self.oh.text = self.oh.text! + "0"
                 self.number1 = Double((self.oh?.text!)!)!
            }
            else {self.number1 = Double((self.oh?.text!)!)!}
        }
        else{                      //处理第一次以后的输入
            if oh.text == ""       //防止输入为空
            {self.number2 = 0}
            else if  self.oh.text![self.oh.text!.index(before: self.oh.text!.endIndex)] == "."
            { self.oh.text = self.oh.text! + "0"
                 self.number2 = Double((self.oh?.text!)!)!
            }
            else { self.number2 = Double((self.oh?.text!)!)! }
            switch self.sort {
            case 1:
                number1 += number2
            case 2:
                number1 -= number2
            case 3:
                number1 *= number2
            case 4:
                number1 /= number2
            default:
                self.oh.text = "你搞错了！"
                self.store.text = "友情提醒"
            }
            number2 = 0.0
        }
        
        self.sort = 2
        self.oh.text = ""
        self.store.text = "\(number1) \n -"
    }
        touchState = 3
}
    
    @IBAction func multiply(_ sender: UIButton)
{
    if touchState != 3
    {
        if sort == 0{                //处理第一次输入
            if oh.text == ""
            { number1 = 0}
            else if  self.oh.text![self.oh.text!.index(before: self.oh.text!.endIndex)] == "."
            { self.oh.text = self.oh.text! + "0"
              self.number1 = Double((self.oh?.text!)!)!
            }
            else {self.number1 = Double((self.oh?.text!)!)!}
        }
        else{                      //处理第一次以后的输入
            if oh.text == ""       //防止输入为空
            {self.number2 = 0}
            else if  self.oh.text![self.oh.text!.index(before: self.oh.text!.endIndex)] == "."
            { self.oh.text = self.oh.text! + "0"
                 self.number2 = Double((self.oh?.text!)!)!
            }
            else { self.number2 = Double((self.oh?.text!)!)! }
            switch self.sort
            {
            case 1:
                number1 += number2
            case 2:
                number1 -= number2
            case 3:
                number1 *= number2
            case 4:
                number1 /= number2
            default:
                self.oh.text = "你搞错了！"
                self.store.text = "友情提醒"
            }
            number2 = 0.0
        }
        self.sort = 3
        self.oh.text = ""
        self.store.text="\(number1) \n *"
    }
        touchState = 3
}
    
    @IBAction func divide(_ sender: UIButton)
{
    if touchState != 4
    {
        if sort == 0{                //处理第一次输入
            if oh.text == ""
            { number1 = 0}
            else if  self.oh.text![self.oh.text!.index(before: self.oh.text!.endIndex)] == "."
            { self.oh.text = self.oh.text! + "0"
             self.number1 = Double((self.oh?.text!)!)!
            }
            else {self.number1 = Double((self.oh?.text!)!)!}
        }
        else{                      //处理第一次以后的输入
            if oh.text == ""       //防止输入为空
            {self.number2 = 0}
            else if  self.oh.text![self.oh.text!.index(before: self.oh.text!.endIndex)] == "."
            { self.oh.text = self.oh.text! + "0"
              self.number2 = Double((self.oh?.text!)!)!
            }
            else { self.number2 = Double((self.oh?.text!)!)! }
            
            switch self.sort{
            case 1:
                number1 += number2
            case 2:
                number1 -= number2
            case 3:
                number1 *= number2
            case 4:
                number1 /= number2
            default:
                self.oh.text = "你搞错了！"
                self.store.text = "友情提醒"
            }
            number2 = 0.0
        }
        
        self.sort = 4
        self.oh.text = ""
         self.store.text = "\(number1) \n /"
    }
        touchState = 4
}

//=========================下面处理一些命令按钮===========================================
    
    @IBAction func AC(_ sender: UIButton) {
        number1 = 0.0
        number2 = 0.0
        number3 = 0.0
        sort = 0
        self.oh.text = ""
         self.store.text = "欢迎使用计算器！！"
         touchState = 0
    }
    
    @IBAction func backspace(_ sender: UIButton) {
        if self.oh.text != ""
        {
            self.oh.text!.remove(at: oh.text!.index(before: oh.text!.endIndex))  //退格操作
        }
        touchState = 0
    }
    
    //记忆上一次输出的数字
    @IBAction func Me(_ sender: UIButton) {
       
        self.oh.text = "\(memory)"
         self.store.text = "欢迎使用计算器！！"
        touchState = 0
    }
    
    //记忆清零
    @IBAction func Mc(_ sender: UIButton) {
         memory = 0.0
        self.oh.text = "\(memory)"
         self.store.text = "欢迎使用计算器！！"
        touchState = 0
    }
    
    //处理结果
    @IBAction func result(_ sender: UIButton)
{    if touchState != 5
   {
        if sort == 0
        {                //处理第一次输入
            if oh.text == ""
            {   number1 = 0
                number2 = 0
            }
            else if  self.oh.text![self.oh.text!.index(before: self.oh.text!.endIndex)] == "."
            { self.oh.text = self.oh.text! + "0"
              self.number1 = Double((self.oh?.text!)!)!
            }
            else { self.number1 = Double((self.oh?.text!)!)! }
        }
    
        else{                      //处理第一次以后的输入
            if oh.text == ""       //防止输入为空
            {self.number2 = 0}
            else if  self.oh.text![self.oh.text!.index(before: self.oh.text!.endIndex)] == "."
            { self.oh.text = self.oh.text! + "0"
              self.number2 = Double((self.oh?.text!)!)!
            }
            else { self.number2 = Double((self.oh?.text!)!)! }
        }
            
        switch self.sort{
        case 1:
            self.number3 = number1 + number2
            memory = number3
            if (number3 != "Nan") {self.oh.text = "\(number3)"}
             self.store.text="结果是"
        case 2:
            self.number3 = number1 - number2
            memory = number3
            if (number3 != "Nan") {self.oh.text = "\(number3)"}
             self.store.text="结果是"
        case 3:
            self.number3 = number1 * number2
            memory = number3
            if (number3 != "Nan") {self.oh.text = "\(number3)"}
            self.store.text = "结果是"
        case 4:
            self.number3 = number1 / number2
            memory = number3
            if (number3 != "Nan") {self.oh.text = "\(number3)"}
            self.store.text = "结果是"
        default:
            self.oh.text = "你搞错了！"
            self.store.text = "友情提醒"
        }
    }
       touchState = 5
       sort = 0
}
    
    
    
    @IBOutlet weak var oh: UILabel!
    
    @IBOutlet weak var store: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("界面设计文件加载完成")

       self.store.text = "欢迎使用计算器!!" //辅助输出框
        self.oh.text = ""          //主输出框
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

