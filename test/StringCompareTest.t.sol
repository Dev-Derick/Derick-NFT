// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";

contract StringCompareTest is Test {
    function testCompareStrings() public pure {
        string memory a = "Dogie";
        string memory b = "Dogie";
        assertEq(
            keccak256(abi.encodePacked(a)),
            keccak256(abi.encodePacked(b))
        );
    }
}
