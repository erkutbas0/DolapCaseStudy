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

    private var productResponse: ProductResponse?
    private var socialResponse: SocialResponse?
    private var numberOfItem: Int?
    
    private let dataSubject = PassthroughSubject<CollectionLoadingState, Never>()
    
    init(productUseCase: ProductUseCase, socialUseCase: SocialUseCase) {
        self.productUseCase = productUseCase
        self.socialUseCase = socialUseCase
    }
    
    private func getProductData(with group: DispatchGroup? = nil) {
        productUseCaseCallBack.listenSuccessReceived { [weak self] (productResponse) in
            print("product response : \(productResponse)")
            self?.productResponse = productResponse
            group?.leave()
        }
        productUseCase.execute(with: ProductRequest(), by: productUseCaseCallBack)
    }
    
    private func getSocialData(with group: DispatchGroup? = nil, via completion: VoidOperation? = nil) {
        socialUseCaseCallBack.listenSuccessReceived { [weak self] (socialResponse) in
            print("social response : \(socialResponse)")
            self?.socialResponse = socialResponse
            completion?()
            group?.leave()
        }
        socialUseCase.execute(with: SocialRequest(), by: socialUseCaseCallBack)
    }
    
    func getData() {
        let group = DispatchGroup()
        
        group.enter()
        getProductData(with: group)
        
        group.enter()
        getSocialData(with: group)
        
        group.notify(queue: .main) { [weak self] in
            print("hepsini aldik")
            self?.fireData()
        }
    }
    
    private lazy var countDownListener: VoidOperation = { [weak self] in
        self?.getSocialData(via: {
            self?.fireData()
        })
    }
    
    private func fireData() {
        numberOfItem = 1
        dataSubject.send(.done)
    }
    
    func getNumberOfItem() -> Int {
        return numberOfItem ?? 0
    }
    
    func getItem(at indexPath: IndexPath) -> GenericDataProtocol {
        let commentCount = (socialResponse?.commentCounts?.anonymousCommentsCount ?? 0 ) + (socialResponse?.commentCounts?.memberCommentsCount ?? 0)
        return ProductDetailComponentData(productHeaderComponentData: ProductHeaderComponentData(infoLabeldata: ProductInfoLabelData(name: productResponse?.name, description: productResponse?.productResponseDescription), likeInfoComponentData: LikeInfoComponentData(likeCount: socialResponse?.likeCount ?? 0)), ratingInfoComponentData: RatingInfoComponentData(ratingCount: socialResponse?.commentCounts?.averageRating ?? 0, commentCount: CommentCountLabelData(count: commentCount)), priceAndCounterComponentData: PriceAndCounterComponentData(priceLabelData: PriceLabelData(price: Double(productResponse?.price?.value ?? 0)), countDownData: CountDownComponentData().setResetBlock(by: countDownListener)))
    }
    
    func listenData(completion: @escaping (CollectionLoadingState) -> Void) -> AnyCancellable {
        return dataSubject.sink(receiveValue: completion)
    }
    
    func dismissCoordinator() {
        
    }
}
