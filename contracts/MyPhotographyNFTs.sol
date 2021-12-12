// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

//Importing OpenZeppelin contracts—ERC721 for NFT standerd and Counters to count each NFT 
//minted starting from 0—and Hardhat console
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

//Inheriting the ERC721 contract that we imported to call its fuctionens 
//instead of writing it from scratch
contract MyPhotographyNFTs is ERC721URIStorage {
//track token IDs
using Counters for Counters.counter;
Counters.counter private _tokenIds;

//Construct the contract and give it the token name
    constructor() REC721 ("Inconceivable Photography", "iPhoto"){
        console.log("This is my photography work");
    }

//A function to generate the NFTs
    function makeNFT() public{
        //Get the current ID
        uint256 newPhotoId = _tokenIds.current();
        //Mint the token
        _safeMint(msg.sender, newPhotoId);
        //Set the NFT data
        _setTokenURI(newPhotoId, "https://jsonkeeper.com/b/DFQW");
        console.log("NFT minted");
        //Increase the current ID by 1
        _tokenIds.increment();
    }

}