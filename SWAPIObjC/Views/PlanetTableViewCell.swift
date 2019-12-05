//
//  PlanetTableViewCell.swift
//  SWAPIObjC
//
//  Created by tyson ericksen on 12/5/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import UIKit

class PlanetTableViewCell: UITableViewCell {
    
    var planets: LBTPlanet? {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var planetNameLabel: UILabel!
    @IBOutlet weak var climateLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    
    func updateViews() {
        guard let planets = planets else { return }
        
        self.planetNameLabel.text = planets.planetName
        self.climateLabel.text = planets.climate
        self.populationLabel.text = "population: \(planets.population)"
        self.yearLabel.text = "Days in Year: \(planets.year)"
        self.dayLabel.text = "Hours in Day: \(planets.day)"
        
    }
    
}
