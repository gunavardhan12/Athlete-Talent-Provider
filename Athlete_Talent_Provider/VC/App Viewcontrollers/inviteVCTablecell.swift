//
//  inviteVCTablecell.swift
//  Athlete_Talent_Provider
//
//  Created by RaJ TiWaRi on 27/05/24.
//

import UIKit

class inviteVCTablecell: UITableViewCell {

    @IBOutlet var name: UILabel!
    @IBOutlet var number: UILabel!
    @IBOutlet weak var image1: UIImageView?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
