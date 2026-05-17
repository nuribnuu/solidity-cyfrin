// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

import {SimpleStorage} from './SimpleStorage.sol';

contract StorageFactory {
    SimpleStorage[] public simpleStorages;

    function createSimpleStorageContract() public {
        SimpleStorage newStorage = new SimpleStorage();

        simpleStorages.push(newStorage);
    }

    function sfStore(uint256 _index, uint256 _number) public {
        simpleStorages[_index].store(_number);
    }
    function sfGet(uint256 _index) public view returns (uint256) {
        return simpleStorages[_index].retrieve();
    }
}