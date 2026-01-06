// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Forge {
    // Structure de notre objet de jeu
    struct Item {
        string name;
        uint256 power;
    }

    // Notre "Base de données" (Storage)
    // Analogie Web2 : Map<address, Item>
    mapping(address => Item) public inventory;

    // Fonction pour créer un objet
    function createItem(string memory _name, uint256 _power) public {
        // ICI : Nous essayons de créer une référence en mémoire
        Item memory newItem = Item(_name, _power);
        
        // Tentative de sauvegarde
        inventory[msg.sender] = newItem;
    }

    // Fonction à corriger (L'énigme est ici)
    function boostItem() public {
        Item storage item = inventory[msg.sender]; // Didier : Correction du mot clé memory par storage
        item.power = item.power + 10;
        
        // ANALYSE : Si j'appelle cette fonction, le power de mon item 
        // dans 'inventory' va-t-il vraiment augmenter sur la blockchain ?
    }
}