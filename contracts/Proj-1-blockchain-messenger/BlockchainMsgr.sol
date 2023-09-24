// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract BlockchainMsgr {

    uint public changeCounter;
    address public owner;
    string public theMsg;


    constructor() {
        owner = msg.sender;
    }


    function updateTheMsg(string memory _newMsg) public {
        if(msg.sender == owner) {
            theMsg = _newMsg;
            changeCounter++;
        }
    }
}