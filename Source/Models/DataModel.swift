//
//  DataModel.swift
//  PDFReaderModule
//
//  Created by Anton Boyarkin on 25/07/2019.
//

import Foundation
import IBACore
import IBACoreUI

struct DataModel: Codable {
    var colorScheme: ColorSchemeModel?
    var title: String
    var items: [ItemModel]?
    
    enum CodingKeys: String, CodingKey {
        case colorScheme = "colorskin"
        case title
        case items = "row"
    }
}

struct ItemModel: Codable, CellModelType {
    var title: String
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "#title"
        case url = "#url"
    }
    
    var isPdf: Bool {
        return url?.contains(".pdf") ?? false
    }
}
