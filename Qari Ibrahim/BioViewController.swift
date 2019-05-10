//
//  BioViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/8/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class BioViewController: BaseViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var lblBioTitle: UILabel!
    @IBOutlet weak var tblBioData: UITableView!

    var arrAccess = [AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var todoEndpoint : String = ""
        //API calling
        todoEndpoint = "http://channelsmedia.net/quranapp/api/bio"
        
        Alamofire.request(todoEndpoint)
            .responseJSON { response in
                // check for errors
                
                self.arrAccess = response.result.value as! [AnyObject]
                
                print("response", self.arrAccess)
                print("response",self.arrAccess[0])
                print("response",self.arrAccess[0]["title"]!!)
                
                // Reload Table View
                self.tblBioData.reloadData()
                
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle
                    print("error calling GET on /todos/1")
                    print(response.result.error!)
                    return
                }
               
        }
        
    }
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.arrAccess.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let identifier="BioTableViewCellID"
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! BioTableViewCell
            
            cell.lblTitle.text = (self.arrAccess[indexPath.row] as AnyObject)["title"] as? String
            
//            cell.imgProfile.sd_setImage(with: URL(string:"http://channelsmedia.net/quranapp/public/" + self.arrAccess[indexPath.row]), placeholderImage: UIImage(named: "ic_quran"))

            cell.imgProfile.sd_setImage(with: URL(string:"http://channelsmedia.net/quranapp/public/" + (self.arrAccess[indexPath.row]["image"] as! String)), placeholderImage: UIImage(named: "ic_quran"))
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            
        }

//        lblBioTitle.font = UIFontMetrics.default.scaledFont(for: customFont)
//        lblBioTitle.adjustsFontForContentSizeCategory = true
}
