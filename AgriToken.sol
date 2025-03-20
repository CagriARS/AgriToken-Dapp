// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

//AgriToken standart ERC20 token 
//Mints the initial supply 
contract AgriToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("AgriToken", "AGT") {
        _mint(msg.sender, initialSupply);
    }
}
