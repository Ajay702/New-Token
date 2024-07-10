// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract NewToken is ERC20 {
    address public owner;

    constructor(uint256 initialSupply) ERC20("NewToken", "NWT") {
        _mint(msg.sender, initialSupply);
        owner = msg.sender;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        _transfer(from, to, amount);
        return true;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can mint");
        _;
    }
}
