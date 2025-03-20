// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Generates the roles for the chain 
contract UserRole {
    enum Role { Farmer, Supplier, ServiceProvider }
    mapping(address => Role) public roles;
    mapping(address => bool) public registeredUsers;

    event UserRegistered(address user, Role role);

   //Registers user to the system
    function registerUser(Role _role) public {
        require(!registeredUsers[msg.sender], "User already registered");
        roles[msg.sender] = _role;
        registeredUsers[msg.sender] = true;
        emit UserRegistered(msg.sender, _role);
    }

    modifier onlyRole(Role _role) {
        require(roles[msg.sender] == _role, "Access restricted to specific role");
        _;
    }
}
