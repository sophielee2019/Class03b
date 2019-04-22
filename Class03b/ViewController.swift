//
//  ViewController.swift
//  Class03b
//
//  Created by sophie on 2019/4/22.
//  Copyright © 2019 sophie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var MessageA: UILabel!
    
    @IBAction func Click(_ sender: UIButton) {
        MessageA.text = "Hi, Xcode"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

