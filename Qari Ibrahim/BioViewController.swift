//
//  BioViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/8/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit
import Alamofire

class BioViewController: BaseViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var BioTitleLbl: UILabel!
    var myApiArray = [BioScreen]()
    var slides:[Slide] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.delegate = self
//        slides = createSlides()
//        setupSlideScrollView(slides: slides)
        
        var todoEndpoint : String = ""
        //API calling
        
       
        todoEndpoint = "http://channelsmedia.net/quranapp/api/bio"
        
        Alamofire.request(todoEndpoint)
            .responseJSON { response in
                // check for errors
                let arrAccess = response.result.value as! [AnyObject]
                print("response", arrAccess)
                self.myApiArray = BioScreen.PopulateArray(array: arrAccess as! [[String : Any]])
                print("response===", self.myApiArray)
                //reloading table after getting data

                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle
                    print("error calling GET on /todos/1")
                    print(response.result.error!)
                    return
                }

                self.slides = self.createSlides()
                self.setupSlideScrollView(slides: self.slides)

        }
        
        
        guard let customFont = UIFont(name: "Gotham Rounded", size: UIFont.labelFontSize) else {
            fatalError("""
        Failed to load the "CustomFont-Light" font.
        """
            )
        }
        BioTitleLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        BioTitleLbl.adjustsFontForContentSizeCategory = true
        
       
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func createSlides() -> [Slide] {
        
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imageSlideMain.image = UIImage(named: "ic_quran")
        //slide1.labelTitle.text = "A real-life bear"
        slide1.textView.text = self.myApiArray[0].title
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageSlideMain.image = UIImage(named: "ic_quran")
        //slide2.labelTitle.text = "A real-life bear"
        slide2.textView.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imageSlideMain.image = UIImage(named: "ic_quran")
        //slide3.labelTitle.text = "A real-life bear"
        slide3.textView.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide4.imageSlideMain.image = UIImage(named: "ic_quran")
        //slide4.labelTitle.text = "A real-life bear"
        slide4.textView.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        
        let slide5:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide5.imageSlideMain.image = UIImage(named: "ic_quran")
        //slide5.labelTitle.text = "A real-life bear"
        slide5.textView.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        return [slide1, slide2, slide3, slide4, slide5]
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
