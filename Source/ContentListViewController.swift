//
//  ContentListViewController.swift
//  PDFReaderModule
//
//  Created by Anton Boyarkin on 25/07/2019.
//

import UIKit
import IBACore
import IBACoreUI
import SafariServices

class ContentListViewController: BaseListViewController<ItemCell> {
    // MARK: - Private properties
    /// Widget type indentifier
    private var type: String?
    
    /// Widger config data
    private var data: DataModel?
    
    private var colorScheme: ColorSchemeModel?
    
    // MARK: - Controller life cycle methods
    convenience init(type: String?, data: DataModel?) {
        let colorScheme = data?.colorScheme ?? AppManager.manager.appModel()?.design?.colorScheme
        self.init(with: colorScheme, data: data?.items)
        self.type = type
        self.data = data
        self.colorScheme = colorScheme
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .darkGray
        
        self.onItemSelect = { item in
            if item.isPdf {
                if #available(iOS 11.0, *) {
                    let vc = ContentItemDetailsViewController(with: self.data?.colorScheme, data: item)
                    self.navigationController?.pushViewController(vc, animated: true)
                } else {
                    if let link = item.url, let url = URL(string: link) {
                        let vc = SFSafariViewController(url: url)
                        self.present(vc, animated: true, completion: nil)
                    }
                }
            } else {
                if let link = item.url, let url = URL(string: link) {
                    let vc = SFSafariViewController(url: url)
                    self.present(vc, animated: true, completion: nil)
                }
            }
        }
    }
}
