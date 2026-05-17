// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public constant MINIMUM_USD = 5 * 1e18;

    address[] public funders;

    mapping(address => uint256) public addressToAmountFunded;

    AggregatorV3Interface internal priceFeed;

    constructor(address priceFeedAddress) {
        priceFeed = AggregatorV3Interface(priceFeedAddress);
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
        // return (ethAmount * getLatestPrice()) / 1e18;
    }

    function fund() public payable {
        require(getConversionRate(msg.value) >= MINIMUM_USD, "Minimum 5 USD");

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }
}