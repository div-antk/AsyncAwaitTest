//
//  ViewModel.swift
//  AsyncAwaitTest
//
//  Created by Takuya Ando on 2021/11/11.
//

import Foundation

// actorは参照型のマルチスレッド対応の型
actor ViewModel: ObservableObject {
    
    // messageというプロパティをUIで参照する。UIで参照するときはメインスレッドでアクセスする必要がある（そのためにMainActorの宣言をする）
    @MainActor @Published var message: String?
    
    var count: Int = 0
    
    // 非同期に結果を返すので、asyncのキーワードを設定する
    func fetchMessage(url: String) async -> String? {
        await Task.sleep(1 * 1000 * 1000 * 1000)
        count += 1
        let result = url + "?count=\(count)"
        
        // @MainActorのキーワードのプロパティをメインスレッドから変更する
        await MainActor.run { [weak self] in
            self?.message = result
        }
        return result
    }
}
