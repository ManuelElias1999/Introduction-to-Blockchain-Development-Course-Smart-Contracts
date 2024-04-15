// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Evento {

    string public tokenName = "CriptoManu";

    event ChangeName(address editor, string newName);

    function changeName(string memory newName) public{
        tokenName = newName;
        emit ChangeName(msg.sender, newName);
    }

}