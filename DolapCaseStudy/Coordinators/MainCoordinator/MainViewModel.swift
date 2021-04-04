//
//  MainViewModel.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation
import DomainLayerPackage
import Combine
import NetworkLayerPackage

class MainViewModel: BaseViewModelDelegate {
    
    private let productUseCase: ProductUseCase
    private let socialUseCase: SocialUseCase
    
    private let productUseCaseCallBack = ProductUseCaseCallBack()
    private let socialUseCaseCallBack = SocialUseCaseCallBack()
    
    init(productUseCase: ProductUseCase, socialUseCase: SocialUseCase) {
        self.productUseCase = productUseCase
        self.socialUseCase = socialUseCase
    }
    
    func getProductData() {
        productUseCaseCallBack.listenSuccessReceived { [weak self](productResponse) in
            print("product response : \(productResponse)")
        }
        productUseCase.execute(with: ProductRequest(), by: productUseCaseCallBack)
    }
    
    func getSocialData() {
        socialUseCaseCallBack.listenSuccessReceived { [weak self](socialResponse) in
            print("social response : \(socialResponse)")
        }
        socialUseCase.execute(with: SocialRequest(), by: socialUseCaseCallBack)
    }
    

    func dismissCoordinator() {

    }
    
}
