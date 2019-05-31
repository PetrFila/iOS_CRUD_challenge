//
//  AutoresizingConstrainsExtension.swift
//  stickers_CRUD
//
//  Created by Petr Fila on 22/5/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func translateAutoresizingConstraintsToElements(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        return
    }
}
