// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FashionShowToken is ERC20, Ownable {
    // Constructor to initialize the token with a name, symbol, and initial supply
    constructor(address initialOwner) ERC20("FashionShowToken", "FST") Ownable(initialOwner) {
        _mint(initialOwner, 1000 * 10**decimals());  // Mint 1000 tokens to the initial owner
    }

    // Override decimals to specify the number of decimal places
    function decimals() public view virtual override returns (uint8) {
        return 18; // Typical for ERC20 tokens
    }

    // Function to mint new tokens, callable only by the owner
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function to burn tokens from the caller's address
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Override the transfer function to add custom logic if needed
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        // Custom logic before transfer (if any)
        return super.transfer(recipient, amount);
    }

    // Override the transferFrom function to add custom logic if needed
    function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        // Custom logic before transfer (if any)
        return super.transferFrom(sender, recipient, amount);
    }
}
