// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract WheatCoin is ERC20 {
    constructor() ERC20("WHEAT", "WHEAT") {
        _mint(msg.sender, 1000 * 10 ** 18);
    }
}