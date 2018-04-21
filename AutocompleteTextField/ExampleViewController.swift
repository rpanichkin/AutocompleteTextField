//
//  ViewController.swift
//  AutocompleteTextField
//
//  Created by Roman Panichkin on 4/21/18.
//  Copyright © 2018 Roman Panichkin. All rights reserved.
//

import UIKit

var nbaTeamsSuggestions = [
    "Atlanta Hawks",
    "Boston Celtics",
    "Brooklyn Nets",
    "Charlotte Hornets",
    "Chicago Bulls",
    "Cleveland Cavaliers",
    "Dallas Mavericks",
    "Denver Nuggets",
    "Detroit Pistons",
    "Golden State Warriors",
    "Houston Rockets",
    "Indiana Pacers",
    "LA Clippers",
    "Los Angeles Lakers",
    "Memphis Grizzlies",
    "Miami Heat",
    "Milwaukee Bucks",
    "Minnesota Timberwolves",
    "New Orleans Pelicans",
    "New York Knicks",
    "Oklahoma City Thunder",
    "Orlando Magic",
    "Philadelphia 76ers",
    "Phoenix Suns",
    "Portland Trail Blazers",
    "Sacramento Kings"
]

class ExampleViewController: UIViewController {
    @IBOutlet var autocompleteTextField: AutocompleteTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        autocompleteTextField.suggestions = nbaTeamsSuggestions
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        autocompleteTextField.becomeFirstResponder()
    }
    
    @objc func hideKeyboard() {
        autocompleteTextField.resignFirstResponder()
    }
}

