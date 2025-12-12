// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VulnerableDeposit {
    mapping(address => uint256) public balances;
    uint256 public MinDeposit = 1 ether;

    function Deposit() public payable {
        if (msg.value > MinDeposit) {
            balances[msg.sender] += msg.value;
        }
    }

    function CashOut(uint256 _am) public payable {
        if (_am <= balances[msg.sender]) {
            (bool success,) = payable(msg.sender).call{value: _am}("");
            if (success) {
                balances[msg.sender] -= _am;
            }
        }
    }
}
