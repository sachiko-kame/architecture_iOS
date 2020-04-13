//
//  NSObjectExtension.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/13.
//  Copyright © 2020 sachiko. All rights reserved.
//

import UIKit

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}
