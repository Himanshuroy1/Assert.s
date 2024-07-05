# Calculation Contract

This Solidity program is a simple contract that demonstrates the usage of `assert()` and `require()` statements in Solidity for error handling and condition validation. The contract performs calculations on input values and showcases how these statements can be used effectively.

## Description

The `Calculation` contract allows users to perform calculations by calling the `calculate()` and `calculateWithRevert()` functions. These functions perform division, subtraction, and utilize `assert()` and `require()` statements for error handling and condition validation.

## Executing the Program

To run this program, you can follow the steps below:

1. Open the Remix Ethereum IDE website at [Remix Ethereum IDE](https://remix.ethereum.org/).
2. Create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a `.sol` extension (e.g., `Calculation.sol`).
3. Copy and paste the provided code into the file:

```solidity
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
```

4. Click on the file name (`Calculation.sol`) to compile the code.
5. After successful compilation, navigate to the "Deploy & Run Transactions" tab.
6. Select the `Calculation` contract from the dropdown menu.
7. Click on the "Deploy" button to deploy the contract.
8. Once the contract is deployed, you can interact with it by calling the following functions:
   - `calculate(uint256 x, uint256 y, uint _num)`: Perform calculations on `x` and `y` values. The function utilizes `require()` statements to validate conditions.
   - `calculateWithRevert(uint256 x, uint256 y, uint _num)`: Perform calculations on `x` and `y` values. The function utilizes `revert()` statements to validate conditions.

You can test the contract by providing input values and observing the results of the calculations.

## Authors

Himanshu Roy

## License

This project is licensed under the MIT License - see the LICENSE.txt file for details.
