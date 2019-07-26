//
//  ItemCell.swift
//  PDFReaderModule
//
//  Created by Anton Boyarkin on 25/07/2019.
//

import UIKit
import IBACore
import IBACoreUI
import PinLayout
import FlexLayout

class ItemCell: UITableViewCell, BaseCellType {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    var onAction: ((ItemModel) -> Void)?
    
    typealias ModelType = ItemModel
    
    private let padding: CGFloat = 8
    private let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        contentView.flex.padding(10).define { flex in
            flex.addItem(titleLabel).marginLeft(10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: ModelType) {
        titleLabel.text = model.title
        titleLabel.flex.markDirty()
        flex.layout()
    }
    
    func setColorScheme(_ colorScheme: ColorSchemeModel) {
        titleLabel.textColor = colorScheme.secondaryColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    fileprivate func layout() {
        contentView.flex.layout(mode: .adjustHeight)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        contentView.pin.width(size.width)
        
        layout()
        
        return contentView.frame.size
    }
}
