//
//  ANStackView.swift
//  Toters
//
//  Created by Abdallah Nehme on 03/06/2021.
//  Copyright © 2021 Toters. All rights reserved.
//

import UIKit

/// An internal helper class to simplify the creation of `UIStackView`.
@MainActor
class ANStackView {
    /// The configuration style for the stack view.
    let style: Style

    /// Creates a new stack view generator with a given style.
    init(style: Style) {
        self.style = style
    }

    /// Defines the axis, distribution, alignment, and spacing of the stack view.
    enum Style {
        case h(distribution: UIStackView.Distribution, alignment: UIStackView.Alignment = .fill, spacing: CGFloat?)
        case v(distribution: UIStackView.Distribution, alignment: UIStackView.Alignment = .fill, spacing: CGFloat?)
    }

    /// A lazily computed `UIStackView` instance based on the provided style.
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
