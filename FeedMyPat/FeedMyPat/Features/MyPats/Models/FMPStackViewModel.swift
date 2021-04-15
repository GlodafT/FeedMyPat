//
//  FMPStackViewModel.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 15.04.21.
//

import UIKit

class FMPStackViewModel: UIStackView {
    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 15

        return stack
    }()
}
