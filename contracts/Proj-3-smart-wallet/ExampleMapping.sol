// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleMapping {
    mapping (uint => bool) public myMapping;
    mapping (address => bool) public myAddMapping;

    mapping(uint => mapping(uint => bool)) public nestedMap;

    // can be thought of as a list with values
    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    function setMyAdd() public {
        myAddMapping[msg.sender] = true;
    }

    function setNestedMap(uint _k1, uint _k2, bool val) public {
        nestedMap[_k1][_k2] = val;
    } 
}