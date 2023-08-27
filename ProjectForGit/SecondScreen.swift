//
//  SecondScreen.swift
//  ProjectForGit
//
//  Created by Kemal Güler on 26.08.2023.
//

import UIKit

class SecondScreen: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContent()
    }
}

// MARK: - UILayout
extension SecondScreen {
    
    private func addSubViews() {
        addLabel()
    }
    
    private func addLabel() {
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
    }
}

// MARK: - Configure
extension SecondScreen {
    
    private func configureContent() {
        configureView()
        configureLabel()
    }
    
    private func configureView() {
        view.backgroundColor = .darkGray
    }
    
    private func configureLabel() {
        label.font = UIFont(name: "TrebuchetMS", size: 18)
        label.textColor = .white
        label.text = "Geri Dönmek İçin Ekranın Sol Sınırından Sağa Doğru Kaydırınız."
    }
}
