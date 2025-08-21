//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title FallonStudioNFT
///@notice The contract implements an ERC721 NFT with just minting and transfer Functionality
///@dev A very SImple COntract for minting and transferring NFTs can be used as a base for more complex NFT contracts of FallonStudio
contract FallonStudioNFT is ERC721URIStorage, Ownable {
    uint256 public nextTokenId; //Next Token ID to be minted

    
    ///@notice Constructor to initialize the contract with the name and symbol of the NFT
    constructor() ERC721("FallonStudioNFT", "FSNFT") Ownable(msg.sender) {}

    
    ///@notice Events for minting and transferring NFTs
    event NFTMinted(uint256 indexed tokenId);
    event NFTTransferred(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );

    
    ///@notice Function for minting NFTs
    function mintNFT(
        address to /** Address sent for minting*/,
        string memory tokenURI /** Metadata of the token */
    ) external onlyOwner returns (uint256) {
        uint256 newItemId = nextTokenId; //Setting the Unique ID for the NFT

        _safeMint(to, newItemId); //Minting the NFT to the specified address

        _setTokenURI(newItemId, tokenURI); // Setting the metadata URI for the NFT

        nextTokenId++; // Incrementing the token ID for the next mint
        emit NFTMinted(newItemId); // Emitting the NFTMinted event
        return newItemId; // Returning the ID of the newly minted NFT
    }

    
    
    ///@notice Transfer NFT function (Another funtionn from ERC721 safetransferfrom can do the same logic)
    function transferNFT(address from, address to, uint256 tokenId) external {
        //Using if statement for gas efficiency

        // Check if the caller is the owner or approved for the token
        if (_ownerOf(tokenId) != msg.sender) {
            revert("Caller is not owner nor approved");
        }

        // Safe Transfer the NFT from one address to another
        safeTransferFrom(from, to, tokenId, "");
        emit NFTTransferred(from, to, tokenId); // Emitting the NFTTransferred event
    }
}
