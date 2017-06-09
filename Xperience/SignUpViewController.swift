//
//  SignUpViewController.swift
//  Xperience
//
//  Created by 孟琦 on 6/9/17.
//  Copyright © 2017 Xperience. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController,UITextFieldDelegate {
    
    var FONT1 = UIFont(name: "HelveticaNeue-Light", size: 30)
    var FONT2 = UIFont(name: "HelveticaNeue-Light", size: 25)
    var FONT3 = UIFont(name: "HelveticaNeue-Light", size: 15)
    
    @IBOutlet var mainView: UIView!
    
    // warning label
    var warningLabel = UILabel()
    
    var page1 = UIView()
    var whatsurnamelabel = UILabel()
    var lastNameLabel = UILabel()
    var lastNameImage = UIImageView()
    var lastNameText = UITextField()
    var firstNameLabel = UILabel()
    var firstNameImage = UIImageView()
    var firstNameText = UITextField()
    var page1nextButton = UIButton()
    var page1backButton = UIButton()
    
    
    var page2 = UIView()
    var bdText = UITextField()
    let datepicker = UIDatePicker()
    var page2nextButton = UIButton()
    var page2backButton = UIButton()
    
    var page3 = UIView()
    var emailText = UITextField()
    var page3nextButton = UIButton()
    var page3backButton = UIButton()
    
    var page4 = UIView()
    var emailCodeText = UITextField()
    var page4nextButton = UIButton()
    var page4backButton = UIButton()
    
    var page5 = UIView()
    var pswd1Text = UITextField()
    var pswd2Text = UITextField()
    var page5nextButton = UIButton()
    var page5backButton = UIButton()
    
    var page6 = UIView()
    var page6nextButton = UIButton()
    var page6backButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = COLORORANGE
        
        // format page 1
        formatPage1()
        page1.isUserInteractionEnabled = true
        mainView.addSubview(page1)
        
        // format warning label
        warningLabel.frame = CGRect(x: 30, y: 120, width: UIScreen.main.bounds.width-60, height: 20)
        warningLabel.textColor = UIColor.red
        warningLabel.font = FONT3
        mainView.addSubview(warningLabel)
        
        // Function to disable keyboard upon touching anywhere else
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    func formatPage1() {
        page1.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        // go back button
        page1backButton.frame = CGRect(x: 15, y: 30, width: 15, height: 30)
        page1backButton.setImage(#imageLiteral(resourceName: "gobackbutton"), for: .normal)
        page1backButton.addTarget(self, action: #selector(prevButtonTapped), for: .touchUpInside)
        page1.addSubview(page1backButton)
        
        var y = 70
        whatsurnamelabel.frame = CGRect(x: 30, y: y, width: Int(UIScreen.main.bounds.width-60), height: 50)
        whatsurnamelabel.text = "请输入您的姓名"
        whatsurnamelabel.font = FONT1
        whatsurnamelabel.textColor = UIColor.white
        page1.addSubview(whatsurnamelabel)
        
        // last name
        lastNameLabel.text = "姓"
        lastNameLabel.frame = CGRect(x: 30, y: y+60, width: 50, height: 50)
        lastNameLabel.font = FONT1
        lastNameLabel.textColor = UIColor.white
        page1.addSubview(lastNameLabel)
        
        
        lastNameImage.frame = CGRect(x: 30, y: y+60*2, width: Int(UIScreen.main.bounds.width-60), height: 50)
        lastNameImage.image = #imageLiteral(resourceName: "signUpBackground")
        page1.addSubview(lastNameImage)
        
        
        lastNameText.frame = CGRect(x: 40, y: y+60*2, width: Int(UIScreen.main.bounds.width-80), height: 50)
        lastNameText.backgroundColor = UIColor.clear
        lastNameText.font = FONT2
        lastNameText.textColor = UIColor.white
        lastNameText.delegate = self
        page1.addSubview(lastNameText)
        
        // first name
        firstNameLabel.text = "名"
        firstNameLabel.frame = CGRect(x: 30, y: y+60*3, width: 50, height: 50)
        firstNameLabel.font = FONT1
        firstNameLabel.textColor = UIColor.white
        page1.addSubview(firstNameLabel)
        
        
        firstNameImage.frame = CGRect(x: 30, y: y+60*4, width: Int(UIScreen.main.bounds.width-60), height: 50)
        firstNameImage.image = #imageLiteral(resourceName: "signUpBackground")
        page1.addSubview(firstNameImage)
        
        
        firstNameText.frame = CGRect(x: 40, y: y+60*4, width: Int(UIScreen.main.bounds.width-80), height: 50)
        firstNameText.backgroundColor = UIColor.clear
        firstNameText.font = FONT2
        firstNameText.textColor = UIColor.white
        firstNameText.delegate = self
        page1.addSubview(firstNameText)
        
        page1nextButton.frame = CGRect(x: Int(UIScreen.main.bounds.width-90), y: y+60*4+70, width: 50, height: 50)
        page1nextButton.setImage(#imageLiteral(resourceName: "nextView"), for: .normal)
        page1nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        page1.addSubview(page1nextButton)
    }
    
    func formatPage2() {
        page2.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        // go back button
        page2backButton.frame = CGRect(x: 15, y: 30, width: 15, height: 30)
        page2backButton.setImage(#imageLiteral(resourceName: "gobackbutton"), for: .normal)
        page2backButton.addTarget(self, action: #selector(prevButtonTapped), for: .touchUpInside)
        page2.addSubview(page2backButton)
        
        var y = 70
        whatsurnamelabel.frame = CGRect(x: 30, y: y, width: Int(UIScreen.main.bounds.width-60), height: 50)
        whatsurnamelabel.text = "请输入您的出生日期"
        whatsurnamelabel.font = FONT1
        whatsurnamelabel.textColor = UIColor.white
        page2.addSubview(whatsurnamelabel)
        
        // last name
        lastNameImage.frame = CGRect(x: 30, y: y+60*2, width: Int(UIScreen.main.bounds.width-60), height: 50)
        lastNameImage.image = #imageLiteral(resourceName: "signUpBackground")
        page2.addSubview(lastNameImage)
        
        // birthday input box
        bdText.frame = CGRect(x: 40, y: y+60*2, width: Int(UIScreen.main.bounds.width-80), height: 50)
        bdText.backgroundColor = UIColor.clear
        bdText.font = FONT2
        bdText.textColor = UIColor.white
        bdText.delegate = self
        page2.addSubview(bdText)
        createDatePicker()
        
        page2nextButton.frame = CGRect(x: Int(UIScreen.main.bounds.width-90), y: y+60*4+70, width: 50, height: 50)
        page2nextButton.setImage(#imageLiteral(resourceName: "nextView"), for: .normal)
        page2nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        page2.addSubview(page2nextButton)
    }
    
    func createDatePicker() {
        // format for picker
        datepicker.datePickerMode = .date
        datepicker.locale = NSLocale.init(localeIdentifier: "zh-Hans") as Locale
        
        // tool bar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        bdText.inputAccessoryView = toolbar
        
        bdText.inputView = datepicker
    }
    
    func donePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM / dd / yyyy"
        bdText.text = dateFormatter.string(from:datepicker.date)
        self.mainView.endEditing(true)
    }
    
    func formatPage3() {
        page3.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        // go back button
        page3backButton.frame = CGRect(x: 15, y: 30, width: 15, height: 30)
        page3backButton.setImage(#imageLiteral(resourceName: "gobackbutton"), for: .normal)
        page3backButton.addTarget(self, action: #selector(prevButtonTapped), for: .touchUpInside)
        page3.addSubview(page3backButton)
        
        
        var y = 70
        whatsurnamelabel.frame = CGRect(x: 30, y: y, width: Int(UIScreen.main.bounds.width-60), height: 50)
        whatsurnamelabel.text = "请输入您的邮箱"
        whatsurnamelabel.font = FONT1
        whatsurnamelabel.textColor = UIColor.white
        page3.addSubview(whatsurnamelabel)
        
        // last name
        lastNameImage.frame = CGRect(x: 30, y: y+60*2, width: Int(UIScreen.main.bounds.width-60), height: 50)
        lastNameImage.image = #imageLiteral(resourceName: "signUpBackground")
        page3.addSubview(lastNameImage)
        
        // birthday input box
        emailText.frame = CGRect(x: 40, y: y+60*2, width: Int(UIScreen.main.bounds.width-80), height: 50)
        emailText.backgroundColor = UIColor.clear
        emailText.font = FONT2
        emailText.textColor = UIColor.white
        emailText.delegate = self
        page3.addSubview(emailText)
        
        page3nextButton.frame = CGRect(x: Int(UIScreen.main.bounds.width-90), y: y+60*4+70, width: 50, height: 50)
        page3nextButton.setImage(#imageLiteral(resourceName: "nextView"), for: .normal)
        page3nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        page3.addSubview(page3nextButton)
    }
    
    
    func formatPage4() {
        page4.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        // go back button
        page4backButton.frame = CGRect(x: 15, y: 30, width: 15, height: 30)
        page4backButton.setImage(#imageLiteral(resourceName: "gobackbutton"), for: .normal)
        page4backButton.addTarget(self, action: #selector(prevButtonTapped), for: .touchUpInside)
        page4.addSubview(page4backButton)
        
        
        var y = 70
        whatsurnamelabel.frame = CGRect(x: 30, y: y, width: Int(UIScreen.main.bounds.width-60), height: 60)
        whatsurnamelabel.text = "验证码已发送至您的邮箱，请输入验证码"
        whatsurnamelabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        whatsurnamelabel.numberOfLines = 2
        whatsurnamelabel.font = FONT2
        whatsurnamelabel.textColor = UIColor.white
        page4.addSubview(whatsurnamelabel)
        
        // last name
        lastNameImage.frame = CGRect(x: 30, y: y+60*2, width: Int(UIScreen.main.bounds.width-60), height: 50)
        lastNameImage.image = #imageLiteral(resourceName: "signUpBackground")
        page4.addSubview(lastNameImage)
        
        
        emailCodeText.frame = CGRect(x: 40, y: y+60*2, width: Int(UIScreen.main.bounds.width-80), height: 50)
        emailCodeText.backgroundColor = UIColor.clear
        emailCodeText.font = FONT2
        emailCodeText.textColor = UIColor.white
        emailCodeText.delegate = self
        page4.addSubview(emailCodeText)
        emailCodeText.keyboardType = .numberPad
        
        
        page4nextButton.frame = CGRect(x: Int(UIScreen.main.bounds.width-90), y: y+60*4+70, width: 50, height: 50)
        page4nextButton.setImage(#imageLiteral(resourceName: "nextView"), for: .normal)
        page4nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        page4.addSubview(page4nextButton)
    }
    
    
    func formatPage5() {
        page5.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        // go back button
        page5backButton.frame = CGRect(x: 15, y: 30, width: 15, height: 30)
        page5backButton.setImage(#imageLiteral(resourceName: "gobackbutton"), for: .normal)
        page5backButton.addTarget(self, action: #selector(prevButtonTapped), for: .touchUpInside)
        page5.addSubview(page5backButton)
        
        var y = 70
        whatsurnamelabel.frame = CGRect(x: 30, y: y, width: Int(UIScreen.main.bounds.width-60), height: 50)
        whatsurnamelabel.text = "请设置您的密码"
        whatsurnamelabel.font = FONT1
        whatsurnamelabel.textColor = UIColor.white
        page5.addSubview(whatsurnamelabel)
        
        // last name
        lastNameLabel.text = "密码需由数字和字母组成，并且要同时含有数字和字母，长度在8-16位之间"
        lastNameLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        lastNameLabel.numberOfLines = 2
        lastNameLabel.frame = CGRect(x: 30, y: y+60, width:Int(UIScreen.main.bounds.width-60), height: 60)
        lastNameLabel.font = FONT3
        lastNameLabel.textColor = UIColor.white
        page5.addSubview(lastNameLabel)
        
        
        lastNameImage.frame = CGRect(x: 30, y: y+60*2, width: Int(UIScreen.main.bounds.width-60), height: 50)
        lastNameImage.image = #imageLiteral(resourceName: "signUpBackground")
        page5.addSubview(lastNameImage)
        
        
        pswd1Text.frame = CGRect(x: 40, y: y+60*2, width: Int(UIScreen.main.bounds.width-80), height: 50)
        pswd1Text.backgroundColor = UIColor.clear
        pswd1Text.font = FONT2
        pswd1Text.textColor = UIColor.white
        pswd1Text.delegate = self
        page5.addSubview(pswd1Text)
        
        // first name
        firstNameLabel.text = "请再输入一遍您的密码"
        firstNameLabel.frame = CGRect(x: 30, y: y+60*3, width: Int(UIScreen.main.bounds.width-60), height: 50)
        firstNameLabel.font = FONT3
        firstNameLabel.textColor = UIColor.white
        page5.addSubview(firstNameLabel)
        
        
        firstNameImage.frame = CGRect(x: 30, y: y+60*4, width: Int(UIScreen.main.bounds.width-60), height: 50)
        firstNameImage.image = #imageLiteral(resourceName: "signUpBackground")
        page5.addSubview(firstNameImage)
        
        
        pswd2Text.frame = CGRect(x: 40, y: y+60*4, width: Int(UIScreen.main.bounds.width-80), height: 50)
        pswd2Text.backgroundColor = UIColor.clear
        pswd2Text.font = FONT2
        pswd2Text.textColor = UIColor.white
        pswd2Text.delegate = self
        page5.addSubview(pswd2Text)
        
        page5nextButton.frame = CGRect(x: Int(UIScreen.main.bounds.width-90), y: y+60*4+70, width: 50, height: 50)
        page5nextButton.setImage(#imageLiteral(resourceName: "nextView"), for: .normal)
        page5nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        page5.addSubview(page5nextButton)
    }
    
    
    func formatPage6() {
        page6.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        // go back button
        page6backButton.frame = CGRect(x: 15, y: 30, width: 15, height: 30)
        page6backButton.setImage(#imageLiteral(resourceName: "gobackbutton"), for: .normal)
        page6backButton.addTarget(self, action: #selector(prevButtonTapped), for: .touchUpInside)
        page6.addSubview(page6backButton)
        
        
        // you are all done
        var youralldone = UILabel()
        youralldone.frame = CGRect(x: 0, y: 70, width: UIScreen.main.bounds.width, height: 50)
        youralldone.text = "注册成功！"
        youralldone.font = FONT1
        youralldone.textColor = UIColor.white
        youralldone.textAlignment = .center
        page6.addSubview(youralldone)
        
        // tick icon
        var tickIconView = UIImageView()
        tickIconView.frame = CGRect(x: Int(UIScreen.main.bounds.width/2-125), y: 150, width: 250, height: 250)
        tickIconView.image = #imageLiteral(resourceName: "tickIcon")
        page6.addSubview(tickIconView)
        
        
        var y = 70
        page6nextButton.frame = CGRect(x: Int(UIScreen.main.bounds.width/2-100), y: y+60*4+70, width: 200, height: 200)
        page6nextButton.setTitle("返回登陆", for: .normal)
        page6nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        page6.addSubview(page6nextButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nextButtonTapped(sender: UIButton) {
        if (sender == page1nextButton) {
            var temp = lastNameText.text?.replacingOccurrences(of: " ", with: "")
            if temp == "" {
                warningLabel.text = "输入有误"
                return
            }
            temp = firstNameText.text?.replacingOccurrences(of: " ", with: "")
            if temp == "" {
                warningLabel.text = "输入有误"
                return
            }
            
            page1.isHidden = true
            page2.isHidden = false
            formatPage2()
            mainView.addSubview(page2)
        }
        
        if (sender == page2nextButton) {
            var tmp = datepicker.date as Date!
            if (tmp?.addingTimeInterval(60*60*24*365))! > Date() {
                warningLabel.text = "输入有误"
                return
            }
            
            
            page2.isHidden = true
            page3.isHidden = false
            formatPage3()
            mainView.addSubview(page3)
        }
        
        if (sender == page3nextButton) {
            var temp = emailText.text?.replacingOccurrences(of: " ", with: "")
            if temp == "" {
                warningLabel.text = "输入有误"
                return
            }
            
            page3.isHidden = true
            page4.isHidden = false
            formatPage4()
            mainView.addSubview(page4)
        }
        
        if (sender == page4nextButton) {
            page4.isHidden = true
            page5.isHidden = false
            formatPage5()
            mainView.addSubview(page5)
        }
        
        if (sender == page5nextButton) {
            if (!checkTextSufficientComplexity(text: pswd1Text.text!)) || (pswd1Text.text != pswd2Text.text) {
                warningLabel.text = "输入有误"
                return
            }
            
            page5.isHidden = true
            page6.isHidden = false
            formatPage6()
            mainView.addSubview(page6)
        }
        
        if (sender == page6nextButton) {
            self.dismiss(animated: false, completion: nil)
            
        }
        
        
        
    }
    
    func prevButtonTapped(sender: UIButton) {
        warningLabel.text = ""
        
        if (sender == page1backButton) {
            self.dismiss(animated: false, completion: nil)
        }
        
        if (sender == page2backButton) {
            page2.isHidden = true
            page1.isHidden = false
            formatPage1()
        }
        
        if (sender == page3backButton) {
            page3.isHidden = true
            page2.isHidden = false
            formatPage2()
        }
        
        if (sender == page4backButton) {
            page4.isHidden = true
            formatPage3()
            page3.isHidden = false
        }
        if (sender == page5backButton) {
            page5.isHidden = true
            formatPage4()
            page4.isHidden = false
        }
        if (sender == page6backButton) {
            page6.isHidden = true
            formatPage5()
            page5.isHidden = false
        }
    }
    
    func checkTextSufficientComplexity( text : String) -> Bool{
        var count = text.lengthOfBytes(using: .ascii)
        if ( count > 16 || count < 8) {
            return false
        }
        
        let capitalLetterRegEx  = ".*[a-zA-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let capitalresult = texttest.evaluate(with: text)
        if (capitalresult == false) {return false}
        
        
        let numberRegEx  = ".*[0-9]+.*"
        let texttest1 = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let numberresult = texttest1.evaluate(with: text)
        if (numberresult == false) {return false}
        
        return true
        
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        warningLabel.text = ""
    }
    
    
}
