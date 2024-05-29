//
//  settingVC.swift
//  Athlete_Talent_Provider
//
//  Created by RaJ TiWaRi on 24/05/24.
//

import UIKit
import Contacts


class settingVC: UIViewController {
    @IBOutlet weak var accountSettingsView: UIView!
    @IBOutlet weak var actionsView: UIView!
    @IBOutlet weak var moreView: UIView!
    @IBOutlet weak var inviteFriendLabel: UILabel!
    @IBOutlet weak var deleteAccountLabel: UILabel!
    @IBOutlet weak var logoutLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cornerRadius(accountSettingsView)
        cornerRadius(actionsView)
        cornerRadius(moreView)
        addGesture()

        // Do any additional setup after loading the view.
    }
    
    
//    
    func addGesture(){
        let deleteTap = UITapGestureRecognizer(target: self, action: #selector(showDelteAccAlert))
        deleteAccountLabel.addGestureRecognizer(deleteTap)
        
        let logoutTap = UITapGestureRecognizer(target: self, action: #selector(showlogOutAccAlert))
        logoutLabel.addGestureRecognizer(logoutTap)
        
    }
    
    @objc func showDelteAccAlert(){
        let alertController = UIAlertController(title: "Are You Sure!!", message: "Do you want to delete your Account", preferredStyle: .alert)
        
        let okay = UIAlertAction(title: "Yes", style: .default)
        okay.setValue(UIColor.red, forKey: "titleTextColor")
        let no = UIAlertAction(title: "No", style: .default)
        no.setValue(UIColor.red, forKey: "titleTextColor")
        
        alertController.addAction(okay)
        alertController.addAction(no)
        present(alertController, animated: true)
    }
    
    @objc func showlogOutAccAlert(){
        let alertController = UIAlertController(title: "Are You Sure!!", message: "Do you want to Logout off this Account", preferredStyle: .alert)
        
        let okay = UIAlertAction(title: "Yes", style: .default)
        okay.setValue(UIColor.red, forKey: "titleTextColor")
        let no = UIAlertAction(title: "No", style: .default)
        no.setValue(UIColor.red, forKey: "titleTextColor")
        
        alertController.addAction(okay)
        alertController.addAction(no)
        present(alertController, animated: true)
    }


}
