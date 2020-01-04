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
    
    var interactor: MainScreenInteractorProtocol!
    var viewModel: MainScreenViewModel!
    var router: MainScreenRouter!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        interactor.getTags(0)
    }

    //MARK: - Setup UI
    func setupUI() {
        setupCollectionViewDelegateAndDataSource()
        registerCollectionView()
    }
    
    func setupCollectionViewDelegateAndDataSource() {
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
    }
    
    func registerCollectionView() {
        let nibName = String(describing: MainScreenCell.self)
        let nib = UINib(nibName: nibName, bundle: nil)
        mainCollectionView.register(nib, forCellWithReuseIdentifier: nibName)
    }
    
}

//MARK: - UICollectionViewDelegate & UICollectionViewDelegateFlowLayout

extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let model = viewModel.tagViewModels.value?[indexPath.row] else {return}
        router.go(to: .items(model.name))
    }
    
}

//MARK: - UICollectionViewDataSource & UICollectionViewDataSourcePrefetching

extension MainScreenViewController: UICollectionViewDataSource {
    
    // Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.tagViewModels.value?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = String(describing: MainScreenCell.self)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? MainScreenCell,
            let model = viewModel.tagViewModels.value?[indexPath.row],
            let photoUrl = model.photoURL
            else {return UICollectionViewCell()}
        cell.fillWith(model.name, photoUrl)
        return cell
    }

}

extension MainScreenViewController: MainScreenViewControllerProtocol {
   
    func updateUIWithTags(_ tagViewModels: [TagViewModel]) {
        viewModel.tagViewModels.value = tagViewModels
        mainCollectionView.reloadData()
    }
    
    func updateUIWihError(_ error: Error) {
        
    }
}
