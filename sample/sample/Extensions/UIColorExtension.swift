//
//  UIColorExtension.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/16.
//  Copyright © 2020 sachiko. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }

    // TODO: 色はアセットで定義する
    class var unread: UIColor { UIColor(hex: "4682b4") }
    class var read: UIColor { UIColor(hex: "f08080") }
}
