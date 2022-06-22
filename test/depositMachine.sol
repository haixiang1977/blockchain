// SPDX-License-Identifier: MIT
// deposit money to smart contract
pragma solidity ^0.8.7;

contract DepositMachine {
    // to pay deploy fee
    address public owner;

    mapping (address => uint) public ZhangBen;
    mapping (address => bool) public YazhuBen;
    uint256 totalBalance;
    uint counter;

    event YazhuRec(address u, uint256 a, bool b, uint256 t, uint c);

    constructor () {
        owner = msg.sender;
        // do nothing now
        totalBalance = 0;
    }

    function Yazhu(address user, uint256 amount, bool isBig) public {
        ZhangBen[address(user)] = amount;
        YazhuBen[address(user)] = isBig;
        totalBalance += amount;
        counter += 1;

        emit YazhuRec(user, amount, isBig, totalBalance, counter);
    }
}
