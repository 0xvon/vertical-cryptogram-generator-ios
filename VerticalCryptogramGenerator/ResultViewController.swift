//
//  ResultViewController.swift
//  VerticalCryptogramGenerator
//
//  Created by Masato TSUTSUMI on 2020/02/03.
//  Copyright © 2020 Masato TSUTSUMI. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var profileImageView: UIImageView!
    var text: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        textView?.text = self.text
        textView?.textContainerInset = UIEdgeInsets.zero
        textView?.textContainer.lineFragmentPadding = 0
        
        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
    }
}
