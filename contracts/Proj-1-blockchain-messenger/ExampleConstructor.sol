// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleConstructor {
    address public myAdd;

    constructor(address _myAdd) {
        myAdd = _myAdd;
    }
}