//
//  PlanetTableViewController.swift
//  SWAPIObjC
//
//  Created by tyson ericksen on 12/5/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import UIKit

class PlanetTableViewController: UITableViewController {
    
    var planets: [LBTPlanet] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        LBTPlanetController.fetchPlanets { (planets, error) in
                self.planets = planets
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         let height = self.view.frame.height / 6
        return height
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "planetCell", for: indexPath) as? PlanetTableViewCell else { return UITableViewCell() }

        let planet = planets[indexPath.row]
        cell.planets = planet

        return cell
    }
}
