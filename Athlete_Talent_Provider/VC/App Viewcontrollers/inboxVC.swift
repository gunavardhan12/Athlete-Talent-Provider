//
//  inboxVC.swift
//  Athlete_Talent_Provider
//
//  Created by RaJ TiWaRi on 28/05/24.
//

import UIKit

class inboxVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet var inboxTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        inboxTableView.register(UITableViewCell.self , forCellReuseIdentifier: "cell")
        inboxTableView.delegate = self
        inboxTableView.dataSource = self
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white ]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        // Do any additional setup after loading the view.
    }
    @IBAction func backButton(_ sender: Any) {
        let inboxvc = storyboard?.instantiateViewController(withIdentifier: "mainVC")
        present(inboxvc!, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Testing Admin"
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .darkGray
        cell.textLabel?.textColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // show meassages of dm
        let cell = tableView.cellForRow(at: indexPath)
        let chatvc = chatVC()
        chatvc.title = cell?.textLabel?.text
        navigationController?.pushViewController(chatvc, animated: true)
    }
    


}
