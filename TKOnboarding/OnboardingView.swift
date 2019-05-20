//
//  OnboardingView.swift
//  TKOnboarding
//
//  Created by Slobodan Kovrlija on 5/17/19.
//  Copyright © 2019 Slobodan Kovrlija. All rights reserved.
//

import UIKit

public class OnboardingView: UIView {

    // MARK: IBOutlets
    @IBOutlet private weak var topLabel: UILabel!
    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var pageImageView: UIImageView!
    @IBOutlet private weak var pageLabel: UILabel!
    
    // MARK: Properties
    let nibName = "OnboardingView"
    var contentView: UIView!
    
    // MARK: Set Up View
    public override init(frame: CGRect) {
        // For use in code
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        // For use in Interface Builder
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        contentView = loadViewFromNib()
        contentView.frame = bounds
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": contentView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": contentView]))
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return nibView
    }
    
    // Functions that customize the view
    public func setTopLabel(text: String) {
        topLabel.text = text
    }
    
    public func setMainLabel(text: String) {
        mainLabel.text = text
    }
    
    public func setPageLabel(text: String) {
        pageLabel.text = text
    }
    
    public func setPageImage(_ image: UIImage) {
        pageImageView.image = image
    }

}
