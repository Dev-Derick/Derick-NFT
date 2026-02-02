// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import {DeployBasicNft} from "script/DeployBasicNft.s.sol";
import {BasicNft} from "src/BasicNft.sol";

contract BasicNftTest is Test, IERC721Receiver {
    DeployBasicNft public deployer;
    BasicNft public basicNft;

    address public USER = makeAddr("user");

    string public constant PUG =
        "ipfs://QmSsYRx3LpDAb1GZQm7zZ1AuHZjfbPkD6J7s9r41xu1mf8";

    function onERC721Received(
        address,
        address,
        uint256,
        bytes calldata
    ) external pure override returns (bytes4) {
        return IERC721Receiver.onERC721Received.selector;
    }

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expected = "Doggie";
        string memory actual = basicNft.name();

        assertEq(
            keccak256(abi.encodePacked(expected)),
            keccak256(abi.encodePacked(actual))
        );
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        basicNft.mintNft(PUG);

        assert(basicNft.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(PUG)) ==
                keccak256(abi.encodePacked(basicNft.tokenURI(0)))
        );
    }

    function testMintIncrementsTokenCounter() public {
        uint256 before = basicNft.getTokenCounter();

        vm.prank(USER);
        vm.deal(USER, 100 ether);

        basicNft.mintNft{value: basicNft.getMintFee()}(PUG);
        assertEq(basicNft.getTokenCounter(), before + 1);
    }

    function testOwnerOfMintedToken() public {
        vm.prank(USER);
        basicNft.mintNft(PUG);

        assertEq(basicNft.ownerOf(0), USER);
    }

    function testOwnerSentMintFee() public {
        uint256 mintFee = basicNft.getMintFee();
        vm.deal(USER, mintFee - 1);

        vm.prank(USER);

        vm.expectRevert();
        basicNft.mintNft{value: mintFee - 1}(PUG);
    }
}
