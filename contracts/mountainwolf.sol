pragma solidity ^0.8.9;

import "erc721a/contracts/ERC721A.sol";

contract mountainwolf is ERC721A {
    address public owner;

    uint256 public max = 5;

    string baseUrl =
        "https://green-occasional-zebra-975.mypinata.cloud/ipfs/QmebYSCF4PvyZvzeQ7JvBByLRmLhBh4i5K7W53598QQptr/";

    string public prompt = "wolf in mountain";

    constructor() ERC721A("mountainwolf", "MW") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function mint(uint256 quantity) external payable onlyOwner {
        require(
            totalSupply() + quantity <= max,
            "5 is maximum that you can mint"
        );
        _mint(msg.sender, quantity);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseUrl;
    }

    function promptDescription() external view returns (string memory) {
        return prompt;
    }
}
