//
//  Bouton Arrondi.swift
//  Les Calanques
//
//  Created by Arnaud Caillon on 18/02/2019.
//  Copyright © 2019 Arnaud Caillon. All rights reserved.
//

import UIKit

class Bouton_Arrondi: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup() {
        layer.cornerRadius = 20
    }
    

}
