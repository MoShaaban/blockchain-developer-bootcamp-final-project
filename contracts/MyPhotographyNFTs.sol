/// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

///Importing OpenZeppelin contracts—ERC721 for NFT standerd and Counters to count each NFT 
///minted starting from 0—and Hardhat console
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

/// Import the helper functions from the library found on Github in the libraries folder
import { Base64 } from "./libraries/Base64.sol";

///Inheriting the ERC721 contract that we imported to call its fuctionens 
///instead of writing it from scratch
contract MyPhotographyNFTs is ERC721URIStorage {
///setting owner address
address public owner;
uint256 public newPhotoId;

///track token IDs
using Counters for Counters.Counter;
Counters.Counter private _tokenIds;

///create a baseSvg variable to be used in all the images
  string baseSvg = "<svg xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMinYMin meet' viewBox='0 0 350 350'><style>.base { fill: white; font-family: serif; font-size: 24px; }</style><rect width='100%' height='100%' fill='black' /><text x='50%' y='50%' class='base' dominant-baseline='middle' text-anchor='middle'>";

///create 3 arrays to randomly create the funny qoute from
string[] firstWords = ["I", "You", "Elephant", "Superman", "Fish", "Gelly", "Liverpool", "Egg"];
  string[] secondWords = ["Fly", "Fry", "Eat", "Dance", "Jump", "kick", "Sing", "Beat"];
  string[] thirdWords = ["Table", "Plane", "Peanut", "Phone", "Chocolate", "Cat", "Dog"];

    ///an event when an NFT is mined
  event NewMintedNFT(address sender, uint256 newPhotoId);

///Construct the contract and give it the token name
    constructor() ERC721 ("Inconceivable Photography", "iPhoto"){
        owner = msg.sender;
        console.log(owner);
    }

///  Picking a word from each array, randomly
  function pick1stWords(uint256 tokenId) public view returns (string memory) {
    uint256 rand = random(string(abi.encodePacked("FIRST_WORD", Strings.toString(tokenId))));
    rand = rand % firstWords.length;
    return firstWords[rand];
  }

function pick2ndWord(uint256 tokenId) public view returns (string memory) {
    uint256 rand = random(string(abi.encodePacked("SECOND_WORD", Strings.toString(tokenId))));
    rand = rand % secondWords.length;
    return secondWords[rand];
  }

function pick3rdWord(uint256 tokenId) public view returns (string memory) {
    uint256 rand = random(string(abi.encodePacked("THIRD_WORD", Strings.toString(tokenId))));
    rand = rand % thirdWords.length;
    return thirdWords[rand];
  }

  function random(string memory input) internal pure returns (uint256) {
      return uint256(keccak256(abi.encodePacked(input)));
  }

///A function to generate the NFTs
    function makeNFT(address tokenReceiver) public{
            ///Get the current ID
        newPhotoId = _tokenIds.current() + 1;
        console.log('newPhotoId', newPhotoId);

    ///Pick one word from each array
        string memory first = pick1stWords(newPhotoId);
        string memory second = pick2ndWord(newPhotoId);
        string memory third = pick3rdWord(newPhotoId);
        

        /// Create the qoute and close the <text> and <svg> tags in the baseSvg
        string memory finalSvg = string(abi.encodePacked(baseSvg, first, second, third, "</text></svg>"));
        console.log(finalSvg);
        

        /// Get all the JSON metadata in place and base64 encode it
        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "combinedWord", "description": "A highly acclaimed collection of squares.", "image": "data:image/svg+xml;base64,',
                        /// Add data:image/svg+xml;base64 and then append base64 encode svg
                        Base64.encode(bytes(finalSvg)),
                        '"}'
                    )
                )
            )
        );
        




                /// Prepend data:application/json;base64, to data.
        string memory finalTokenUri = string(
            abi.encodePacked("data:application/json;base64,", json)
        );

        ///Mint the token
        _safeMint(tokenReceiver, newPhotoId);
        ///Set the NFT data
        _setTokenURI(newPhotoId, finalTokenUri);
        console.log(finalTokenUri);
        ///Increase the current ID by 1
        _tokenIds.increment();

        ///emit an event to send the token id to the sender
        emit NewMintedNFT(tokenReceiver, newPhotoId);
    }

  
}