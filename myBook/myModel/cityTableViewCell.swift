//
//  cityTableViewCell.swift
//  myBook
//
//  Created by Ravi Thakur on 02/10/20.
//

import UIKit

class cityTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cityImage: UIImageView!
    
    @IBOutlet weak var cityName: UILabel!
    
    @IBOutlet weak var cityFam: UILabel!
    
    @IBOutlet weak var cityRating: UILabel!
    
    @IBOutlet weak var cityInfo: UILabel!
    
    @IBOutlet weak var cityCost: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
}
