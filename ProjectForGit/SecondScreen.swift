//
//  SecondScreen.swift
//  ProjectForGit
//
//  Created by Kemal Güler on 26.08.2023.
//

import UIKit

protocol SecondScreenDelegate: AnyObject {
    func didReturnFromSecondScreen()
}

class SecondScreen: UIViewController {
    
    weak var delegate: SecondScreenDelegate?
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
extension SecondScreen {
    
    private func addSubViews() {
        addLabel()
        addNextButton()
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
    
    private func addNextButton() {
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 100),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func addBackButton() {
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 50),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 100),
            backButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - Configure
extension SecondScreen {
    
    private func configureContents() {
        configureView()
        configureLabel()
        configureNextButton()
        configureBackButton()
        configureTargets()
    }
    
    private func configureView() {
        view.backgroundColor = .darkGray
    }
    
    private func configureLabel() {
        label.font = UIFont(name: "TrebuchetMS", size: 18)
        label.textColor = .white
        label.text = "Geri Dönmek İçin Ekranın Sol Sınırından Sağa Doğru Kaydırın Veya Butona Basın."
    }
    
    private func configureNextButton() {
        nextButton.layer.cornerRadius = 10
        nextButton.backgroundColor = .lightGray
        nextButton.setTitle("İleri", for: .normal)
        nextButton.titleLabel?.font = UIFont(name: "TrebuchetMS-Bold", size: 20)
        nextButton.tintColor = .black
    }
    
    private func configureBackButton() {
        backButton.layer.cornerRadius = 10
        backButton.backgroundColor = .lightGray
        backButton.setTitle("Geri", for: .normal)
        backButton.titleLabel?.font = UIFont(name: "TrebuchetMS-Bold", size: 20)
        backButton.tintColor = .black
    }
    
    private func configureTargets() {
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension SecondScreen {
    
    @objc
    private func nextButtonTapped() {
        let vc = ThirdScreen()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
        delegate?.didReturnFromSecondScreen()
    }
}

// MARK: - ThirdScreenDelegate
extension SecondScreen: ThirdScreenDelegate {
    
    func showAlert() {
        let alertController = UIAlertController(title: "Tebrikler!", message: "Üçüncü ekrandan.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Tamam", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    func didReturnFromThirdScreen() {
        showAlert()
    }
}
