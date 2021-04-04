//
//  RatingStarComponent.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

class RatingStarComponent: UIStackView {
    
    private var ratingButtons = [UIButton]()
    private var data: RatingStarComponentData!
    
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }

    init(frame: CGRect, starStackViewData: RatingStarComponentData) {
        self.data = starStackViewData
        super.init(frame: frame)
        
        alignment = .fill
        axis = .horizontal
        distribution = .fill
        spacing = data.starSpacing

        
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - major functions
extension RatingStarComponent {
    
    private func setupButtons() {
        // Clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: data.filledImage, in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: data.emptyImage, in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: data.filledImage, in: bundle, compatibleWith: self.traitCollection)
        
        for index in 0 ..< data.starCount {
            // Create the button
            let button = UIButton()
            
            // Set the button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: data.imageSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: data.imageSize.width).isActive = true
            
            // Set the accessibility label
            button.accessibilityLabel = "Set \(index + 1) star rating"
            button.sizeToFit()

            // Setup the button action
            button.addTarget(self, action: .starButtonTapped, for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
//            if #available(iOS 11.0, *) {
//                setCustomSpacing(15, after: button)
//            } else {
//                // Fallback on earlier versions
//            }
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
        
        updateButtonSelectionStates()
        
    }
    
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
            
            // Set accessibility hint and value
            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero."
            } else {
                hintString = nil
            }
            
            let valueString: String
            switch (rating) {
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) stars set."
            }
            
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
    
    @objc func starButtonTapped(_ sender: UIButton) {
        guard let index = ratingButtons.index(of: sender) else {
            fatalError("The button, \(sender), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
    }
    
    func setStarRatingExternally(index: Int) {
        // Calculate the rating of the selected button
        let selectedRating = index
        rating = selectedRating
    }
    
    func changeDeselectedButtonImage(imageName: String) {
        for item in arrangedSubviews {
            if let button = item as? UIButton {
                let bundle = Bundle(for: type(of: self))
                let emptyStar = UIImage(named: imageName, in: bundle, compatibleWith: self.traitCollection)
                button.setImage(emptyStar, for: .normal)
            }
        }
    }
    
}

fileprivate extension Selector {
    static let starButtonTapped = #selector(RatingStarComponent.starButtonTapped)
}
