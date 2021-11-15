//
//  ViewController.swift
//  AsyncAwaitTest
//
//  Created by Takuya Ando on 2021/11/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
   
    let vm = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func countUpButtonAction(_ sender: Any) {
        Task {
            numberLabel.text = await vm.countUp()
        }
    }
}

