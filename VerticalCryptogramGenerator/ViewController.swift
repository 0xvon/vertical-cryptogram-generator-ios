//
//  ViewController.swift
//  VerticalCryptogramGenerator
//
//  Created by Masato TSUTSUMI on 2020/02/03.
//  Copyright © 2020 Masato TSUTSUMI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textBox: UITextView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textBox.text = "たいへんだけど。かわいいからしかたないよね。いーっぱいあそびまくっていっぱいねてしんどいくらい喧嘩してでも、手をつないで、寝てる。ずーーっとこの繰り返し。"
        textField.text = "たかしあいしてる"
        
        textBox.layer.borderWidth = 2
        textField.layer.borderWidth = 2
        goButton.layer.borderColor = UIColor.systemBlue.cgColor
        goButton.layer.borderWidth = 2
    }

    @IBAction func buttonTapped(_ sender: Any) {
        let vcg = VerticalCryptogramGenerator(text: textBox.text, crypto: textField.text!, lineLength: 25)
        let cryptoText: String = vcg.generate()
        
        let vc = UIStoryboard.init(name: "Result", bundle: nil).instantiateInitialViewController()! as! ResultViewController
        vc.text = cryptoText
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

