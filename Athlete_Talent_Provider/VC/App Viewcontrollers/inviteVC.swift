//
//  inviteVC.swift
//  Athlete_Talent_Provider
//
//  Created by RaJ TiWaRi on 24/05/24.
//

import UIKit
import Contacts

var list = [contactModel]()

class inviteVC: UIViewController{
    
    var searching = false
    var searchedName = [contactModel]()
    
    @IBOutlet weak var contactSearchBar: UISearchBar!
    @IBOutlet weak var contactsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        contactSearchBar.delegate = self
        fetchContacts()
        // Do any additional setup after loading the view.
    }
    
    
    private func fetchContacts(){
        print("Attempting to fetch contacts...")
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, err) in
            if let err = err {
                print("failed to get access: ", err)
                return
            }
            if granted{
                print("access granted")
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactImageDataKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                do{
                    try store.enumerateContacts(with: request, usingBlock: {contact,stopPointerIfYouWantToStopEnumerating in
                        let data = contactModel(name: "\(contact.givenName) \(contact.familyName)", phoneNumber: contact.phoneNumbers.first?.value.stringValue ?? "", imageData: contact.imageData)
                        list.append(data)
                        })
                } catch let err{
                    print(err)
                }
                list.sort(by: {$0.name < $1.name})
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                    self.contactsTableView.reloadData()
                }
            }
            else {
                print("access denied")
            }
        }
        
    }
    @IBAction func sendInviteButton(_ sender: Any) {
        
        let inboxvc = storyboard?.instantiateViewController(withIdentifier: "nc") 
        present(inboxvc!, animated: true)
    }
}

extension inviteVC: UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searching ? searchedName.count : list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! inviteVCTablecell
        var currentCell = searching ? searchedName[indexPath.row] : list[indexPath.row]
        
        cell.name.text = currentCell.name
        cell.number.text = currentCell.phoneNumber
        if((currentCell.imageData) != nil){
            cell.image1?.image = UIImage(data: currentCell.imageData!)
            imageRoundCorner(cell.image1!)
        }
        else{
            cell.image1?.image = UIImage(systemName: "person.circle.fill")
            cell.image1?.tintColor = .systemRed
        }
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searching = false
            searchedName.removeAll()
        } else {
            searching = true
            searchedName = list.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        contactsTableView.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.contactSearchBar.endEditing(true)
    }
}
