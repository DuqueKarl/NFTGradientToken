pragma solidity ^0.5.4;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol';
import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';


// NFT Gradient token
// Stores two values for every token: outer color and inner color

contract GradientToken is ERC721Full, Ownable {
  
	using Counters for Counters.Counter;
  Counters.Counter private tokenId;
	
  struct Gradient {
    string outer;
    string inner;
  }
  
  Gradient[] public gradients;

  constructor(
    string memory name,
    string memory symbol
  )
    ERC721Full(name, symbol)
    public
  {}
	
	
  // Returns the outer and inner colors of a token	
  function getGradient( uint256 gradientTokenId ) public view returns(string memory outer, string memory inner){
    Gradient memory _gradient = gradients[gradientTokenId];

    outer = _gradient.outer;
    inner = _gradient.inner;
  }

  // Create a new Gradient token with params: outer and inner
  function mint(string memory _outer, string memory _inner) public payable onlyOwner {
    uint256 gradientTokenId = tokenId.current();
    
    Gradient memory _gradient = Gradient({ outer: _outer, inner: _inner });
    gradients.push(_gradient);
	  _mint(msg.sender, gradientTokenId);
    tokenId.increment();
  }
	
}