//
//  ViewController.swift
//  SwiftSkeletonDemoApp
//
//  Created by Abdallah Nehme on 17/07/2025.
//

import UIKit
import SwiftSkeleton

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SkeletonSettings.default.firstColor = UIColor.systemTeal
        SkeletonSettings.default.secondColor = UIColor.systemBlue
        label.isSkeleton = true
    }


}

