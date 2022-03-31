//
//  ViewController.swift
//  testMobileup
//
//  Created by Артем Соловьев on 31.03.2022.
//

import UIKit
import VK_ios_sdk

class AuthViewController: UIViewController {
    
    private lazy var button : UIButton = {
        let imageView = UIButton()
        imageView.setTitle("Вход через VK", for: .normal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = .black
        imageView.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return imageView
    }()
    @objc func buttonAction(sender: UIButton!) {
        authService.wakeUpSession()
    }
    
    private lazy var label : UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: ".SFProText-Regular-Bold", size: 48)
        titleLabel.text = "Mobile Up Gallery"
        return titleLabel
    }()
    
    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        authService = SceneDelegate.shared().authService
    }
    
    fileprivate func configView() {
        self.view.backgroundColor = .white
        setupButton()
        setupLabel()
    }
    
    private func setupButton() {
        self.view.addSubview(button)
        NSLayoutConstraint.activate([
            self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
            self.button.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -106),
            self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50)
        ])
    }
    
    private func setupLabel() {
        self.view.addSubview(label)
        NSLayoutConstraint.activate([
            self.label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            self.label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
            self.label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 164),
            self.label.heightAnchor.constraint(equalToConstant: 114) //bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0.03)
        ])
    }
    

}

