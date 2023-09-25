// SPDX-License-Identifier: MIT
pragma solidity  0.8.14;

// in this exampple, one account can withdraw the amount only which it has deposited.
// we're doing this by using a mapping and storing for address against the amount sent
contract ExampleMapping2 {
    mapping(address => uint) public balReceived;

    function sendMoney() public payable {
        balReceived[msg.sender] += msg.value;
    }

    function getBal() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawAll(address payable  _to) public {
        // not a good method, we should check if user has enough balance
        // also it can call a contract internally can again transfer some amount
        // _to.transfer(balReceived[msg.sender]);
        // balReceived[msg.sender] = 0;

        // do this instead
        uint balToTransfer = balReceived[msg.sender];
        balReceived[msg.sender] = 0;
        _to.transfer(balToTransfer);
    }
}