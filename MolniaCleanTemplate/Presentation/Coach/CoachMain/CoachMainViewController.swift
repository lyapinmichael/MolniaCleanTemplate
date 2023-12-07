//
//  ViewController.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 06.12.2023.
//

import UIKit

class CoachMainViewController: UIViewController {
    
  
    private let viewModel: CoachMainViewModel
    
    private var players: [Player] = []
    
    private lazy var mainTable: UITableView = {
        $0.dataSource = self
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITableView())
    
    // MARK: Init
    
    init(viewModel: CoachMainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = UIColor.green
        setupSubviews()
        bindViewModel()
        viewModel.updateState(with: .didRequestPlayers)
    }
    
    private func bindViewModel() {
        viewModel.onStateDidChange = { [weak self] state in
            switch state {
            case.initial:
                return
            case .didLoadPlayers(let players):
                self?.players = players
                self?.mainTable.reloadData()
            }
        }
    }
    
    private func setupSubviews() {
        view.addSubview(mainTable)
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
        
            mainTable.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            mainTable.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            mainTable.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            mainTable.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
            
        ])
        
        
    }


}


extension CoachMainViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var cellConfiguration = UIListContentConfiguration.cell()
        let player = players[indexPath.row]
        cellConfiguration.text = "\(player.firstName) \(player.lastName)"
        cellConfiguration.image = UIImage(systemName: "person.circle.fill")
        
        cell.contentConfiguration = cellConfiguration
        
        return cell
    }
    
    
}

