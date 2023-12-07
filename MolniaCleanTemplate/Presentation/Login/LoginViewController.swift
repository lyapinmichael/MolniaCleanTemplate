//
//  LoginViewController.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 06.12.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    weak var navigationFlow: NavigationFlow?
    let viewModel: LoginViewModel
    
    private lazy var loginPlayerButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .blue
        configuration.title = "Login as Player"
        
        $0.configuration = configuration
        
        let action = UIAction { [weak self] _ in
            self?.viewModel.updateState(with: .didTapLoginPlayerButton)
        }
        
        $0.addAction(action, for: .touchUpInside)
        
        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return $0
    }(UIButton())
    
    private lazy var loginCoachButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .orange
        configuration.title = "Login as Coach"
        
        $0.configuration = configuration
        
        let action = UIAction { [weak self] _ in
            self?.viewModel.updateState(with: .didTapLoginCoachButton)
        }
        
        $0.addAction(action, for: .touchUpInside)
        
        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return $0
    }(UIButton())
    
    private lazy var buttonsStack: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 16
        
        $0.addArrangedSubview(loginPlayerButton)
        $0.addArrangedSubview(loginCoachButton)
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    // MARK: Init
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        setupSubviews()
        bindViewModel()
    }
    
    // MARK: Private methods
    
    private func bindViewModel() {
        viewModel.onStateDidChange = { [weak self] state in
            switch state {
            case .initial:
                return
                
            case .waitingForLogin:
                self?.loginCoachButton.isEnabled = false
                self?.loginPlayerButton.isEnabled = false
                
            case .proceedToUserFlow(let userProfile):
                self?.navigationFlow?.rootCoordinator?.startUserFlow(for: userProfile)
            }
        }
    }
    
    private func setupSubviews() {
        view.addSubview(buttonsStack)
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
        
            
            buttonsStack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            buttonsStack.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            buttonsStack.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor)
            
        ])
    }
    
}
