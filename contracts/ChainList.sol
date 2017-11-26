pragma solidity ^0.4.15;

contract ChainList {
  // state variables
  address seller;
  string name;
  string description;
  uint256 price;

  // sell an article
  function sellArticle(string _name, string _description, uint256 _price)
  public {
    seller = msg.sender;
    name = _name;
    description = _description;
    price = _price;
  }

  // get the sellArticle (constant, free to call, cannot change contract)
  function getArticle() public constant returns (
    address _seller,
    string _name,
    string _description,
    uint256 _price) {
      return (seller, name, description, price);
    }
}
