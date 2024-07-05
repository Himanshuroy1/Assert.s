// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calculation {
    uint256 public result;

    function calculate(uint256 x, uint256 y, uint _num) public {
        require(_num > 0 && _num != 100, "Invalid input: _num must be greater than 0 and not equal to 100");
        require(y != 0, "Invalid input: Division by zero is not allowed");
        require(x >= y, "Invalid input: x must be greater than or equal to y");

        result = x / y;
        result = result - y;

        assert(result <= x);  // Ensure result is less than or equal to x after the calculations
    }

    function calculateWithRevert(uint256 x, uint256 y, uint _num) public {
        if (_num <= 0 || _num == 100) {
            revert("Invalid input: _num must be greater than 0 and not equal to 100");
        }
        if (y == 0) {
            revert("Invalid input: Division by zero is not allowed");
        }
        if (x < y) {
            revert("Invalid input: x must be greater than or equal to y");
        }

        result = x / y;
        result = result - y;

        assert(result <= x);  // Ensure result is less than or equal to x after the calculations
    }
}
