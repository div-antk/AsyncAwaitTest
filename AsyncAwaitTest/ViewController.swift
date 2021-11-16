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
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func countUpButtonAction(_ sender: Any) {
        numberLabel.text = syncCountUp()
    }
    
    @IBAction func asyncCountUpButtonAction(_ sender: Any) {
        Task {
            print("あしんく")
            numberLabel.text = await asyncCountUp()
        }
    }
    
    func syncCountUp() -> String {
        sleep(5)
        self.count += 1
       
        return String(count)
    }

    func asyncCountUp() async -> String {
        sleep(5)
        self.count += 1
       
        return String(count)
    }
}

