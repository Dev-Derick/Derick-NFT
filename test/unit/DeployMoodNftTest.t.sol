/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../script/DeployMoodNft.s.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500"><text x="0" y="15" fill="#378ad3">hi, derick did this</text></svg>';

        // Recreate EXACT expected return value
        string memory expectedBaseUri = string.concat(
            "data:image/svg+xml;base64,",
            Base64.encode(bytes(svg))
        );

        string memory actualUri = deployer.svgToImageURI(svg);

        // Compare hashes to avoid string spacing sensitivity
        assertEq(
            keccak256(bytes(actualUri)),
            keccak256(bytes(expectedBaseUri)),
            "SVG Base64 URI mismatch"
        );
    }
}
