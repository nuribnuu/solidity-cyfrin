// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

contract SecureVault {
    string public ownerName = "Ibnu";
    uint256 private vaultPin;
    bool internal isLocked = false;

    function getVaultStatus() public view returns (bool) {
        return isLocked;
    }
    function generateHint(uint256 inputNumber) public pure returns (uint256) {
        return inputNumber * 2;
    } 
    function lockVault() internal {
        isLocked = true;
    }
    function updatePin(uint256 newPin) public {
        vaultPin = newPin;
        lockVault();
    }
    function checkPin() public view returns (uint256) {
        return vaultPin;
    }
}