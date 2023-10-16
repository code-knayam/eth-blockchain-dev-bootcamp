// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract MyContract {
    string public ourString = "Hello world";

    function updateOurString(string memory _updatedString) public  {
        ourString = _updatedString;
    }
}