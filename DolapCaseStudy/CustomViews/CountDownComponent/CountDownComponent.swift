//
//  CountDownComponent.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 4.04.2021.
//

import UIKit

class CountDownComponent: GenericBaseView<CountDownComponentData> {
    
    lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .brown
        return temp
    }()
    
    private var counterView: CounterView!
    
    override func addMajorFields() {
        super.addMajorFields()
        addComponent()
        setupCounterView()
    }
    
    private func addComponent() {
        addSubview(containerView)
        
        NSLayoutConstraint.activate([
        
            containerView.heightAnchor.constraint(equalToConstant: 50),
            containerView.widthAnchor.constraint(equalToConstant: 50),
            
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
    }
    
    private lazy var animationData = CounterViewAnimationAttributes(
        animationTime: 20,
        circleAnimationStyle: .decreasing,
        containerColor: .darkGray,
        circleAnimationColor: .blue,
        frameSize: 40,
        startImmediately: true)
    
    private func setupCounterView() {
        counterView = CounterView(frame: CGRect(x: 0, y: 0, width: 40, height: 40), circleAnimationAttributes: animationData)
        counterView.translatesAutoresizingMaskIntoConstraints = false
        counterView.layer.cornerRadius = 20
        counterView.delegate = self
        
        addSubview(counterView)
        
        NSLayoutConstraint.activate([
            
            counterView.heightAnchor.constraint(equalToConstant: 40),
            counterView.widthAnchor.constraint(equalToConstant: 40),
            counterView.centerYAnchor.constraint(equalTo: centerYAnchor),
            counterView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        
    }
    
    private func fireToReload() {
        guard let data = returnData() else { return }
        data.resetBlock?()
    }
    
}

extension CountDownComponent: CounterViewDelegate {
    func timerCountDown(finish: Bool) {
        counterView.startAnimation()
        fireToReload()
    }
    
}
