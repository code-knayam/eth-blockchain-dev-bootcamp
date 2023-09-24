// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleString {
    string public myString = "Hello world";
    bytes public  myBytes = "Hello bytes";

    function setMyString(string memory _myString) public {
        myString = _myString;
    }  

    function compareString(string memory _myString) public view returns(bool) {
        return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(_myString));
    }
}