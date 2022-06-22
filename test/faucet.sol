// SPDX-License-Identifier: MIT
// transfer money to smart contract
pragma solidity ^0.8.7;

contract faucet {
    address public owner;

    // need to set value to 1 Finney as initial balance
    // then can withdraw from this account

    constructor () payable {
        // owner is the person who currently connect to the contract
        owner = msg.sender;
    }

    function withdraw(uint amount) public payable {
        require (address(this).balance > amount);
        // need to mark as payable
        payable(msg.sender).transfer(amount);
    }

    function getbalance() public view returns (uint256) {
        return address(this).balance;
    }

    function deposit() public payable {
        // do nothing here
        // only select wallet account from remix left side and change the value then call this function
    }
}
