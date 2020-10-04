//
//  shadow.swift
//  myBook
//
//  Created by Ravi Thakur on 03/10/20.
//

import Foundation
import UIKit

class ShadowView: UIView {
    override var bounds: CGRect {
        didSet {
            setupShadow()
        }
    }

    private func setupShadow() {
        self.layer.shadowColor = #colorLiteral(red: 0.9782226682, green: 0.6041038632, blue: 0.6039324403, alpha: 1)
        self.layer.cornerRadius = 12
        self.layer.borderColor = #colorLiteral(red: 0.9890834052, green: 0.5872893521, blue: 0.4708381965, alpha: 1)
        self.layer.borderWidth = 0.15
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}

extension UIView{
    
    
    
    
    
}
