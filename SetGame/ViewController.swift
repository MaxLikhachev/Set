//
//  ViewController.swift
//  SetGame
//
//  Created by Максим Лихачев on 07/12/2018.
//  Copyright © 2018 Максим Лихачев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var cardButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewFromModel();
        // Do any additional setup after loading the view, typically from a nib.
    }
    private func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            //button.setTitle(String (index), for: .normal)
            if index<12 { button.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.4431372549, blue: 0.4745098039, alpha: 1) }
        }
    }
}
