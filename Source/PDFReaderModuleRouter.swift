//
//  PDFReaderModuleRouter.swift
//  PDFReaderModule
//
//  Created by Anton Boyarkin on 25/07/2019.
//

import IBACore
import IBACoreUI

public enum PDFReaderModuleRoute: Route {
    case root
}

public class PDFReaderModuleRouter: BaseRouter<PDFReaderModuleRoute> {
    var module: PDFReaderModule?
    init(with module: PDFReaderModule) {
        self.module = module
    }

    public override func generateRootViewController() -> BaseViewControllerType {
        return ContentListViewController(type: module?.config?.type, data: module?.data)
    }

    public override func prepareTransition(for route: PDFReaderModuleRoute) -> RouteTransition {
        return RouteTransition(module: generateRootViewController(), isAnimated: true)
    }

    public override func rootTransition() -> RouteTransition {
        return self.prepareTransition(for: .root)
    }
}
