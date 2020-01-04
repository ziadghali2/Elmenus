//
//  DetailsScreenViewController.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsScreenViewController: UIViewController {

    //MARK: - Outlet
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemDescription: UILabel!
    
    //MARK: - Attributes
    var viewModel: DetailsScreenViewModel!
    var router: DetailsScreenRouterProtocol!
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Setup UI
    private func setupUI() {
        setupNavigationTitle()
        setupUIWithViewModel()
    }
    
    private func setupNavigationTitle() {
        title = viewModel.itemViewModel.name
    }
    
    private func setupUIWithViewModel() {
        itemImageView.kf.indicatorType = .activity
        itemImageView.kf.setImage(with: viewModel.itemViewModel.photoURL)
        itemDescription.text = viewModel.itemViewModel.description
    }

}
