// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Homework {
    
    enum StateFun {Opened, Closed}

    struct Crowfunding {
        string id;
        string  name;
        string description;
        address payable owner;
        StateFun state;
        uint fund;
        uint fundrasingGoal;
    }
    
    Crowfunding public crowfunding;

    event FProject(string ProjectId, uint valor);
    event CProject(string Id, StateFun Estado);

    constructor (string memory _id, string memory _name, string memory _description, uint _fundrasingGoal){
        crowfunding = Crowfunding(_id, _name, _description, payable(msg.sender), StateFun.Opened, 0, _fundrasingGoal);
    }

    modifier onlyOwner() {
        require(crowfunding.owner == msg.sender , "Only owner can change the state");
        // la funcion es insertada donde aparece esta simbolo
        _;
    }

    modifier NoOwnerFund() {
        require(crowfunding.owner != msg.sender , "As Owner can't fund ur account");
        // la funcion es insertada donde aparece esta simbolo
        _;
    }

    function FundProject() public payable NoOwnerFund{
        require (crowfunding.state != StateFun.Closed, "Te project cant recive funds");
        require (msg.value > 0, "Fund value must be more than 0");
        crowfunding.owner.transfer(msg.value);
        crowfunding.fund += msg.value;
        emit FProject(crowfunding.id, msg.value);
    }

    function changeProjectState(StateFun newState, string memory) public onlyOwner{
        require (crowfunding.state != newState, "New state must be different");
        crowfunding.state = newState;
        emit CProject(crowfunding.id, newState);
    }


}