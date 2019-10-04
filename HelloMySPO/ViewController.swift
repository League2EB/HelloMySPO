//
//  ViewController.swift
//  HelloMySPO
//
//  Created by Lazy on 2019/4/25.
//  Copyright © 2019 Lazy. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    let api = APi()
    let bag: DisposeBag! = DisposeBag()

    /// 藝人ID
    let id: String = "0PaQoJb70VpcofM9CA4Lfd"
    /// 鑰匙
    let token: String = "BQC1Fl-qx87onLCcYHfPDKlB6csnwZbOTAyfXWMXk6xY87keNSNSQ_6z-CN5ht-7DxFCOywKHLEKInXW0M4"

    override func viewDidLoad() {
        super.viewDidLoad()

        api.fetch(id: id, token: token).subscribe(onNext: { (result) in
            for i in result.tracks {
                print("\"name\":\"\(i.name)\",")
                print("\"preview_url\":\"\(i.mp3URL)\"")
            }
        }).disposed(by: bag)
    }
}

