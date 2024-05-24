//
//  createAccountVC.swift
//  Athlete_Talent_Provider
//
//  Created by Wegile-Gunavardhan on 23/05/24.
//

import UIKit

class createAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func createAccountBtn(_ sender: UIButton){
        var s = ""
        showAlert(message: s)
    }
    func showAlert(message: String){
        let alert = UIAlertController(title: "We need to verify your number", message: "we need to make sure that \(message) s your number.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        cancelAction.setValue(UIColor.red, forKey: "titleTextColor")
        let OkAction = UIAlertAction(title: "Ok", style: .default)
        OkAction.setValue(UIColor.red, forKey: "titleTextColor")
        alert.addAction(cancelAction)
        alert.addAction(OkAction)
        present(alert, animated: true)
    }

}
