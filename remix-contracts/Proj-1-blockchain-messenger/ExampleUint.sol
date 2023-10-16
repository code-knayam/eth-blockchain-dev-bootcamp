// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleUint {
    uint public myUInt; // 0 - (2^256-1)
    uint8 public myInt8 = 250;

    int public myInt = -10; // -2^128 - 2^128-1

    function setMyUnit(uint _myUint) public {
        myUInt = _myUint;
    }

    function incrementUint() public {
        myInt8++;
    }

    function setMyInt() public {
        myInt++;
    }

}