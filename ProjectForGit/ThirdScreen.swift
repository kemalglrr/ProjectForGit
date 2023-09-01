//
//  ThirdScreen.swift
//  ProjectForGit
//
//  Created by Kemal Güler on 29.08.2023.
//

import UIKit

protocol ThirdScreenDelegate: AnyObject {
    func didReturnFromThirdScreen()
}

class ThirdScreen: UIViewController {
    
    weak var delegate: ThirdScreenDelegate?
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
    }
}

// MARK: - UILayout
extension ThirdScreen {
    
    private func addSubViews() {
        addLabel()
        addBackButton()
    }
    
    private func addLabel() {
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 256),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
    }
    
    private func addBackButton() {
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 100),
            backButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - Configure
extension ThirdScreen {
    
    private func configureContents() {
        configureView()
        configureLabel()
        configureBackButton()
        configureTargets()
    }
    
    private func configureView() {
        view.backgroundColor = .darkGray
    }
    
    private func configureLabel() {
        label.font = UIFont(name: "TrebuchetMS", size: 18)
        label.textColor = .white
        label.text = "Geri Dönmek İçin Ekranın Sol Sınırından Sağa Doğru Kaydırın Veya Geri Butona Basın."
    }
    
    private func configureBackButton() {
        backButton.layer.cornerRadius = 10
        backButton.backgroundColor = .lightGray
        backButton.setTitle("Geri", for: .normal)
        backButton.titleLabel?.font = UIFont(name: "TrebuchetMS-Bold", size: 20)
        backButton.tintColor = .black
    }
    
    private func configureTargets() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension ThirdScreen {
    
    @objc
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
        delegate?.didReturnFromThirdScreen()
    }
}
