// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "@forge-std/Test.sol";
import {console} from "@forge-std/console.sol";

contract ArrayEvmLocation is Test {
    uint256[] public nums;

    // get the storage location of nums[index]
    function getElementLoc(uint256 index) public view returns (uint256) {
        uint256 slot = 0;
        bytes32 start = keccak256(abi.encode(slot));
        return uint256(start) + index;
    }

    function testArrayEvmLocation() public {
        assertEq(getElementLoc(0), 18569430475105882587588266137607568536673111973893317399460219858819262702947);
        assertEq(getElementLoc(1), 18569430475105882587588266137607568536673111973893317399460219858819262702948);
    }
}
