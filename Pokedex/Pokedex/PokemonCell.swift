//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Adolfo Gonzalez on 3/11/16.
//  Copyright © 2016 Red Panda. All rights reserved.
//

import UIKit
import SwiftyPoke
class PokemonCell: UITableViewCell {
    @IBOutlet weak var spriteView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(pokemon: Pokémon){
        nameLabel.text = pokemon.name
        SwiftyPoke.getPokémon(pokemon) { (pokémon) -> Void in
            SwiftyPoke.getSprite(pokémon.sprites[0], completion: { (sprite) -> Void in
                self.spriteView.image = UIImage(data: sprite.image!)
            })
        }
    }

}
