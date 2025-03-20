// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./AgriToken.sol";
import "./ProductRegistration.sol";
import "./UserRole.sol";

//This contracts forms a market place for suppliers to buy the registered farming products from farmers 
contract Marketplace is UserRole {

    AgriToken public token; //Initialize agritoken contract 
    ProductRegistration public productRegistration; //Initialize ProductRegistration contract

    uint256 public transactionFeePercentage = 2; 

    event ProductPurchased(uint256 productId, address buyer);
    event TransactionFeeUpdated(uint256 newFeePercentage);

// Constructor for initializing tokens and product registered 
    constructor(AgriToken _token, ProductRegistration _productRegistration) {
        token = _token;
        productRegistration = _productRegistration;
    }


//With the the registered product id and sufficent ballance only a registered supplier can buy a product
//In every transaction small part of the transaction fee is send to the farmer because of the aim of this project 
    function buyProduct(uint256 _productId, uint256 _amount) public onlyRole(Role.Supplier) {
        ProductRegistration.Product memory product = productRegistration.getProduct(_productId);
        require(product.isRegistered, "Product not registered");
        
        uint256 fee = (_amount * transactionFeePercentage) / 100;
        uint256 amountAfterFee = _amount - fee;

        token.transferFrom(msg.sender, product.farmer, amountAfterFee); //Transfer the amount to the farmer who created and registered the product 

        token.transferFrom(msg.sender, address(this), fee);//Sends the fee to buyer 

        emit ProductPurchased(_productId, msg.sender);
    }

// Service provider can register the persantage that farmer gets which this function helps create a cycle 
    function setTransactionFeePercentage(uint256 _newPercentage) public onlyRole(Role.ServiceProvider) {
        require(_newPercentage >= 0 && _newPercentage <= 100, "Invalid fee percentage");
        transactionFeePercentage = _newPercentage;
        emit TransactionFeeUpdated(_newPercentage);
    }
}
