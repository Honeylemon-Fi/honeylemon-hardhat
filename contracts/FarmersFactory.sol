// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./HLFutures.sol";

contract FarmersFactory {
    
    Farm[] public allFarms;

    event farmCreated(address indexed rToken, uint256 amount, uint256 expiryDate, uint);

    function allFarmsLength() external view returns (uint) {
        return allFarms.length;
    }

    function createFarm(address rToken, uint256 amount, uint256 expiryDate) external returns (address farm) {
        HLFutures newFarm = new HLFutures(rToken, expiryDate);
        allFarms.push(address(newFarm));
        emit farmCreated(rToken, amount, expiryDate, allFarms.length);
        HLFutures(address(allFarms[allFarms.length])).mint(amount);
        return address(newFarm);        
        
    }
    


}