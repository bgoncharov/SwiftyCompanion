//
//  SearchUIButton.swift
//  SwiftyCompanion
//
//  Created by Boris on 2/4/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import UIKit

class SearchUIButton: UIButton {

    override open var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
    }
    
}
