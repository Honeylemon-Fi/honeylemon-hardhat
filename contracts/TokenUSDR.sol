// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract TestUSDCoin is ERC20 {
    constructor() ERC20("USDR", "USDR") {
        _mint(msg.sender, 100000 * 10 ** 18);
    }
}