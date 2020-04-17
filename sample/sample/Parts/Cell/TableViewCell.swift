//
//  TableViewCell.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/17.
//  Copyright © 2020 sachiko. All rights reserved.
//

import UIKit

protocol tableViewCellProtocol:class {
    func readButtonTap(index:Int, isRead:Bool)
}

class TableViewCell: UITableViewCell {
    
    var qiita:Qiita?
    var delegate:tableViewCellProtocol?
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var readButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(qiita:Qiita){
        self.qiita = qiita
        self.titleLabel.text = qiita.title
        self.titleLabel.textColor = .darkGray
        self.readButton.setTitleColor(.white, for: .normal)
        
        if qiita.isRead == true {
            self.readButton.setTitle("既読", for: .normal)
            self.readButton.backgroundColor = .read
        }else{
            self.readButton.setTitle("未読", for: .normal)
            self.readButton.backgroundColor = .unread
        }
        
        let imgURL = URL(string: qiita.profile_image_url)!
        let session = URLSession(configuration: .default)
        let download = session.dataTask(with: imgURL) { (data, response, error) in
            if (response as? HTTPURLResponse) != nil{
                if let imageData = data {
                    DispatchQueue.main.async {
                        let imageimage = UIImage(data: imageData)
                        self.userImageView.image = imageimage
                    }
                }
            }
        }
        session.invalidateAndCancel()
        download.resume()
        
    }
    
    func noSet(){
        self.titleLabel.text = "取得に失敗しました"
        self.titleLabel.textColor = .darkGray
        self.readButton.isHidden = true
    }
    
    static let height:CGFloat = 100
    
    @IBAction func readButtonTap(_ sender: UIButton) {
        guard let indexPath = (self.superview as! UITableView).indexPath(for: self) else { return }
            guard let qiitaItem = self.qiita else { return }
            
            print(indexPath.row)
        
            self.delegate?.readButtonTap(index: indexPath.row, isRead:!(qiitaItem.isRead))
    }
}
