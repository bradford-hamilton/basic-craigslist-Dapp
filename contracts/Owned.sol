pragma solidity ^0.4.15;

contract Owned {
  // state variables
  address owner;

  // modifiers
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  // constructor
  function Owned() {
    owner = msg.sender;
  }
}
