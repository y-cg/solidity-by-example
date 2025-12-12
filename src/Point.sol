// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

struct Point {
    int256 _x;
    int256 _y;
}

library PointArithmetic {
    function add(Point memory p1, Point memory p2) public pure returns (Point memory) {
        return Point(p1._x + p2._x, p1._y + p2._y);
    }

    function subtract(Point memory p1, Point memory p2) public pure returns (Point memory) {
        return Point(p1._x - p2._x, p1._y - p2._y);
    }
}
