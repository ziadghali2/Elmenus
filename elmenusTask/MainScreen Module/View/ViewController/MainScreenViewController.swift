//
//  MainScreenViewController.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var itemsTableContainer: UIView!

    //MARK: - Attributes
    var interactor: MainScreenInteractorProtocol!
    var viewModel: MainScreenViewModel!
    var router: MainScreenRouterProtocol!
    
    //MARK: - init
    init(configurator: MainScreenConfigurator = MainScreenConfigurator.sharedInstance) {
        super.init(nibName: nil, bundle: nil)
        configure(configurator: configurator)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure(configurator: MainScreenConfigurator.sharedInstance)
    }
        
    private func configure(configurator: MainScreenConfigurator = MainScreenConfigurator.sharedInstance) {
        configurator.configure(viewController: self)
    }
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        interactor.getTags(viewModel.pageNumber)
    }

    //MARK: - Setup UI
    func setupUI() {
        setNavigationTitle()
        setupCollectionViewDelegateAndDataSource()
        registerCollectionView()
    }
    
    func setNavigationTitle() {
        title = viewModel.navigationTitle
    }
    
    func setupCollectionViewDelegateAndDataSource() {
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
    }
    
    func registerCollectionView() {
        let nibName = String(describing: TagCollectionCell.self)
        let nib = UINib(nibName: nibName, bundle: nil)
        mainCollectionView.register(nib, forCellWithReuseIdentifier: nibName)
    }
    
    func selectTag(_ tagName: String) {
        router.go(to: .items(tagName, itemsTableContainer))
    }
    
}

//MARK: - UICollectionViewDelegate & UICollectionViewDelegateFlowLayout
extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let models = viewModel.tagViewModels.value else {return}
        let model = models[indexPath.row]
        selectTag(model.name)
        if indexPath.row == models.count - 1 {
            viewModel.pageNumber += 1
            interactor.getTags(viewModel.pageNumber)
        }
    }
}

//MARK: - UICollectionViewDataSource & UICollectionViewDataSourcePrefetching
extension MainScreenViewController: UICollectionViewDataSource {
    
    // Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.tagViewModels.value?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = String(describing: TagCollectionCell.self)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? TagCollectionCell,
            let model = viewModel.tagViewModels.value?[indexPath.row],
            let photoUrl = model.photoURL
            else {return UICollectionViewCell()}
        cell.fillWith(model.name, photoUrl)
        return cell
    }

}

//MARK: - MainScreenViewControllerProtocol
extension MainScreenViewController: MainScreenViewControllerProtocol {
   
    func updateUIWithTags(_ tagViewModels: [TagViewModel]) {
        viewModel.tagViewModels.value? += tagViewModels
        mainCollectionView.reloadData()
    }
    
    func updateUIWihError(_ error: Error) {
        
    }
}
