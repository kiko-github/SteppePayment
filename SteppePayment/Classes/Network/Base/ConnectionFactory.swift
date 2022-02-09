//
//  ConnectionFactory.swift
//  SteppePayment
//
//  Created by tugsu on 2022.02.03.
//

import Foundation

public class ConnectionFactory {
    public static let shared = ConnectionFactory()
    
    enum ApiType: String {
        case optionList = "/sdk/options"
    }
    
    func fetchOptionList(success: @escaping (OptionListResponse) -> Void, failure: @escaping ConnectionFailure) {
        let url = ApiType.optionList.rawValue
        ConnectionManager<OptionListResponse>.get(
            using: url,
            success: success,
            failure: failure
        )
    }
}
