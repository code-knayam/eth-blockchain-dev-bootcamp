// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SmartContractWallet {

    address payable public owner;
    mapping (address => uint) public allowance;
    mapping (address => bool) public isAllowedToSend;
    mapping (address => bool) public guardians;
    mapping (address => mapping (address => bool)) nextOwnerGuardianVote;
    address payable nextOwner;
    uint guardiansResetCount;
    uint public constant confirmationFromGuardiansForReset = 3;

    constructor() {
        owner = payable (msg.sender);
    }

    receive() external payable {

    }

    function setGuardian(address _guardian, bool _isGuardian) public {
        require(msg.sender == owner, "You are not the owner, aborting!");
        guardians[_guardian] = _isGuardian;
    }

    function proposeNewOwner(address payable  _newOwner) public {
        require(guardians[msg.sender], "You are now a guardian, aborting!");
        require(nextOwnerGuardianVote[_newOwner][msg.sender] == false, "You have already voted, aborting");
        if(_newOwner != nextOwner) {
            nextOwner = _newOwner;
            guardiansResetCount = 0;
        }

        guardiansResetCount++;

        if(guardiansResetCount >= confirmationFromGuardiansForReset) {
            owner = nextOwner;
            nextOwner = payable (address(0));
        }
    }

    function setAllowance(address _for, uint _amount) public {
        require(msg.sender == owner, "You are not the owner, aborting!");
        allowance[_for] = _amount;
        isAllowedToSend[_for] = _amount > 0;
        
    }

    function transfer(address payable _to, uint _amount, bytes memory  _payload) public returns(bytes memory) {
        // require(msg.sender == owner, "You are not the owner, aborting!");
        
        if (msg.sender != owner) {
            require(isAllowedToSend[msg.sender], "You are not allowed to send from this smart contract, aborting!");
            require(allowance[msg.sender] >= _amount, "You are trying to send more than you are allowed to, aborting!");
        
            allowance[msg.sender] -= _amount;
        }
        (bool success, bytes memory returnData) = _to.call{value: _amount}(_payload);

        require(success, 'Aborting, call was not successful');
        return returnData;
    }

}

contract Consumer {
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function deposit() public payable {}
}