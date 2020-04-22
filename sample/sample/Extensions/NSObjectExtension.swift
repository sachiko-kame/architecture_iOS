//
//  NSObjectExtension.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/16.
//  Copyright © 2020 sachiko. All rights reserved.
//

import Foundation

extension NSObject {
    class var className: String { String(describing: self) }
}
