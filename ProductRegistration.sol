// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./AgriToken.sol";
import "./UserRole.sol";

//Product registration contract lets farmers register products on to the chain 
contract ProductRegistration is UserRole {
    //Rrgistered product has a format
    struct Product {
        uint256 id;
        string name;
        string location;
        string quality;
        uint256 quantity;
        address farmer;
        bool isRegistered;
    }

    AgriToken public token; //Initialize agritoken contract

    uint256 public productCount; // Counts the registered products to the system 
    mapping(uint256 => Product) public products;
    event ProductRegistered(uint256 id, address farmer);


    constructor(AgriToken _token) {
        token = _token; //Initialize tokens
    }

//This function lets the farmers register their product
    function registerProduct(
        string memory _name,
        string memory _location,
        string memory _quality,
        uint256 _quantity
    ) public onlyRole(Role.Farmer) {
        productCount++;
        products[productCount] = Product({
            id: productCount,
            name: _name,
            location: _location,
            quality: _quality,
            quantity: _quantity,
            farmer: msg.sender,
            isRegistered: true
        });

//By registering a product farmer gets a small amount of reward tokens for their registration 
        emit ProductRegistered(productCount, msg.sender);
        uint256 rewardAmount = 100; 
        require(token.balanceOf(address(this)) >= rewardAmount, "Contract does not have enough tokens");

        bool success = token.transfer(msg.sender, rewardAmount);
        require(success, "Token transfer failed");
    }

// This function shows the name, farmer, quality, quantity data when called with product id
    function getProduct(uint256 _productId) public view returns (Product memory) {
        return products[_productId];
    }
}
