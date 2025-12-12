// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Test.sol";

contract DataLocationTest is Test {
    uint256[] storageArray;

    function setUp() public {
        storageArray.push(1);
    }

    function modify(uint256[] memory x) internal pure {
        x[0] = 42;
    }

    function testLocalCopy() public view {
        uint256[] memory localArray = storageArray;
        // copy happens
        assertEq(localArray[0], 1);
        // modification happens on the local copy
        modify(localArray);
        // local copy modification does not affect storage
        assertEq(storageArray[0], 1);
        // but local copy is modified
        assertEq(localArray[0], 42);
    }
}
