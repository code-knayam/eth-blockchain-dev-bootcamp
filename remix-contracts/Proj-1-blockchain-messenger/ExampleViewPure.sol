// SPDX-License-Identifier: MIT
pragma solidity  0.8.14;

contract ExampleViewPure {
    uint public myStorage;

    function getMyStorage() public view returns(uint) {
        return myStorage;
    }

    // can only access variables in its scope
    function getAddition(uint a, uint b) public pure returns(uint) {
        return a+b;
    }

    // writing functions usually don't have return values
}