//
//  ContactDetailViewController.swift
//  MyContacts
//
//  Created by Akanksha Thakur on 31/7/22.
//

import UIKit

class ContactDetailViewController: UIViewController {
  
  private enum Constant {
    static let commonPadding: CGFloat = 14
    static let outerViewSpacing: CGFloat = 8
    static let imageSize: CGFloat = 150
    static let buttonSize: CGFloat = 40
  }
  var data: DataList?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    setupLayouts()
    
    if let detail = data {
      imgView.loadImageUsingCache(urlString: detail.avatar)
      titleLabel.text = detail.firstName
      detailEmailAndMobileView.mobileNumber.text = "\(detail.id)"
      detailEmailAndMobileView.email.text = detail.email
    }
    
  }
  
  fileprivate func setupNavigationBar() {
    self.view.backgroundColor = .white
    self.navigationController?.navigationBar.tintColor = UIColor.white
    let logout = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editContact))
    logout.tintColor = .white
    self.navigationItem.rightBarButtonItem  = logout
  }
  
  @objc func editContact() {
    guard let detail = data else { return }
    navigateToEditContactScreen(data: detail)
  }
  
  public lazy var imgView: UIImageView = {
    let imageView = UIImageView().forAutolayout()
    imageView.image = UIImage(named: "ak")
    return imageView
  }()
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel().forAutolayout()
    label.backgroundColor = .clear
    label.textAlignment = .left
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    label.text = "Akanksha"
    return label
  }()
  
  private let stackViewOuter: UIStackView = {
    let view = UIStackView().forAutolayout()
    view.distribution = .fillEqually
    view.axis = .horizontal
    view.alignment = .top
    view.sizeToFit()
    return view
  }()
  
  private let stackView: UIStackView = {
    let view = UIStackView().forAutolayout()
    view.distribution = .equalSpacing
    view.axis = .horizontal
    view.alignment = .top
    view.sizeToFit()
    view.spacing = 4
    return view
  }()
  
  let messageFeaturesView = DetailFeaturesView(title: "message", image: "message.circle.fill").forAutolayout()
  let callFeaturesView = DetailFeaturesView(title: "call", image: "phone.circle.fill").forAutolayout()
  let emailFeaturesView = DetailFeaturesView(title: "email", image: "envelope.circle.fill").forAutolayout()
  let favFeaturesView = DetailFeaturesView(title: "favorite", image: "star").forAutolayout()
  
  private let containerView = UIView().forAutolayout()
  
  let detailEmailAndMobileView = DetailEmailAndMobileView(mobileNumber: "+92 27836823", email: "abc.comyqw").forAutolayout()
  
  private func setupLayouts() {
    containerView.addSubview(imgView)
    containerView.addSubview(titleLabel)
    self.view.addSubview(containerView)
    imgView.roundedImage(size: Constant.imageSize/2)
    
    containerView.addSubview(stackViewOuter)
    stackViewOuter.addArrangedSubview(stackView)
    stackViewOuter.sizeToFit()
    stackView.sizeToFit()
    stackView.addArrangedSubview(messageFeaturesView)
    stackView.addArrangedSubview(callFeaturesView)
    stackView.addArrangedSubview(emailFeaturesView)
    stackView.addArrangedSubview(favFeaturesView)

    self.view.addSubview(detailEmailAndMobileView)
    
    let bottomConstraitRequired =  detailEmailAndMobileView.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor, constant: -24)
    bottomConstraitRequired.priority = .required
    
    NSLayoutConstraint.activate([
      containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      
      imgView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2*Constant.commonPadding),
      imgView.heightAnchor.constraint(equalToConstant: Constant.imageSize),
      imgView.widthAnchor.constraint(equalToConstant: Constant.imageSize),
      imgView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      
      titleLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: Constant.commonPadding),
      titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

      stackViewOuter.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3*Constant.commonPadding),
      stackViewOuter.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 3*Constant.commonPadding),
      stackViewOuter.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -7*Constant.commonPadding),
      stackViewOuter.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24),
      stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24),
      
      messageFeaturesView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
      favFeaturesView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
      
      detailEmailAndMobileView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
      detailEmailAndMobileView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
      detailEmailAndMobileView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 90),
     bottomConstraitRequired
    ])
  }
}
