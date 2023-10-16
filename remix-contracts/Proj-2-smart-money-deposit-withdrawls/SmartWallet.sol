// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract SmartWallet {
    uint public balance;

    function deposit() public payable {
        balance += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawAll() public {
        address payable toSend = payable(msg.sender);

        toSend.transfer(getBalance());
    }

    function withdrawToAddr(address payable to) public {
        to.transfer(getBalance());
    }
}