// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;

contract ExampleException {
    mapping(address => uint8) public balanceReceived;

    function receiveMoney() public payable {
        // if this is used as it is then if 257 token are provided then with uint8 they'll be converted to 1. which would introduce a bug
        // so assert is used to make sure both the values are equal(before converting to uint8 and after conversion)
        // if fails, then execution is stopped there and consumers all the gas
        assert(msg.value == uint8(msg.value));
        balanceReceived[msg.sender] += uint8(msg.value);
    }

    function withdrawMoney(address payable  _to, uint8 _amount) public {
        // if(_amount <=balanceReceived[msg.sender]) {
        //     balanceReceived[msg.sender] -= _amount;
        //     _to.transfer(_amount);
        // }

        // if this condition fails, then the entire transaction is reverted and error message shown
        // it returns the unused gas
        require(_amount <= balanceReceived[msg.sender], "Not enough funds, aborting!");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}