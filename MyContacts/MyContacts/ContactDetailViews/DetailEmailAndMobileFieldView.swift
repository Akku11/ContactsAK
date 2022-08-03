//
//  DetailEmailAndMobileFieldView.swift
//  MyContacts
//
//  Created by Akanksha Thakur on 1/8/22.
//

import Foundation
import UIKit

class DetailEmailAndMobileView: UIView {
  private enum Constant {
    static let commonPadding: CGFloat = 14
    static let outerViewSpacing: CGFloat = 8
    static let imageSize: CGFloat = 150
    static let buttonSize: CGFloat = 40
  }
  
  init(mobileNumber: String, email: String) {
    super.init(frame: .zero)
    setupView()
    self.mobileNumber.text = mobileNumber
    self.email.text = email
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  private let stackOuter: UIStackView = {
    let view = UIStackView().forAutolayout()
    view.distribution = .fill
    view.axis = .horizontal
    view.alignment = .center
    view.spacing = 8
    return view
  }()
  
  private let stackViewMobile: UIStackView = {
    let view = UIStackView().forAutolayout()
    view.distribution = .fill
    view.axis = .horizontal
    view.alignment = .center
    view.spacing = 8
    return view
  }()
  
  private let stackViewEmail: UIStackView = {
    let view = UIStackView().forAutolayout()
    view.distribution = .fill
    view.axis = .horizontal
    view.alignment = .leading
    view.spacing = 8
    return view
  }()
  
  public lazy var mobileTitle: UILabel = {
    let label = UILabel().forAutolayout()
    label.backgroundColor = .clear
    label.textAlignment = .left
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    label.text = "mobile"
    label.sizeToFit()
    label.setContentHuggingPriority(.defaultLow, for: .horizontal)
    return label
  }()
  
  public lazy var emailTitle: UILabel = {
    let label = UILabel().forAutolayout()
    label.backgroundColor = .clear
    label.textAlignment = .left
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    label.text = "email"
    label.sizeToFit()
    label.setContentHuggingPriority(.defaultLow, for: .horizontal)
    return label
  }()
  
  public lazy var mobileNumber: UILabel = {
    let label = UILabel().forAutolayout()
    label.backgroundColor = .clear
    label.textAlignment = .left
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    label.text = ""
    label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    return label
  }()
  
  public lazy var email: UILabel = {
    let label = UILabel().forAutolayout()
    label.backgroundColor = .clear
    label.textAlignment = .left
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    label.text = ""
    label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    return label
  }()
  
  
  private func setupView() {
    addSubview(stackViewMobile)
    addSubview(stackViewEmail)
    stackViewMobile.addArrangedSubview(mobileTitle)
    stackViewMobile.addArrangedSubview(mobileNumber)
    stackViewEmail.addArrangedSubview(emailTitle)
    stackViewEmail.addArrangedSubview(email)
    
    NSLayoutConstraint.activate([
      stackViewMobile.topAnchor.constraint(equalTo: self.topAnchor),
      stackViewMobile.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      stackViewMobile.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      stackViewMobile.bottomAnchor.constraint(equalTo: stackViewEmail.topAnchor, constant: -24),
      
      stackViewEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      stackViewEmail.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      stackViewEmail.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      
      mobileTitle.widthAnchor.constraint(equalToConstant: 90),
      emailTitle.widthAnchor.constraint(equalToConstant: 90),
    ])
  }
  
}
