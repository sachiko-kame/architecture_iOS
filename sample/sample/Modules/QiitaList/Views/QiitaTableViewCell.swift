//
//  QiitaTableViewCell.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/16.
//  Copyright © 2020 sachiko. All rights reserved.
//

import UIKit

protocol QiitaTableViewCellProtocol {
    func didTapReadButton(index: Int)
}

final class QiitaTableViewCell: UITableViewCell {
    
    // MARK: Stored Type Properties
    
    static let height: CGFloat = 100.0
    
    // MARK: Stored Instance Properties
    
    var delegate: QiitaTableViewCellProtocol?
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel! {
        willSet {
            newValue.textColor = .darkGray
            newValue.text = nil
        }
    }
    @IBOutlet private weak var readButton: UIButton! {
        willSet {
            newValue.setTitleColor(.white, for: .normal)
        }
    }
    
    // MARK: IBActions
    
    @IBAction private func didTapReadButton(_ sender: UIButton) {
        guard let indexPath = (self.superview as! UITableView).indexPath(for: self) else {
            return
        }
        self.delegate?.didTapReadButton(index: indexPath.row)
    }
    
    // MARK: Other Internal Methods
    
    func setupForRead(title: String, profileImageURLString: String) {
        self.readButton.setTitle("既読", for: .normal)
        self.readButton.backgroundColor = .read
        setup(title: title, profileImageURLString: profileImageURLString)
    }

    func setupForUnread(title: String, profileImageURLString: String) {
        self.readButton.setTitle("未読", for: .normal)
        self.readButton.backgroundColor = .unread
        setup(title: title, profileImageURLString: profileImageURLString)
    }
    
    func setupForError() {
        self.titleLabel.text = "取得に失敗しました"
        self.titleLabel.textColor = .darkGray
        self.readButton.isHidden = true
    }
    
    // MARK: Other Private Methods
    
    private func setup(title: String, profileImageURLString: String) {
        self.titleLabel.text = title
        self.readButton.isHidden = false
        
        // TODO: 画像取得を別クラスで行って分岐をなくす。ライブラリを使ってもいいと思う
        let imageURL = URL(string: profileImageURLString)!
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if (response as? HTTPURLResponse) != nil {
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.userImageView.image = image
                    }
                }
            }
        }.resume()
    }
}
