//
//  ViewController.swift
//  SteppePayment
//
//  Created by 53253489 on 02/06/2022.
//  Copyright (c) 2022 53253489. All rights reserved.
//

import UIKit
import SteppePayment

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ConnectionFactory.shared.self
        let vc =
        navigationController?.pushViewController(vc, animated: true)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

