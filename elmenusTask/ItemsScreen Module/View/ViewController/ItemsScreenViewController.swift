//
//  ItemsViewController.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import UIKit

class ItemsScreenViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var itemsTableView: UITableView!
    
    //MARK: - Attributes
    
    var interactor: ItemsScreenInteractorProtocol!
    var viewModel: ItemsScreenViewModel!
    var router: ItemsScreenRouterProtocol!
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Setup UI
    
    func setupUI() {
        setupItemsTableViewDelegateAndDataSource()
        registerItemsTableViewCells()
    }
    
    func setupItemsTableViewDelegateAndDataSource() {
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
    }
    
    func registerItemsTableViewCells() {
        let nibName = String(describing: ItemTableCell.self)
        let nib = UINib(nibName: nibName, bundle: nil)
        itemsTableView.register(nib, forCellReuseIdentifier: nibName)
    }
    
}

//MARK: - UITableViewDelegate & UITableViewDataSource

extension ItemsScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemViewModels.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nibName = String(describing: ItemTableCell.self)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: nibName, for: indexPath) as? ItemTableCell,
            let model = viewModel.itemViewModels.value?[indexPath.row],
            let photoUrl = model.photoURL
            else {return UITableViewCell()}
        cell.fillWith(model.name, photoUrl)
        return cell
    }
    
    
}

//MARK: - ItemsScreenViewControllerProtocol

extension ItemsScreenViewController: ItemsScreenViewControllerProtocol {
    
    func updateUIWithItems(_ itemsViewModels: [ItemViewModel]) {
        viewModel.itemViewModels.value = itemsViewModels
        itemsTableView.reloadData()
    }
    
    func updateUIWihError(_ error: Error) {
        
    }
    
}
