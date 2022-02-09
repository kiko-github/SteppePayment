//
//  OptionViewModel.swift
//  SteppePayment
//
//  Created by tugsu on 2022.02.07.
//

import Foundation

class OptionViewModel: BaseViewModel {
    var options = [OptionListResponse.Option]()
    func fetchAllOption(completion: @escaping VoidResponse) {
        ConnectionFactory.shared.fetchOptionList(
            success: { [weak self] response in
                self?.options = response.data
                completion()
            },
            failure: { _ in
            }
        )
    }
}
