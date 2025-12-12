// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "@forge-std/Test.sol";

contract GCDTest is Test {
    modifier isGCDOne(uint256 a, uint256 b) {
        require(gcd(a, b) == 1, "GCD is not 1");
        _;
    }

    function gcd(uint256 a, uint256 b) public pure returns (uint256) {
        while (b != 0) {
            uint256 temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

    function requireGCDOne(uint256 a, uint256 b) public pure isGCDOne(a, b) {
        // Function logic here
    }

    function testRequireGCDOne() public {
        requireGCDOne(14, 15); // Should pass

        vm.expectRevert("GCD is not 1");
        this.requireGCDOne(14, 21); // Should revert
    }
}
