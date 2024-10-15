// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Define your ERC20 token contract
contract MyToken is ERC20 {
    // Constructor that mints the initial supply to the deployer of the contract
    constructor() ERC20("MyToken", "MTK") {
        uint256 initialSupply = 1000000 * 10 ** decimals(); // Set initial supply to 1,000,000 tokens (with 18 decimals)
        _mint(msg.sender, initialSupply); // Mint initial supply to deployer's address
    }

    // Function to mint new tokens to a specified address
    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }

    // Function to burn tokens from a specified address
    function burn(address from, uint256 amount) public {
        _burn(from, amount);
    }

    // Function to transfer tokens from the caller's address to a specified address
    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), to, amount);
        return true;
    }

    // Function to approve an address to spend a certain amount of tokens on behalf of the caller
    function approve(address spender, uint256 amount) public override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    // Function to transfer tokens from one address to another using an allowance
    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        _transfer(from, to, amount);
        _approve(from, _msgSender(), allowance(from, _msgSender()) - amount);
        return true;
    }

    // Function to get the balance of an account
    function getBalanceOf(address account) public view returns (uint256) {
        return balanceOf(account);
    }
}
