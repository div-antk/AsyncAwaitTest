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
        
        numberLabel.text = vm.message
    }
    
    @IBAction func countUpButtonAction(_ sender: Any) {
        Task {
            await vm.fetchMessage(url: "うどん")
        }
    }
}

