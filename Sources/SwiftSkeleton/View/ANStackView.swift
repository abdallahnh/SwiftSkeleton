//
//  ANStackView.swift
//  Toters
//
//  Created by Abdallah Nehme on 03/06/2021.
//  Copyright © 2021 Toters. All rights reserved.
//

import UIKit

@MainActor
class ANStackView {
    let style: Style

    init(style: Style) {
        self.style = style
    }

    enum Style {
        case h(distribution: UIStackView.Distribution, alignment: UIStackView.Alignment = .fill, spacing: CGFloat?)
        case v(distribution: UIStackView.Distribution, alignment: UIStackView.Alignment = .fill, spacing: CGFloat?)
    }

    lazy var view: UIStackView = {
        let sv = UIStackView()
        switch self.style {
        case .h(let distribution, let alignment, let spacing):
            sv.axis = .horizontal
            sv.alignment = alignment
            sv.distribution = distribution
            sv.spacing = spacing ?? 0
        case .v(let distribution, let alignment, let spacing):
            sv.axis = .vertical
            sv.alignment = alignment
            sv.distribution = distribution
            sv.spacing = spacing ?? 0
        }
        return sv
    }()
}
