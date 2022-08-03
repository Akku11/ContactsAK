//
//  DetailFeaturesView.swift
//  MyContacts
//
//  Created by Akanksha Thakur on 1/8/22.
//

import Foundation
import UIKit

class DetailFeaturesView: UIView {
  private enum Constant {
    static let commonPadding: CGFloat = 14
    static let outerViewSpacing: CGFloat = 8
    static let imageSize: CGFloat = 150
    static let buttonSize: CGFloat = 40
  }
  
  init(title: String, image: String) {
    super.init(frame: .zero)
    setupView()
    self.titleIcon.text = title
    self.buttonIcon.setImage(UIImage(systemName: image, withConfiguration: UIImage.SymbolConfiguration(pointSize: 80, weight: .ultraLight)), for: .normal)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private let stackViewIcon: UIStackView = {
    let view = UIStackView().forAutolayout()
    view.distribution = .equalSpacing
    view.axis = .vertical
    view.alignment = .center
    view.spacing = 2
    return view
  }()
  
  public lazy var buttonIcon: UIButton = {
    let btn = UIButton().forAutolayout()
    btn.layer.cornerRadius = Constant.buttonSize/2
    btn.clipsToBounds = true
    btn.tintColor = .systemGreen
    return btn
  }()
  
  public lazy var titleIcon: UILabel = {
    let label = UILabel().forAutolayout()
    label.backgroundColor = .clear
    label.textAlignment = .center
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    label.text = ""
    return label
  }()
  
  private func setupView() {
    addSubview(stackViewIcon)
    stackViewIcon.addArrangedSubview(buttonIcon)
    stackViewIcon.addArrangedSubview(titleIcon)
    
    NSLayoutConstraint.activate([
      buttonIcon.heightAnchor.constraint(equalToConstant: Constant.buttonSize),
      buttonIcon.widthAnchor.constraint(equalToConstant: Constant.buttonSize),
      
      titleIcon.widthAnchor.constraint(equalToConstant: 1.5*Constant.buttonSize)
    ])
  }
  
}
