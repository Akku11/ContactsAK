//
//  UIView+Extension.swift
//  MyContacts
//
//  Created by Akanksha Thakur on 31/7/22.
//

import Foundation
import UIKit

extension UIView {
  @discardableResult
  func forAutolayout() -> Self {
    translatesAutoresizingMaskIntoConstraints = false
    return self
  }
}

extension UIImageView {
  func roundedImage(size: CGFloat) {
    self.layer.cornerRadius = size
    self.clipsToBounds = true
    self.layer.borderWidth = 0.2
    self.layer.borderColor = UIColor.gray.cgColor
  }
}

// color pallet
extension UIColor {
  static var darkBlue: UIColor {return UIColor(red: 0/255.0, green: 0/255.0, blue: 102/255.0, alpha: 1)}
  static var pink: UIColor {return UIColor(red: 255/255.0, green: 70/255.0, blue: 125/255.0, alpha: 1)}
}


extension UIViewController {
  func navigateToDetailScreen(data: DataList) {
    let transferStoryBoard = UIStoryboard(name: "Main", bundle: .main)
    guard let transferViewController = transferStoryBoard.instantiateViewController(identifier: "ContactDetailViewController") as? ContactDetailViewController else {
      return
    }
    transferViewController.data = data
    self.navigationController?.pushViewController(transferViewController, animated: true)
  }
  
  func navigateToEditContactScreen(data: DataList) {
    let transferStoryBoard = UIStoryboard(name: "Main", bundle: .main)
    guard let transferViewController = transferStoryBoard.instantiateViewController(identifier: "EditContactViewController") as? EditContactViewController else {
      return
    }
    transferViewController.data = data
    self.navigationController?.pushViewController(transferViewController, animated: true)
  }
}


/// MARK: - cache image to save downloading data
let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    func loadImageUsingCache(urlString : String) {
        self.image = nil
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            print("data found")
            self.image = cachedImage
            return
        }
        let url = URL(string: urlString)
        if url == nil {return}
        downloadedFrom(link: urlString)
    }
    /// MARK: - download image and save to cache
    func downloadedFrom(link: String) {
        guard let url = URL(string: link) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            imageCache.setObject(image, forKey: link as NSString)
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
        }.resume()
    }
}
