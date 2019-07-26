//
//  DetailsView.swift
//  PDFReaderModule
//
//  Created by Anton Boyarkin on 25/07/2019.
//

import UIKit
import FlexLayout
import PinLayout
import IBACore
import IBACoreUI
import PKHUD
import PDFKit

@available(iOS 11.0, *)
public class DetailsView: UIView {
    private let rootFlexContainer = UIView()
    
    public let pdfView = PDFView()
    public let thumbnailView = PDFThumbnailView()
    
    private let model: ItemModel
    private let colorScheme: ColorSchemeModel
    
    init(model: ItemModel, colorScheme: ColorSchemeModel) {
        self.model = model
        self.colorScheme = colorScheme
        super.init(frame: .zero)
        
        backgroundColor = colorScheme.backgroundColor
        
        addSubview(rootFlexContainer)
        
        pdfView.displayDirection = .horizontal
        pdfView.usePageViewController(true)
        pdfView.pageBreakMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        pdfView.autoScales = true
        pdfView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        
        thumbnailView.pdfView = pdfView
        thumbnailView.thumbnailSize = CGSize(width: 50, height: 50)
        thumbnailView.layoutMode = .horizontal
        thumbnailView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        
        if let link = model.url, let url = URL(string: link) {
            pdfView.document = PDFDocument(url: url)
        }
        
        rootFlexContainer.flex.define { (flex) in
            flex.addItem(pdfView).grow(1)
            flex.addItem(thumbnailView).height(50)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        rootFlexContainer.pin.all(pin.safeArea)
        rootFlexContainer.flex.layout(mode: .fitContainer)
        
        // This call is required to fix PDF document scale, seems to be bug inside PDFKit
        pdfView.autoScales = true
    }
}
