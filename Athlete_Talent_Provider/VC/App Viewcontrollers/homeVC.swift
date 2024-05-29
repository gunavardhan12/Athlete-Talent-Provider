//
//  homeVC.swift
//  Athlete_Talent_Provider
//
//  Created by RaJ TiWaRi on 21/05/24.
//

import UIKit

class homeVC: UIViewController {
    @IBOutlet weak var inboxUIView: UIView!
    @IBOutlet weak var mathcingJobsView: UIView!
    @IBOutlet weak var appliedJobsView: UIView!
    @IBOutlet weak var allJobView: UIView!
    @IBOutlet weak var profileCornerImage: UIImageView!

    @IBOutlet weak var appliedImage: UIImageView!
    @IBOutlet weak var allJobImage: UIImageView!
    @IBOutlet weak var matchImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageRoundCorner(profileCornerImage)
        inboxUIView.layer.cornerRadius = 15
        cornerRadius(mathcingJobsView)
        cornerRadius(appliedJobsView)
        cornerRadius(allJobView)
        imageRoundCorner(appliedImage)
        imageRoundCorner(allJobImage)
        imageRoundCorner(matchImage)
        

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        print("hehehfsdhfahsdiaksdfsdkwehflaskdnfsdlfhalsdjfsdj")
    }
    
    @IBAction func inboxButton(_ sender: Any) {
        let inboxvc = storyboard?.instantiateViewController(withIdentifier: "nc")
        present(inboxvc!, animated: true)
    }
    

}
