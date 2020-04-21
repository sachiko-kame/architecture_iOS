//
//  sampleTests.swift
//  sampleTests
//
//  Created by 水野祥子 on 2020/04/16.
//  Copyright © 2020 sachiko. All rights reserved.
//

import XCTest
@testable import sample

class sampleTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPresenterViewUpdate() {
        //目的1: view更新すべきところをテストすることでview更新もれを防ぐ(最終テスト前に気づくことでテスト時間を減らす)
        //目的2: view更新が必要以上に呼ばれていないかの確認(最終テスト前に気づくことでテスト時間を減らす)
        
        XCTContext.runActivity(named: "presenter特定アクション時にView更新処理が呼ばれること") { _ in
            //input = model
            let presenterInputStub = PresenterInputStub()
            //output = view
            let presenterOutputStub = PresenterOutputStub()
            
            let presenter = Presenter(view: presenterOutputStub, model: presenterInputStub)
            presenter.fetchItems() //1回 最初必須
            presenter.readChange(index: 0) //1回
            /*
             view更新処理があるメソッドをpresetterに追加した時はここに追加していく
             追加したぶん以下のcountも変えておく
             */
            XCTAssertTrue(presenterOutputStub.count == 2) // 1 + 1 = 2
        }
    }
}

//inputの挙動を同じようにする
class PresenterInputStub: ModelInput {

    //viewの更新を確認できることが目的のため全く同じものを返しておけば良い(今回の場合)
    func fetchItems(completion: @escaping ([Qiita]) -> ()) {
        completion([mock()])
    }
}

class PresenterOutputStub: PresenterOutput {
    
    var count: Int = 0
    
    func update() {//view更新 //countが+になればviewのupdateがされていることがわかる
        count += 1
    }
}

func mock() -> Qiita {
    return Qiita(Item:[
        "title": "Qiitaとは",
        "updated_at": "2020-04-21T16:14:22+09:00",
        "url": "https://qiita.com",
        "comments_count": 0,
        "likes_count": 0,
        "tags": [],
        "user": ["name":"sample", "profile_image_url": ""],
        "name": "sachiko",
        "id": "1"
    ])
}
