// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/proxy/Clones.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract FarmersFactory is Ownable {
    using Clones for address;
    address public wheatMaster;
    address public cornMaster;
    
    constructor(address _wheat, address _corn){
        wheatMaster = _wheat;
        cornMaster = _corn;
    }

    function setHLMaster(address _wheat, address _corn) external onlyOwner {
        wheatMaster = _wheat;
        cornMaster = _corn;
    }
    

    function createWheatFuture() external returns (address future) {
        future = wheatMaster.clone();
    }

    function createCornFuture() external returns (address future) {
        future = cornMaster.clone();
    }
}