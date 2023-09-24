// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract SampleFallback {
    uint public lastValueSent;
    string public lastFnCall;
    uint public myInt;


    function setMyInt(uint _myInt) public {
        myInt = _myInt;
    }

    // can only use 2300 gas, so not reliable



    // called when there's no data in transcat call
    receive() external payable {
        lastValueSent = msg.value;
        lastFnCall = "receive";
    }

    // fallback function is called when there's no matching function as provided in callData

    // the function is decided based on the first 6 letters of the hash
    // 0xabcdef0000000000000001
    // for above callData, its supposed to call a function with hash `abcdef` followed by 1 as the fn input
    // to create a function hash use the fn name and the parameter type and use a util fn
    // web3.utils.sha3("setMyInt(uint256)")

    // can be used as exceptions handler
    fallback() external payable  {
        lastValueSent = msg.value;
        lastFnCall = "fallback";
    }
}