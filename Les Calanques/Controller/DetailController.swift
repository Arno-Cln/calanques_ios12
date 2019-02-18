//
//  DetailController.swift
//  Les Calanques
//
//  Created by Arnaud Caillon on 18/02/2019.
//  Copyright © 2019 Arnaud Caillon. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    
    @IBOutlet weak var calanqueIV: UIImageView!
    @IBOutlet weak var nomEtDesc: UITextView!
    
    var calanqueRecue: Calanque?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let calanque = calanqueRecue else {return}
        calanqueIV.image = calanque.image
        
        // Attribution du texte de description.
        let mutable = NSMutableAttributedString(string: calanque.nom + "\n\n", attributes: [.foregroundColor: UIColor.red, .font: UIFont.boldSystemFont(ofSize: 20)])
        mutable.append(NSAttributedString(string: calanque.desc, attributes: [.font: UIFont.systemFont(ofSize: 17), .foregroundColor: UIColor.darkGray]))
        nomEtDesc.attributedText = mutable
        nomEtDesc.textAlignment = .center

        // Do any additional setup after loading the view.
    }
    

    

}
