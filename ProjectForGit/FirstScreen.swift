//
//  ViewController.swift
//  ProjectForGit
//
//  Created by Kemal Güler on 26.08.2023.
//

import UIKit

class FirstScreen: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContent()
    }
}

// MARK: - UILayout
extension FirstScreen {
    
    private func addSubviews() {
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
extension FirstScreen {
    
    private func configureContent() {
        configureView()
        configureLabel()
        configureButton()
        configureTargets()
    }
    
    private func configureView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configureLabel() {
        label.font = UIFont(name: "TrebuchetMS", size: 18)
        label.text = "Butona Basın Ve Bir Sonraki Ekrana İlerleyin."
        label.textColor = .cyan
    }
    
    private func configureButton() {
        button.layer.cornerRadius = 10
        button.backgroundColor = .lightGray
        button.setTitle("İleri", for: .normal)
        button.titleLabel?.font = UIFont(name: "TrebuchetMS-Bold", size: 20)
        button.tintColor = .black
    }
    
    private func configureTargets() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension FirstScreen {
    
    @objc
    private func buttonTapped() {
        let vc = SecondScreen()
        navigationController?.pushViewController(vc, animated: true)
    }
}
