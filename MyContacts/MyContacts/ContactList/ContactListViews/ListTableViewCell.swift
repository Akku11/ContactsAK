//  Created by Akanksha Thakur on 30/11/21.

import UIKit
import Foundation

class ListTableViewCell: UITableViewCell {
  
  private enum Constant {
    static let commonPadding: CGFloat = 14
    static let outerViewSpacing: CGFloat = 8
    static let imageSize: CGFloat = 70
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupLayouts()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel().forAutolayout()
    label.backgroundColor = .clear
    label.textAlignment = .left
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    label.text = ""
    return label
  }()
  
  private let containerView = UIView().forAutolayout()
  
  public lazy var imgView: UIImageView = {
    let imageView = UIImageView().forAutolayout()
    imageView.image = UIImage(named: "ak")
    return imageView
  }()
  
  var name = "" {
    didSet {
      titleLabel.text = name
    }
  }
  
  var url = "" {
    didSet {
      imgView.loadImageUsingCache(urlString: url)
    }
  }
  
  private func setupLayouts() {
    containerView.addSubview(imgView)
    containerView.addSubview(titleLabel)
    contentView.addSubview(containerView)
    imgView.roundedImage(size: Constant.imageSize/2)
    NSLayoutConstraint.activate([
      containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constant.commonPadding),
      containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constant.commonPadding),
      
      titleLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: Constant.commonPadding),
      titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
      titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
      titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
      
      imgView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constant.commonPadding),
      imgView.heightAnchor.constraint(equalToConstant: Constant.imageSize),
      imgView.widthAnchor.constraint(equalToConstant: Constant.imageSize),
      imgView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
      imgView.topAnchor.constraint(greaterThanOrEqualTo: containerView.topAnchor),
      imgView.bottomAnchor.constraint(greaterThanOrEqualTo: containerView.bottomAnchor),
    ])
  }
}
