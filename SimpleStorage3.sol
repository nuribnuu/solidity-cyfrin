// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

contract AnimalRegistry {
    struct Animal {
        string name;
        string species;
    }

    Animal[] public animals;

    constructor() {
        animals.push(Animal("Kucing", "Mamalia"));
        animals.push(Animal("Elang", "Burung"));
        animals.push(Animal("Hiu", "Ikan"));
    }

    function addAnimal(string memory _name, string memory _species) public {
        animals.push(Animal(_name, _species));
    }
    function getAnimalCount() public view returns (uint256) {
        return animals.length;
    }
}