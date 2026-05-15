// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

contract SistemInventarisToko {
    struct Item {
        string name;
        uint256 price;
        uint256 stock;
    }
    Item[] public items;

    // addItem
    // function addItem(string calldata _name, uint256 _price, uint256 _stock) public {
    //     items.push(Item(_name, _price, _stock));
    // }
    function addItem(string calldata _name, uint256 _price) public {
        items.push(Item(_name, _price, 0));
    }

    // restockItem
    function restockItem(uint256 _index, uint256 _stock) public {
        Item storage item = items[_index];
        item.stock += _stock;
    }
    // applyDiscount
    function applyDiscount(uint256 _price, uint256 _discount) private pure returns (uint256) {
        return _price - (_price * _discount / 100);
    }
    // getItem
    function getItem(uint256 _index) public view returns (Item memory) {
        return items[_index];
    }
    // updatePrice
    function updatePrice(uint256 _index, uint256 _price, uint256 _discount) public {
        Item storage item = items[_index];
        item.price = applyDiscount(_price, _discount);
    }
}