//
//  BaseCollectionVC.swift
//  SteppePayment
//
//  Created by tugsu on 2022.02.07.
//

import Foundation
import UIKit

class BaseCollectionVC: UICollectionViewController {
    static let defaultInset = 25
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        collectionView?.backgroundColor = .white
        if #available(iOS 11.0, *) {
            collectionView?.contentInsetAdjustmentBehavior = .always
        } else {
            // Fallback on earlier versions
        }
        edgesForExtendedLayout = []
        extendedLayoutIncludesOpaqueBars = false
    }
    
    func pushVC(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}

