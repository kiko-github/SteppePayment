//
//  OptionListResponse.swift
//  SteppePayment
//
//  Created by tugsu on 2022.02.07.
//

import Foundation

class OptionListResponse: BaseResponse {
    var data = [Option]()
    
    private enum CodingKeys: String, CodingKey {
        case data
    }

    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decodeIfPresent([Option].self, forKey: .data) ?? []
        try super.init(from: decoder)
    }
    
    struct Option: Codable {
        var name: String?
        var imageUrl: String?
        var type: String?
        var slug: String?
    }
}
