//
//  ViewController.swift
//  ViewModifier
//
//  Created by vignesh.mot@gmail.com on 03/02/2023.
//  Copyright (c) 2023 vignesh.mot@gmail.com. All rights reserved.
//

import UIKit
import ViewModifier

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBorderLine()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

