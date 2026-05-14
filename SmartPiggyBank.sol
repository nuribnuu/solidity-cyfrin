// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

contract SmartPiggyBank {
    uint256 public targetAmount = 1000000;
    uint256 public currentBalance = 100000;
    string public savingsGoal = "Beli BTC";
    bool public isFull = false;

    function addMoney(uint256 _amount) public {
        currentBalance += _amount;
        checkIsFull();
    }
    function checkIsFull() internal {
        if (currentBalance >= targetAmount) isFull = true;
    }
    function getProgress() public view returns (uint256) {
                if (currentBalance >= targetAmount) {
            return 0;
        }
        return targetAmount - currentBalance;
    }
    function updateGoal(string memory _newGoal) public {
        savingsGoal = _newGoal;
    }
}