
//  Created by Akanksha Thakur on 30/11/21.
import UIKit

class ListTableViewController: UITableViewController {
  let cellId = "cellId"
  var record: [Contact]?
  var keys: [String]?
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Contacts"
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    appearance.backgroundColor = .pink
    navigationController?.navigationBar.standardAppearance = appearance
    navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance

    view.backgroundColor = .red
    self.clearsSelectionOnViewWillAppear = true
    self.view.backgroundColor = .white
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 44
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(ListTableViewCell.self, forCellReuseIdentifier: cellId)
    setupModel()

  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.contactViewModel.requestContacts()
    record = getRecord()
  }
  private var contactViewModel: ContactListViewModelRequest!
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return contactViewModel.contactListResponse?.data.count ?? 0
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ListTableViewCell else { return UITableViewCell()}
    if var data = contactViewModel.contactListResponse?.data , let value = record {
      for val in value {
        if String(data[indexPath.row].id) == val.id {
          contactViewModel.contactListResponse?.data[indexPath.row].firstName = val.firstName ?? data[indexPath.row].firstName
          contactViewModel.contactListResponse?.data[indexPath.row].lastName = val.lastName ?? data[indexPath.row].lastName
        }
      }
    }
  
    cell.name = contactViewModel.contactListResponse?.data[indexPath.row].firstName ?? ""
    if let url = contactViewModel.contactListResponse?.data[indexPath.row].avatar  {
      cell.url = url
    }
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let data = contactViewModel.contactListResponse?.data[indexPath.row] {
      navigateToDetailScreen(data: data)
    }
  }
  
  fileprivate func setupModel() {
    contactViewModel =  ContactListViewModelRequest()
    self.contactViewModel.success = {[weak self] in
      DispatchQueue.main.async {
        self?.tableView.reloadData()
      }
    }
    self.contactViewModel.error = {[weak self] errorMessage in
      DispatchQueue.main.async {
        
      }
    }
  }
}
