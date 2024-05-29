//
//  profileVC.swift
//  Athlete_Talent_Provider
//
//  Created by RaJ TiWaRi on 21/05/24.
//

import UIKit

class profileVC: UIViewController {
    @IBOutlet weak var profileAchievement: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()
        profileAchievement.layer.borderWidth = 0.5
        profileAchievement.layer.cornerRadius = 12
        profileAchievement.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor


        // Do any additional setup after loading the view.
    }
    


}
