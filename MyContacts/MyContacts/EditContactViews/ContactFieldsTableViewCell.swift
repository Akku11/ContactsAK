//
//  ContactFieldsTableViewCell.swift
//  MyContacts
//
//  Created by Akanksha Thakur on 2/8/22.
//

import Foundation
import UIKit

class ContactFieldsTableViewCell: UITableViewCell {
  
  private enum Constant {
    static let commonPadding: CGFloat = 14
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupLayouts()
    contentView.isUserInteractionEnabled = true
    self.isUserInteractionEnabled = true
    self.selectionStyle = .none
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    contentView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      contentView.leftAnchor.constraint(equalTo: leftAnchor),
      contentView.rightAnchor.constraint(equalTo: rightAnchor),
      contentView.topAnchor.constraint(equalTo: topAnchor),
      contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  private let containerView = UIView().forAutolayout()
  
  public lazy var titleLabel: UILabel = {
    let label = UILabel().forAutolayout()
    label.backgroundColor = .clear
    label.textAlignment = .left
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    label.text = ""
    label.isUserInteractionEnabled = true
    return label
  }()
  
  public lazy var textField: UITextField = {
    let textField = UITextField().forAutolayout()
    textField.backgroundColor = .clear
    textField.textAlignment = .left
    textField.textColor = .black
    textField.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    textField.text = ""
    textField.isUserInteractionEnabled = true
    textField.allowsEditingTextAttributes = true
    return textField
  }()
  
  public func setFieldData(title: String, value: String) {
    titleLabel.text = title
    textField.text = value
    if titleLabel.text == "Mobile Number" {
      textField.isUserInteractionEnabled = false
    } else {
      textField.isUserInteractionEnabled = true
    }
  }
  
  private func setupLayouts() {
    containerView.addSubview(titleLabel)
    containerView.addSubview(textField)
    contentView.addSubview(containerView)
    containerView.isUserInteractionEnabled = true
    
    NSLayoutConstraint.activate([
      containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constant.commonPadding),
      containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constant.commonPadding),
      containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constant.commonPadding),
      containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constant.commonPadding),
      
      titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constant.commonPadding),
      titleLabel.trailingAnchor.constraint(equalTo: textField.leadingAnchor, constant: -4*Constant.commonPadding),
      titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
      titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
      
      textField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -2*Constant.commonPadding),
      textField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
      textField.topAnchor.constraint(equalTo: containerView.topAnchor),
    ])
  }
}
