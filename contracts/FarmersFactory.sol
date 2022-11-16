// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "./HLFutures.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FarmersFactory is Ownable{
    
    address[] public allFutures;
    mapping (address => bool) isBlacklisted;
    mapping (address => bool) isVerified; 

    event FutureCreated(address indexed rToken, uint256 amount, uint256 expiryDate, uint);

    function allFarmsLength() external view returns (uint) {
        return allFutures.length;
    }

    function createWheatFuture(address rToken, uint256 amount, uint256 expiryDate) external returns (address farm) {
        HLFutures newFarm = new HLFutures(IERC20(rToken), expiryDate, address(this), "WHEAT", "WHEAT");
        allFutures.push(address(newFarm));
        emit FutureCreated(rToken, amount, expiryDate, allFutures.length);
        HLFutures(address(newFarm)).mint(amount);
        return address(newFarm);        
    }

    function createCornFuture(address rToken, uint256 amount, uint256 expiryDate) external returns (address farm) {
        HLFutures newFarm = new HLFutures(IERC20(rToken), expiryDate, address(this), "CORN", "CORN");
        allFutures.push(address(newFarm));
        emit FutureCreated(rToken, amount, expiryDate, allFutures.length);
        HLFutures(address(newFarm)).mint(amount);
        return address(newFarm);        
    }

    function verifyFuture(address _future) external onlyOwner {
        isVerified[_future] = true;
    }

    function blackList(address _future) external onlyOwner {
        isBlacklisted[_future] = true;
    }
}