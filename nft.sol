pragma solidity ^0.8.0;

contract NFT {
    address owner;
    mapping(uint256 => bool) tokens;

    constructor() public {
        owner = msg.sender;
    }

    function mint(uint256 tokenId) public {
        require(msg.sender == owner, "Only the owner can mint new tokens.");
        require(!tokens[tokenId], "Token ID already exists.");
        tokens[tokenId] = true;
    }

    function burn(uint256 tokenId) public {
        require(msg.sender == owner, "Only the owner can burn tokens.");
        require(tokens[tokenId], "Token ID does not exist.");
        tokens[tokenId] = false;
    }

    function checkOwnership(uint256 tokenId) public view returns (bool) {
        return tokens[tokenId];
    }
}
