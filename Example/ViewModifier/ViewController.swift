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
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
            let vc = ViewManager.getVideoCallView(
                host: "NjMyODZmNzI2NDA2MGM2OWM4OWNmNzdl",
                appId: "TOeEeWktZ2xaruLg",
                secretKey: "degpegAditya Degpeg_NABKUyKE")
            self.present(vc, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

