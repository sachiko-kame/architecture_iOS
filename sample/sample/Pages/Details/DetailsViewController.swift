//
//  DetailsViewController.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/27.
//  Copyright © 2020 sachiko. All rights reserved.
//

import UIKit

protocol DetailsView {
    var presenter:DetailsPresentation! { get set }
    func show(_ qiita:Qiita)
}

final class DetailsViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    var presenter: DetailsPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension DetailsViewController: DetailsView {
    func show(_ qiita: Qiita) {
        titleLabel.text = qiita.title
    }
}
