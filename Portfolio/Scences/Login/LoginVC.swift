//
//  LoginVC.swift
//  Portfolio
//
//  Created by Nguyen Trung Hieu on 2/10/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class LoginVC: UIViewController {
    
    @IBOutlet weak var lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = "thanks you"
        lbl.textColor = AppColors.blackText
        lbl.font = AppFonts.coreSansGS35Light(19)
        // Do any additional setup after loading the view.
    }

    @IBAction func btn(_ sender: Any) {
         // MARK: - Sign up
        Auth.auth().createUser(withEmail: "hieu2@gmail.com", password: "1234567") { authResult, error in
            if error != nil {
                self.lbl.text = "Đăng kí không thành công"
            }else{
                self.lbl.text = "Đăng kí thành công"
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: ["fisrtName" : "Hieu2", "lastName": "Trung2", "userid" : authResult?.user.uid]) { (error) in
                    if error != nil{
                        print("lỗi")
                    }else{
                        print("go to homeVC")
                        let homeVC = HomeVC.loadFromNib()
                        ViewPresenter.replaceRootView(for: homeVC, duration: 0.3, options: .transitionCrossDissolve, completion: nil)
                    }
                }
            }
        }
        
        
        
        
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
