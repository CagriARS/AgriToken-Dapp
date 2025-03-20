// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./AgriToken.sol";
import "./UserRole.sol";

//Service provider contract creates the enviroment for registerign an service and buying an service
contract ServiceProvider is UserRole {
    //Service registered has a prior style 
    struct Service {
        uint256 id;
        string name;
        string description;
        uint256 price;
        address provider;
        bool isListed;
    }

    AgriToken public token; //Initialize agritoken contract
    uint256 public serviceCount;
    mapping(uint256 => Service) public services;

    event ServiceListed(uint256 id, address provider);

    constructor(AgriToken _token) {
        token = _token; //Initialize tokens 
    }

// List service can  only be called by a service provider role 
//This registers the service they will list to the chain
    function listService(
        string memory _name,
        string memory _description,
        uint256 _price
    ) public onlyRole(Role.ServiceProvider) {
        serviceCount++;
        services[serviceCount] = Service({
            id: serviceCount,
            name: _name,
            description: _description,
            price: _price,
            provider: msg.sender,
            isListed: true
        });

        emit ServiceListed(serviceCount, msg.sender);
    }

//Only a farmer can buy a service that a service provider registered
    function buyService(uint256 _serviceId) public onlyRole(Role.Farmer) {
        Service memory service = services[_serviceId];
        require(service.isListed, "Service not listed");
        token.transferFrom(msg.sender, service.provider, service.price);
    }
}
