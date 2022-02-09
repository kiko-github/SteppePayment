//
//  OptionVC.swift
//  SteppePayment
//
//  Created by tugsu on 2022.02.07.
//

import Foundation

public class OptionVC: UICollectionViewController {
    let viewModel = OptionViewModel()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.registerCell(nibName: OptionCell.reuseIdentifier)
        viewModel.fetchAllOption(completion: { [weak self] in
            self?.collectionView?.reloadData()
        })
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension OptionVC: UICollectionViewDelegateFlowLayout {
    
    public override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OptionCell.reuseIdentifier, for: indexPath)
        return cell
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let inset = CGFloat(25.0)
        let width = collectionView.bounds.size.width - (inset * 2)
        return CGSize(width: width, height:120)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        let inset = CGFloat(25.0)
//        let width = collectionView.bounds.size.width - inset
//        return CGSize(width: width, height: 140)
//    }
    
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = CGFloat(25.0)
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        25
    }
    
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        25
    }
}

extension UICollectionView {
    func registerCell(nibName: String) {
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }

//    func registerHeader(nibName: String) {
//        self.register(UINib(nibName: nibName, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: nibName)
//    }
}

