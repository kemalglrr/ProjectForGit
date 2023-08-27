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
    
    private let button: UIButton = {
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
extension SecondScreen {
    
    private func addSubViews() {
        addLabel()
        addButton()
    }
    
    private func addLabel() {
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 256),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
    }
    
    private func addButton() {
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - Configure
extension SecondScreen {
    
    private func configureContents() {
        configureView()
        configureLabel()
        configureButton()
        configureTargets()
    }
    
    private func configureView() {
        view.backgroundColor = .darkGray
    }
    
    private func configureLabel() {
        label.font = UIFont(name: "TrebuchetMS", size: 18)
        label.textColor = .white
        label.text = "Geri Dönmek İçin Ekranın Sol Sınırından Sağa Doğru Kaydırın Veya Butona Basınız."
    }
    
    private func configureButton() {
        button.layer.cornerRadius = 10
        button.backgroundColor = .lightGray
        button.setTitle("Geri", for: .normal)
        button.titleLabel?.font = UIFont(name: "TrebuchetMS-Bold", size: 20)
        button.tintColor = .black
    }
    
    private func configureTargets() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension SecondScreen {
    
    @objc
    private func buttonTapped() {
        navigationController?.popToRootViewController(animated: true)
        let vc = FirstScreen()
        let alertController = UIAlertController(title: "TEBRİKLER!", message: "İlk ekrana başarıyla döndün.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Tamam", style: .default)
        alertController.addAction(okAction)
    }
}
