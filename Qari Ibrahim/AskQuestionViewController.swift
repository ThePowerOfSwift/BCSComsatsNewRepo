//
//  AskQuestionViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/8/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit
import Alamofire

class AskQuestionViewController: BaseViewController {

    @IBOutlet weak var titleMainLbl: UILabel!
    @IBOutlet weak var subTextLbl: UILabel!
    @IBOutlet weak var thirdinputView: UIView!
    @IBOutlet weak var emailTextinput: UITextField!
    
    @IBOutlet weak var questionTextinput: UITextView!
    @IBOutlet weak var secondInputView: UIView!
    @IBOutlet weak var userNameTextinput: UITextField!
    @IBOutlet weak var firstInputView: UIView!
    @IBOutlet weak var BtnSubmitoutlet: UIButton!
    
    @IBAction func BtnSubmit(_ sender: Any) {
        
        let parameters: [String: Any] = [
            "name" : userNameTextinput.text!,
            "email" : emailTextinput.text!,
            "message" : questionTextinput.text!,
            ]
        
        var todoEndpoint : String = ""
        //API calling
        
        
        todoEndpoint = "http://channelsmedia.net/quranapp/api/ask_question"
        
        Alamofire.request(todoEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                print("post api response",response)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        emailTextinput.delegate = self as! UITextFieldDelegate
//        userNameTextinput.delegate = self as! UITextFieldDelegate
//        questionTextinput.delegate = self as! UITextFieldDelegate as! UITextViewDelegate
        
        guard let customFont = UIFont(name: "Gotham Rounded", size: UIFont.labelFontSize) else {
            fatalError("""
        Failed to load the "CustomFont-Light" font.
        """
            )
        }
        titleMainLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        titleMainLbl.adjustsFontForContentSizeCategory = true
        
        subTextLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        subTextLbl.adjustsFontForContentSizeCategory = true
        
        
        firstInputView.layer.borderWidth = 2
        firstInputView.layer.cornerRadius = 28
        firstInputView.layer.borderColor = UIColor.blue.cgColor
        
        secondInputView.layer.borderWidth = 2
        secondInputView.layer.cornerRadius = 28
        secondInputView.layer.borderColor = UIColor.blue.cgColor
        
        thirdinputView.layer.borderWidth = 2
        thirdinputView.layer.cornerRadius = 28
        thirdinputView.layer.borderColor = UIColor.blue.cgColor
        
        BtnSubmitoutlet.layer.cornerRadius = 8
        BtnSubmitoutlet.layer.borderWidth = 2
        BtnSubmitoutlet.layer.borderColor = UIColor.blue.cgColor
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
