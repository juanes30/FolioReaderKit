//
//  FloatingActionButton.swift
//  FolioReaderKit
//
//  Created by Juan Londoño Tabares on 10/06/20.
//  Copyright © 2020 FolioReader. All rights reserved.
//

import UIKit


class FloatingActionButton: UIButton {
    var buttonColor: UIColor?
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.backgroundColor = buttonColor?.cgColor
    }
}
