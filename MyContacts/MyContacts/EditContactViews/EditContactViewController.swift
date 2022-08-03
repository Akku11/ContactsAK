//
//  EditContactViewController.swift
//  MyContacts
//
//  Created by Akanksha Thakur on 1/8/22.
//

import UIKit

class EditContactViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
  private enum Constant {
    static let commonPadding: CGFloat = 14
    static let imageSize: CGFloat = 150
  }
  var data: DataList?
  var fieldData: [String: String] = [:]
  var fieldKeys: [String] = ["FirstName", "LastName", "Mobile Number"]
  var fieldDataEdited: [String: String] = [:]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayouts()
    tableViewSetup()
    navigationBarItemSetup()
    
    if let detail = data {
      imgView.loadImageUsingCache(urlString: detail.avatar)
      titleLabel.text = detail.firstName
      fieldData["FirstName"] = detail.firstName
      fieldData["LastName"] = detail.lastName
      fieldData["Mobile Number"] = String(detail.id)
    }
    
    let tapGesture = UITapGestureRecognizer(target: self,
                     action: #selector(hideKeyboard))
    view.addGestureRecognizer(tapGesture)
  }
  
  @objc func hideKeyboard() {
      view.endEditing(true)
  }
  
  fileprivate func navigationBarItemSetup() {
    let done = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(done))
    done.tintColor = .white
    self.navigationItem.rightBarButtonItem  = done
    
    let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancel))
    cancel.tintColor = .white
    self.navigationItem.leftBarButtonItem  = cancel
  }
  
  @objc func done() {
    self.view.endEditing(true)
    if let id = fieldDataEdited["id"], let firstName = fieldDataEdited["FirstName"], let lastName = fieldDataEdited["LastName"] {
      createRecord(id: id, firstName: firstName, lastName: lastName)
    }
    self.dismiss(animated: true)
  }
  
  @objc func cancel() {
    self.navigationController?.popViewController(animated: true)
  }
  
  fileprivate func tableViewSetup() {
    self.tableView.allowsSelection = true
    self.tableView.isUserInteractionEnabled = true
    tableView.register(ContactFieldsTableViewCell.self, forCellReuseIdentifier: cellId)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.allowsMultipleSelection = true
    tableView.allowsMultipleSelectionDuringEditing = true
  }
  
  let cellId = "ContactFieldsTableViewCell"
  private let containerView = UIView().forAutolayout()
  
  private var tableView: UITableView = {
    let tableView = UITableView().forAutolayout()
    tableView.backgroundColor = .white
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 44
    tableView.isUserInteractionEnabled = true
    return tableView
  }()
  
  public lazy var imgView: UIImageView = {
    let imageView = UIImageView().forAutolayout()
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
    label.text = ""
    return label
  }()
  
  private func setupLayouts() {
    containerView.addSubview(imgView)
    containerView.addSubview(titleLabel)
    self.view.addSubview(containerView)
    imgView.roundedImage(size: Constant.imageSize/2)
    
    self.view.addSubview(tableView)
    
    
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
      titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Constant.commonPadding),
      
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constant.commonPadding),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
    
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return fieldData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ContactFieldsTableViewCell else { return UITableViewCell()}
    cell.setFieldData(title: fieldKeys[indexPath.row], value: fieldData[fieldKeys[indexPath.row]] ?? "")
    cell.textField.delegate = self
    cell.textField.tag = indexPath.row
    return cell
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    guard let text = textField.text else { return }
    if text.isEmpty { return }
    if textField.tag == 0 {
      fieldDataEdited["FirstName"] = text
      fieldDataEdited["LastName"] = fieldData[fieldKeys[1]]
    } else {
      fieldDataEdited["FirstName"] = fieldData[fieldKeys[0]]
      fieldDataEdited["LastName"] = text
    }
    fieldDataEdited["id"] = fieldData[fieldKeys[2]]
  }
  

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  
}
