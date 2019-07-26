//
//  ContentItemDetailsViewController.swift
//  PDFReaderModule
//
//  Created by Anton Boyarkin on 25/07/2019.
//

import UIKit
import IBACore
import IBACoreUI
import MessageUI
import SafariServices

@available(iOS 11.0, *)
class ContentItemDetailsViewController: BaseViewController {
    private var data: ItemModel?
    private var colorScheme: ColorSchemeModel?
    
    // MARK: - Controller life cycle methods
    convenience init(with colorScheme: ColorSchemeModel?, data: ItemModel?) {
        self.init()
        self.data = data
        self.colorScheme = colorScheme
    }
    
    fileprivate var mainView: DetailsView {
        return self.view as! DetailsView
    }
    
    override public func loadView() {
        if let data = data, let colorScheme = colorScheme {
            view = DetailsView(model: data, colorScheme: colorScheme)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
