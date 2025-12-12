// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "@forge-std/Test.sol";
import {Point, PointArithmetic} from "../src/Point.sol";

contract PointTest is Test {
    using PointArithmetic for Point;

    function setUp() public {}

    function testAdd() public pure {
        Point memory p1 = Point(3, 4);
        Point memory p2 = Point(1, 2);
        Point memory get = p1.add(p2);
        Point memory expected = Point(4, 6);
        assertEq(get._x, expected._x);
        assertEq(get._y, expected._y);
    }
}
