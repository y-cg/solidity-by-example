// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test} from "@forge-std/Test.sol";
import {SafePayment} from "../src/SafePayment.sol";

contract SafePaymentTest is Test {
    SafePayment public safePayment;

    function setUp() public {
        safePayment = new SafePayment();
    }

    function testDepositAndWithdraw() public {
        address user = address(0x1);
        uint256 amount = 1 ether;

        vm.deal(user, amount); // fund the user address
        vm.startPrank(user);
        safePayment.deposit{value: amount}();

        // Check balance after deposit
        uint256 balanceAfterDeposit = safePayment.balances(user);
        assertEq(balanceAfterDeposit, amount);

        safePayment.withdraw(amount);

        // Check balance after withdrawal
        uint256 balanceAfterWithdraw = safePayment.balances(user);
        assertEq(balanceAfterWithdraw, 0);
        vm.stopPrank();
    }
}
