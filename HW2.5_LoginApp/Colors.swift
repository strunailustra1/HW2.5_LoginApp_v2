//
//  Colors.swift
//  HW2.5_LoginApp
//
//  Created by Наталья Мирная on 09.04.2020.
//  Copyright © 2020 Наталья Мирная. All rights reserved.
//
import UIKit
class Colors {
    // MARK: - Public properties
    var gl: CAGradientLayer!
    
    // MARK: - Initializers
    init() {
        let colorTop = UIColor(red: 246.0 / 255.0,
                               green: 226.0 / 255.0,
                               blue: 255.0 / 255.0,
                               alpha: 1.0).cgColor
        
        let colorBottom = UIColor(red: 211.0 / 255.0,
                                  green: 159.0 / 255.0,
                                  blue: 255.0 / 255.0,
                                  alpha: 1.0).cgColor
        
        gl = CAGradientLayer()
        gl.colors = [colorTop, colorBottom]
        gl.locations = [0.0, 1.0]
    }
}
