//
//  PokedexTVC.swift
//  Pokedex
//
//  Created by Adolfo Gonzalez on 3/11/16.
//  Copyright © 2016 Red Panda. All rights reserved.
//

import UIKit
import SwiftyPoke

class PokedexTVC: UITableViewController {

    var pokemon = [Pokémon]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SwiftyPoke.fillNationalPokédex { (success) -> Void in
            self.pokemon=SwiftyPoke.getPokédex()
            
            self.tableView.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pokeCell", forIndexPath: indexPath)as! PokemonCell
        let pokemonForCell = pokemon[indexPath.row]
        cell.setupCell(pokemonForCell)
        return cell
    }
    
    
}
