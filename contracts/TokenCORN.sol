// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract CornCoin is ERC20 {
    constructor() ERC20("CORN", "CORN") {
        _mint(msg.sender, 100000 * 10 ** 18);
    }
}