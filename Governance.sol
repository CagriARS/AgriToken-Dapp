// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./AgriToken.sol";
import "./UserRole.sol";


// Governance contratct helps changes within the chain by proposals of Farmers
contract Governance is UserRole {
   
    struct Proposal { //Propasals have a structure to register inside of the system
        uint256 id;
        string description;
        uint256 voteCount;
        bool executed;
    }

    AgriToken public token;//Calls AgriToken contract
    uint256 public proposalCount; //Counts all registered products 
   
    mapping(uint256 => Proposal) public proposals;
    mapping(uint256 => mapping(address => bool)) public votes; //Maps the votes by token holders 

    event ProposalCreated(uint256 id, string description); //Checks if proposal created
    event Voted(uint256 proposalId, address voter); //Checks if given proposal voted
    event ProposalExecuted(uint256 proposalId); //Checks if the proposal executed if passed 


    constructor(AgriToken _token) {
        token = _token; // İnitializes token 
    }

// This function creates a propasal. Propasals can only be created by a Farmer
    function createProposal(string memory _description) public onlyRole(Role.Farmer) {
        proposalCount++;
        proposals[proposalCount] = Proposal({
            id: proposalCount,
            description: _description,
            voteCount: 0,
            executed: false
        });

        emit ProposalCreated(proposalCount, _description);
    }


// Vote can called by any role but the token hold decides the vote of the vpoters
    function vote(uint256 _proposalId) public {
        Proposal storage proposal = proposals[_proposalId];
        require(!proposal.executed, "Already executed");
        require(!votes[_proposalId][msg.sender], "Already voted");

        proposal.voteCount += token.balanceOf(msg.sender);
        votes[_proposalId][msg.sender] = true;

        emit Voted(_proposalId, msg.sender);
    }

//For a Proposal to pass a vote, votes needs to be higeher then half of the total supply of chain 
    function executeProposal(uint256 _proposalId) public {
        Proposal storage proposal = proposals[_proposalId];
        require(proposal.voteCount > token.totalSupply() / 2, "Not enough votes");
        require(!proposal.executed, "Already executed");

        proposal.executed = true;
        emit ProposalExecuted(_proposalId);
    }
}
