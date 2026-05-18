// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public constant MINIMUM_USD = 5 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;
    AggregatorV3Interface internal priceFeed;

    address public owner;

    constructor(address priceFeedAddress) {
        priceFeed = AggregatorV3Interface(priceFeedAddress);
        owner = msg.sender; // yang deploy = owner
    }

    function getLatestPrice() public view returns (uint256) {
        (, int256 price, , , ) = priceFeed.latestRoundData();
        require(price > 0, "Oracle data invalid");
        return uint256(price) * 1e10;
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        require(ethAmount > 0, "ETH amount must more than 0");
        uint256 ethPrice = getLatestPrice();
        uint256 ethAmountInUsd = (ethAmount * ethPrice) / 1e18;
        return ethAmountInUsd;
    }

    function fund() public payable {
        require(getConversionRate(msg.value) >= MINIMUM_USD, "Minimum 5 USD");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public {
        // hanya owner yang boleh
        require(msg.sender == owner, "Bukan owner!");

        // transfer semua ETH ke owner
        (bool success, ) = payable(owner).call{value: address(this).balance}("");
        require(success, "Transfer gagal!");

        // reset funders array
        funders = new address[](0);

        // reset semua mapping
        for (uint256 i = 0; i < funders.length; i++) {
            addressToAmountFunded[funders[i]] = 0;
        }
    }
}