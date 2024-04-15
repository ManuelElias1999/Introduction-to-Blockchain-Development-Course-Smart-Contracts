// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Homework {

    string public id;
    string public name;
    address payable public owner;
    string public description;
    string public state = "Opened";
    uint public fund;
    uint public fundrasingGoal;

    event FProject(string id, uint valor);
    event CProject(string idr, string Estado);

    constructor (string memory _id, string memory _name, string memory _description, uint _fundrasingGoal){
        id = _id;
        name = _name;
        description = _description;
        fundrasingGoal = _fundrasingGoal;
        owner = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(owner == msg.sender , "Only owner can change the state");
        // la funcion es insertada donde aparece esta simbolo
        _;
    }

    modifier NoOwnerFund() {
        require(owner != msg.sender , "As Owner can't fund ur account");
        // la funcion es insertada donde aparece esta simbolo
        _;
    }

    function FundProject() public payable NoOwnerFund{
       owner.transfer(msg.value);
       fund += msg.value;
       emit FProject(id, msg.value);
    }

    function changeProjectState(string calldata newState) public onlyOwner{
       state = newState;
       emit CProject(id, newState);
    }


}