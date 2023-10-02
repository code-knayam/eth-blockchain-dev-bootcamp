// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract WillThrow {
    error NotAllowedError(string);

    function aFun() public pure {
        // handled in Error block
        // require(false, 'Error message');

        // handled in Panic Block, consumer all the gas
        // assert(false);

        //handled in custom error block, returns the unused gas  
        revert NotAllowedError('Not allowed');
    }
}

contract Errorhandling {
    event ErrorLogging(string reason);
    event ErrorLogCode(uint code);
    event ErrorLogBytes(bytes data);

    function catchErr() public {
        WillThrow will = new WillThrow();
        try will.aFun() {
            // add code if it works
        } catch Error(string memory reason) {
            emit ErrorLogging(reason);
        } catch Panic(uint errorCode) {
            emit ErrorLogCode(errorCode);
        } catch (bytes memory lowLevelData) {
            // custom error
            emit ErrorLogBytes(lowLevelData);
        }
    }
}