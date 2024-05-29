//
//  UIFunctions.swift
//  Athlete_Talent_Provider
//
//  Created by RaJ TiWaRi on 24/05/24.
//

import Foundation
import UIKit


func cornerRadius(_ name: UIView){
    name.layer.cornerRadius = 15
}
func imageRoundCorner(_ name: UIImageView){
    name.clipsToBounds = true
    name.layer.cornerRadius = name.frame.size.width/2
}

