//
//  CounterView.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 4.04.2021.
//

import UIKit

enum CounterViewAnimationStyle {
    case increasing
    case decreasing
}

struct CounterViewAnimationAttributes {
    var animationTime: Int = 10
    var circleAnimationStyle: CounterViewAnimationStyle = .decreasing
    var containerColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    var circleAnimationColor: UIColor = #colorLiteral(red: 1, green: 0.7725490196, blue: 0, alpha: 1)
    var frameSize: CGFloat = 50
    var startImmediately: Bool = true
    
    init(animationTime: Int, circleAnimationStyle: CounterViewAnimationStyle, containerColor: UIColor, circleAnimationColor: UIColor, frameSize: CGFloat, startImmediately: Bool) {
        self.animationTime = animationTime
        self.circleAnimationStyle = circleAnimationStyle
        self.containerColor = containerColor
        self.circleAnimationColor = circleAnimationColor
        self.frameSize = frameSize
        self.startImmediately = startImmediately
    }
    
    init(animationTime: Int, circleAnimationStyle: CounterViewAnimationStyle, frameSize: CGFloat, startImmediately: Bool) {
        self.animationTime = animationTime
        self.circleAnimationStyle = circleAnimationStyle
        self.frameSize = frameSize
        self.startImmediately = startImmediately
    }
    
    init(animationTime: Int, circleAnimationStyle: CounterViewAnimationStyle, startImmediately: Bool) {
        self.animationTime = animationTime
        self.circleAnimationStyle = circleAnimationStyle
        self.startImmediately = startImmediately
    }
    
}

protocol CounterViewDelegate: class {
    func timerCountDown(finish : Bool)
}

class CounterView: UIView {
    
    lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        return temp
    }()
    
    lazy var counterLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        temp.textColor = #colorLiteral(red: 0.1529411765, green: 0.1803921569, blue: 0.2117647059, alpha: 1)
        return temp
    }()
    
    // circle shape layers
    private let shapeLayer = CAShapeLayer()
    private let trackLayer = CAShapeLayer()
    private var timer: Timer?
    private var second: Int = 0
    
    private var animationAttributes: CounterViewAnimationAttributes?
    
    weak var delegate: CounterViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareViewConfigurations()
        
    }
    
    init(frame: CGRect, circleAnimationAttributes: CounterViewAnimationAttributes) {
        animationAttributes = circleAnimationAttributes
        super.init(frame: frame)
        prepareViewConfigurations()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareViewConfigurations() {
        
        setMainViewConfigurations()
        addViews()
        addCircleAnimationView()
        setCounterLabelInitialValue()
        
    }
    
    private func setMainViewConfigurations() {
        isUserInteractionEnabled = false
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.8;
        layer.shadowRadius = 15;
    }
    
    private func setCounterLabelInitialValue() {
        counterLabel.text = "\(returnCircleViewAnimationAttributes().animationTime)"
    }

    private func addViews() {
        addSubview(containerView)
        addSubview(counterLabel)
    
//        if #available(iOS 11.0, *) {
//        }
        
        NSLayoutConstraint.activate([
            
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.heightAnchor.constraint(equalToConstant: returnContainerFrameSize().height),
            containerView.widthAnchor.constraint(equalToConstant: returnContainerFrameSize().width),
            
            counterLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            counterLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            ])
        
    }
    
    private func returnContainerFrameSize() -> CGSize {
        if let animationAttributes = animationAttributes {
            return CGSize(width: animationAttributes.frameSize, height: animationAttributes.frameSize)
        }
        
        // default size value
        return CGSize(width: 50, height: 50)
    }
    
    private func addCircleAnimationView() {
        
        let animationAttributes = returnCircleViewAnimationAttributes()
        
        let center = CGPoint(x: animationAttributes.frameSize / 2, y: animationAttributes.frameSize / 2)

        let circularPath = UIBezierPath(arcCenter: center, radius: animationAttributes.frameSize / 2, startAngle: 3 * CGFloat.pi / 2, endAngle: -CGFloat.pi / 2, clockwise: false)
        
        trackLayer.path = circularPath.cgPath
        
        trackLayer.strokeColor = animationAttributes.containerColor.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        layer.addSublayer(trackLayer)
        
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = animationAttributes.circleAnimationColor.cgColor
        shapeLayer.lineWidth = 6
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        switch animationAttributes.circleAnimationStyle {
        case .decreasing:
            shapeLayer.strokeStart = 0.001
            shapeLayer.strokeEnd = 1
        case .increasing:
            shapeLayer.strokeStart = 0
            shapeLayer.strokeEnd = 0
        }
        
        layer.addSublayer(shapeLayer)
        
        if animationAttributes.startImmediately {
            startAnimation()
        }
        
    }
    
    private func returnCircleViewAnimationAttributes() -> CounterViewAnimationAttributes {
        guard let animationAttributes = animationAttributes else { return CounterViewAnimationAttributes(animationTime: 10, circleAnimationStyle: .decreasing, startImmediately: true)
            
        }
        return animationAttributes
    }
    
    @objc fileprivate func timerUpdate() {
        second -= 1
        counterLabel.text = "\(second)"
        
        if second < 1 {
            timer?.invalidate()
            delegate?.timerCountDown(finish: true)
            resetTimerText()
        }
        
    }
    
    private func resetTimerText() {
        let animationAttributes = returnCircleViewAnimationAttributes()
        
        delay(1) {
            self.counterLabel.text = "\(animationAttributes.animationTime)"
        }
        
    }
    
    private func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    /// Description: It can be called from outside as well
    public func startAnimation() {
        let animationAttributes = returnCircleViewAnimationAttributes()
        
        second = animationAttributes.animationTime
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: .timerUpdate, userInfo: nil, repeats: true)
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        switch animationAttributes.circleAnimationStyle {
        case .decreasing:
            basicAnimation.fromValue = 1
            basicAnimation.toValue = 0
        case .increasing:
            basicAnimation.fromValue = 0
            basicAnimation.toValue = 1
        }
        
        basicAnimation.duration = CFTimeInterval(animationAttributes.animationTime)
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
        
    }
    
    public func invalidateTimer(fromOutside: Bool) {
        timer?.invalidate()
        resetTimerText()
    }
    
    func askCircleViewTime() -> Int {
        return second
    }
    
    // MARK: - Externally Called Functions -
    func invalidateTimer() {
        timer?.invalidate()
    }
    
}

fileprivate extension Selector {
    static let timerUpdate = #selector(CounterView.timerUpdate)
}
