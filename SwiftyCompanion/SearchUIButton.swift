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
            backgroundColor = isEnabled ? #colorLiteral(red: 1, green: 0.6440272331, blue: 0, alpha: 1) : #colorLiteral(red: 0.8038417697, green: 0.8039775491, blue: 0.8038237691, alpha: 1)
        }
    }
    
}
