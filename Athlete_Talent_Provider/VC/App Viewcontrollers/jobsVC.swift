//
//  jobsVC.swift
//  Athlete_Talent_Provider
//
//  Created by RaJ TiWaRi on 21/05/24.
//

import UIKit

class jobsVC: UIViewController {
    @IBOutlet weak var allJobsView: UIView!
    @IBOutlet weak var appliedJobsView: UIView!
    @IBOutlet weak var mathingJobsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cornerRadius(allJobsView)
        cornerRadius(appliedJobsView)
        cornerRadius(mathingJobsView)

        // Do any additional setup after loading the view.
    }
    
    func cornerRadius(_ name: UIView){
        name.layer.cornerRadius = 15
    }

}
