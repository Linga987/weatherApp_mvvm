//
//  citiyCell.swift
//  wheatherApp
//
//  Created by shanmuga srinivas on 09/05/24.
//

import Foundation
import UIKit

class CitiyCell: UITableViewCell {
   
    @IBOutlet weak var citiyNameLabel: UILabel!
    
    var citiy: City? {
        didSet {
            updateUI()
        }
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateUI() {
        citiyNameLabel.text = citiy?.name
    }
    
}
