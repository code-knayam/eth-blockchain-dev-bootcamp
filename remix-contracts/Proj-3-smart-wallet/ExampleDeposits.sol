// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract ContractOne {
    mapping (address => uint) public addressBalance;

    function getBalacne() public view returns(uint) {
        return address(this).balance;        
    }

    function deposit() public payable {
        addressBalance[msg.sender] += msg.value;
    }

    // required for method 3
    receive() external payable { 
        deposit();
    }
}

contract ContractTwo {
    function depositOnContOne(address _contractOne) public {
        // method 1: when contract is known
        // ContractOne one = ContractOne(_contractOne);
        // one.deposit{value: 10, gas: 100000}();

        // method 2: when contact is known but low level call is used
        // bytes memory paylaod = abi.encodeWithSignature("deposit()");
        // (bool success, ) = _contractOne.call{value: 10, gas: 100000}(paylaod);
        // require(success);

        // method 3: when nothing is known about contract, a general low level call is made
        // and the fallback function of contract is called
        // (bool success, ) = _contractOne.call{value: 10, gas: 100000}("");
        // require(success);
    }
}