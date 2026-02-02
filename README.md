BasicNFT Collection 🚀

BasicNFT Collection is a fully functional ERC-721 NFT smart contract built on Ethereum. Each NFT is unique, with metadata securely stored on IPFS, and can be traded on NFT marketplaces like OpenSea.

About the Project

This project demonstrates a unique NFT collection using the ERC-721 standard. It allows users to:

Mint unique NFTs

Track ownership

Transfer NFTs securely

Integrate with Ethereum wallets like MetaMask

The NFTs are provably rare and fully decentralized.

Features

ERC-721 compliant NFT smart contract

Mint NFTs with unique metadata (name, description, image)

Transfer NFTs between wallets

View NFT metadata via tokenURI

Compatible with Ethereum wallets

Smart Contract

Contract Name: MyNFT
Key Functions:

Function	Description
mint(address to, string memory tokenURI)	Mint a new NFT to a given address
tokenURI(uint256 tokenId)	Get metadata for an NFT
balanceOf(address owner)	Number of NFTs owned by an address
ownerOf(uint256 tokenId)	Owner of a specific NFT

Example Deployment Address: 0xYourContractAddressHere

Tech Stack

Blockchain: Ethereum

Smart Contract Language: Solidity

Framework: Hardhat / Truffle

Frontend (optional): React / Next.js

Storage: IPFS / Pinata

Wallet Integration: MetaMask