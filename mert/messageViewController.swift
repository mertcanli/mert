//
//  messageViewController.swift
//  mert
//
//  Created by Beykoz1 on 27.02.2017.
//  Copyright © 2017 Beykoz1. All rights reserved.
//

import UIKit

class messageViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var isim = ""
    
    override func viewDidLoad() {
        label.text = isim
    }
    

}
