//
//  ViewController.swift
//  MagicTravel
//
//  Created by Диана Мишкова on 29.10.23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var countiesTableView: UITableView!
    
    var countries: [String] = ["Germany","France", "China", "Brazil", "Australia", "India", "Canada", "USA", "Mexico", "Ghana", "Egypt", "Argentina"]
    
    var continentCountry: [String: String] = ["Germany": "Europe","France": "Europe", "China": "Asia", "Brazil": "South America", "Australia": "Australia", "India": "Asia", "Canada": "North America", "USA": "North America", "Mexico": "South America", "Ghana": "Africa", "Egypt": "Africa", "Argentina": "South America"]
    
    struct Constants {
        static let cellIdentifier = "cell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        countiesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)

        
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        
        var cellContentConfiguration = tableViewCell.defaultContentConfiguration()
        let countryName = countries[indexPath.row]
        cellContentConfiguration.text = countryName
        cellContentConfiguration.secondaryText = continentCountry[countryName] ?? ""
        tableViewCell.contentConfiguration = cellContentConfiguration
        
        return tableViewCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("user tapped on cell at \(indexPath)")
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "showCountryDetails", sender: self)
    }
}
