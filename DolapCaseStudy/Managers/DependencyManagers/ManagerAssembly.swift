//
//  ManagerAssembly.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import DataLayerPackage
import DomainLayerPackage
import NetworkLayerPackage
import Alamofire

class ManagerAssemby: Assembly {
    
    func assemble(container: Container) {
        container.autoregister(TokenProviderInterface.self, initializer: TokenProvider.init).inObjectScope(.container)
        container.autoregister(EventMonitoringDelegate.self, initializer: ApiDefaultEventMonitoringManager.init).inObjectScope(.container)
        container.autoregister(RequestInterceptor.self, initializer: ApiInterceptor.init).inObjectScope(.container)
        container.autoregister(RequestRetrier.self, initializer: ApiRequestRetrier.init).inObjectScope(.container)
        container.autoregister(RequestAdapter.self, initializer: ApiRequestAdapter.init).inObjectScope(.container)
        container.autoregister(ApiManagerInterface.self, initializer: ApiManager.init).inObjectScope(.container)
        
        container.autoregister(ImageCacheManager.self, initializer: ImageCacheManager.init).inObjectScope(.container)
    }
    
}
