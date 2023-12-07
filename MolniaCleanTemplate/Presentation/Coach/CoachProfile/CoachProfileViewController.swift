//
//  CoachProfileViewController.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 06.12.2023.
//

import UIKit

class CoachProfileViewController: UIViewController {
    
    private let viewModel: CoachProfileViewModel
    
    private lazy var firstNameLabel = UILabel()
    
    private lazy var lastNameLabel = UILabel()
    
    private lazy var coachStack: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.alignment = .center
        
        $0.addArrangedSubview(firstNameLabel)
        $0.addArrangedSubview(lastNameLabel)
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    // MARK: Init
    
    init(viewModel: CoachProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.yellow
        setupSubviews()
        bindViewModel()
        viewModel.updateState(with: .didRequestCoachProfile)
    }
    
    // MARK: Private methods
    
    private func bindViewModel() {
        viewModel.onStateDidChange = { [weak self] state in
            switch state {
            case .initial:
               return
            case .didLoadCoachProfile(let coach):
                self?.firstNameLabel.text = coach.firstName
                self?.lastNameLabel.text = coach.lastName
            }
        }
    }
    
    private func setupSubviews() {
        view.addSubview(coachStack)
        
        NSLayoutConstraint.activate([
            
            coachStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            coachStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            coachStack.widthAnchor.constraint(equalTo: view.widthAnchor)
            
        ])
    }
    
    
}
