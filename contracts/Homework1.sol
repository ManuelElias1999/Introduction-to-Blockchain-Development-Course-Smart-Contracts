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

    constructor (string memory _id, string memory _name, string memory _description, uint _fundrasingGoal){
        id = _id;
        name = _name;
        description = _description;
        fundrasingGoal = _fundrasingGoal;
        owner = payable(msg.sender);
    }

    function FundProject() public payable {
       owner.transfer(msg.value);
       fund += msg.value;
    }

    function changeProjectState(string calldata newState) public {
       state = newState;
    }


}