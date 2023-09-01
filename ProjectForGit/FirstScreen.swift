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
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
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
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 100),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - Configure
extension FirstScreen {
    
    private func configureContents() {
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
        nextButton.layer.cornerRadius = 10
        nextButton.backgroundColor = .lightGray
        nextButton.setTitle("İleri", for: .normal)
        nextButton.titleLabel?.font = UIFont(name: "TrebuchetMS-Bold", size: 20)
        nextButton.tintColor = .black
    }
    
    private func configureTargets() {
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension FirstScreen {
    
    @objc
    private func nextButtonTapped() {
        let vc = SecondScreen()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - SecondScreenDelegate
extension FirstScreen: SecondScreenDelegate {
    
    func showAlert() {
        let alertController = UIAlertController(title: "Tebrikler!", message: "İkinci ekrandan birinci ekrana döndün.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Tamam", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    func didReturnFromSecondScreen() {
        showAlert()
    }
}

// MARK: - ThirdScreenDelegate
extension FirstScreen: ThirdScreenDelegate {
    
    func showThirdAlert() {
        let alertController = UIAlertController(title: "Tebrikler!", message: "Üçüncü ekrandan.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Tamam", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    func didReturnFromThirdScreen() {
        showThirdAlert()
    }
}
