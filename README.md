FallonStudioNFT (FSNFT)

A simple and extensible ERC721 NFT smart contract built using OpenZeppelin standards.
This contract allows the owner to mint NFTs with metadata URIs and provides a custom NFT transfer function, along with standard ERC721 transfer methods.

📖 Overview

Standard: ERC721 (Non-Fungible Token)

Symbol: FSNFT

Name: FallonStudioNFT

Compiler: Solidity ^0.8.20

Framework: OpenZeppelin Contracts

The contract is designed as a lightweight base implementation for NFT projects at FallonStudio, which can be extended with more advanced features like royalties, marketplaces, or utility integrations.

✨ Features

✅ Mint NFTs (only by the contract owner)

✅ Set Metadata URI for each NFT

✅ Transfer NFTs using a custom transferNFT function

✅ Events for minting and transferring:

NFTMinted(tokenId)

NFTTransferred(from, to, tokenId)

✅ Fully compliant with ERC721 standard

📂 Contract Structure

mintNFT(address to, string memory tokenURI)
Mints a new NFT to a specified address with metadata URI.

Access: onlyOwner

Emits: NFTMinted

transferNFT(address from, address to, uint256 tokenId)
Custom transfer function that safely transfers NFTs between users.

Access: Owner or approved token holder

Emits: NFTTransferred

🚀 Deployment
Prerequisites

Node.js & npm

Hardhat or Truffle

MetaMask or any Ethereum wallet

OpenZeppelin Contracts

Install Dependencies
npm install --save-dev hardhat @nomiclabs/hardhat-ethers ethers
npm install @openzeppelin/contracts

Compile
npx hardhat compile

Deploy

Update your deployment script (scripts/deploy.js) with:

const hre = require("hardhat");

async function main() {
  const FallonStudioNFT = await hre.ethers.getContractFactory("FallonStudioNFT");
  const nft = await FallonStudioNFT.deploy();
  await nft.deployed();
  console.log("FallonStudioNFT deployed to:", nft.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});


Run deployment:

npx hardhat run scripts/deploy.js --network <your_network>

🛠 Usage
Mint NFT
mintNFT(0xReceiverAddress, "ipfs://QmExampleHash/metadata.json")

Transfer NFT
transferNFT(0xFrom, 0xTo, 1)

📜 License

This project is licensed under the MIT License.
