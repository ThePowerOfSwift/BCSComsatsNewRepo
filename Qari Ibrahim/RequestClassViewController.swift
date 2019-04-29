//
//  RequestClassViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/8/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit
import Alamofire

class RequestClassViewController: BaseViewController {
   
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtClasstype: UITextField!
    @IBOutlet weak var txtDuration: UITextField!
    @IBOutlet weak var txtAttendence: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtContactNo: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var tenTrainerView: UIView!
    @IBOutlet weak var nineEmailView: UIView!
    @IBOutlet weak var eightContactNoView: UIView!
    @IBOutlet weak var seventhAddressView: UIView!
    @IBOutlet weak var sixthLocation: UIView!
    @IBOutlet weak var FifthAgeView: UIView!
    @IBOutlet weak var fourAttendenceView: UIView!
    @IBOutlet weak var thirdDurarionView: UIView!
    @IBOutlet weak var secondClasstypeView: UIView!
    @IBOutlet weak var firstUsernameView: UIView!
    
    @IBAction func BtnSubmit(_ sender: Any) {
        let parameters: [String: Any] = [
            "name" : txtUsername.text as Any,
            "class_type" : "",
            "duration" : txtDuration.text as Any,
            "attendees" : txtAttendence.text as Any,
            "age_group" : txtAge.text as Any,
            "location" : "Faisalabad",
            "street_address" : txtAddress.text as Any,
            "phone" : txtContactNo.text as Any,
            "email" : txtEmail.text as Any,
            "trainer_options"  : "any option",
            ]
        
        var todoEndpoint : String = ""
        //API calling
        
        
        todoEndpoint = "http://channelsmedia.net/quranapp/api/request_class"
        
        Alamofire.request(todoEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                print("post api response",response)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        firstUsernameView.layer.borderWidth = 2
        firstUsernameView.layer.cornerRadius = 28
        firstUsernameView.layer.borderColor = UIColor.blue.cgColor
        
        secondClasstypeView.layer.borderWidth = 2
        secondClasstypeView.layer.cornerRadius = 28
        secondClasstypeView.layer.borderColor = UIColor.blue.cgColor
        
        thirdDurarionView.layer.borderWidth = 2
        thirdDurarionView.layer.cornerRadius = 28
        thirdDurarionView.layer.borderColor = UIColor.blue.cgColor
        
        fourAttendenceView.layer.borderWidth = 2
        fourAttendenceView.layer.cornerRadius = 28
        fourAttendenceView.layer.borderColor = UIColor.blue.cgColor
        
        FifthAgeView.layer.borderWidth = 2
        FifthAgeView.layer.cornerRadius = 28
        FifthAgeView.layer.borderColor = UIColor.blue.cgColor
        
        sixthLocation.layer.borderWidth = 2
        sixthLocation.layer.cornerRadius = 28
        sixthLocation.layer.borderColor = UIColor.blue.cgColor
        
        seventhAddressView.layer.borderWidth = 2
        seventhAddressView.layer.cornerRadius = 28
        seventhAddressView.layer.borderColor = UIColor.blue.cgColor
        
        eightContactNoView.layer.borderWidth = 2
        eightContactNoView.layer.cornerRadius = 28
        eightContactNoView.layer.borderColor = UIColor.blue.cgColor
        
        nineEmailView.layer.borderWidth = 2
        nineEmailView.layer.cornerRadius = 28
        nineEmailView.layer.borderColor = UIColor.blue.cgColor
        
        tenTrainerView.layer.borderWidth = 2
        tenTrainerView.layer.cornerRadius = 28
        tenTrainerView.layer.borderColor = UIColor.blue.cgColor
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
