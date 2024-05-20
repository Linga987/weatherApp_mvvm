//
//  citiyCell.swift
//  wheatherApp
//
//  Created by shanmuga srinivas on 09/05/24.
//

import Foundation
import UIKit

class CitiyCell: UITableViewCell {
    var citiy: City? {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var citiyNameLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateUI() {
        citiyNameLabel.text = citiy?.name
    }
    
}
