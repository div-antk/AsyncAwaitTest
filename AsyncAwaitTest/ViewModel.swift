//
//  ViewModel.swift
//  AsyncAwaitTest
//
//  Created by Takuya Ando on 2021/11/11.
//

import Foundation

// actorは参照型のマルチスレッド対応の型
actor ViewModel: ObservableObject {
    
    var count: Int = 0
    
    func asyncCountUp() async -> String {
        sleep(1)
        self.count += 1
       
        return String(count)
    }
}
