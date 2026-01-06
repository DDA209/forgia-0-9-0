// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Forge {
    // Structure de notre objet de jeu
    struct Item {
        string name;
        uint256 power;
    }

    address public owner;

    // On définie l'adresse du owner au moment du déploiement du smart-contract
    constructor() {
        owner = msg.sender;
    }

    // Notre "Base de données" (Storage)
    // Analogie Web2 : Map<address, Item>
    mapping(address => Item) public inventory;

    // Fonction pour créer un objet
    function createItem(address _player, string memory _name, uint256 _power) public {
        require(owner==msg.sender, "Not allowed");
        require(msg.sender == owner, "Player is required");

        // ICI : Nous essayons de créer une référence en mémoire
        Item memory newItem = Item(_name, _power);
        
        // Tentative de sauvegarde
        inventory[_player] = newItem;
    }

    // Fonction à corriger (L'énigme est ici)
    function boostItem() public {
        // Item memory item = inventory[msg.sender]; // Didier : Code à corriger
        Item storage item = inventory[msg.sender]; // Didier : Correction du mot clé memory par storage. Avec Memory, l'objet est modifié qu'en RAM alors qu'avec storage l'objet est modifié sur la blockchain
        item.power = item.power + 10;
        
        // ANALYSE : Si j'appelle cette fonction, le power de mon item 
        // dans 'inventory' va-t-il vraiment augmenter sur la blockchain ?
    }
}