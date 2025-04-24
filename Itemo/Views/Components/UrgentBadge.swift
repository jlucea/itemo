//
//  UrgentLabel.swift
//  Itemo
//
//  Created by Jaime Lucea on 23/4/25.
//

import UIKit

class UrgentBadgeView: UIView {

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 12, weight: .bold)
        imageView.image = UIImage(systemName: "exclamationmark.triangle.fill", withConfiguration: config)
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 14),
            imageView.heightAnchor.constraint(equalToConstant: 14)
        ])
        return imageView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.text = "URGENT"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.alignment = .center
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        backgroundColor = .systemRed
        layer.cornerRadius = 6
        layer.masksToBounds = true

        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(label)
        addSubview(stackView)

        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 14),
            iconImageView.heightAnchor.constraint(equalToConstant: 14)
        ])

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
    }
}

