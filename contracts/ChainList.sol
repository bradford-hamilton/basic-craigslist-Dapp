pragma solidity ^0.4.15;

contract ChainList {
  // state variables
  address seller;
  address buyer;
  string name;
  string description;
  uint256 price;

  // events
  event sellArticleEvent(address indexed _seller, string _name, uint256 _price);
  event buyArticleEvent(
    address indexed _seller,
    address indexed _buyer,
    string _name,
    uint256 _price
  );

  // sell an article
  function sellArticle(string _name, string _description, uint256 _price)
  public {
    seller = msg.sender;
    name = _name;
    description = _description;
    price = _price;

    sellArticleEvent(seller, name, price);
  }

  // get the sellArticle (constant, free to call, cannot change contract)
  function getArticle() public constant returns (
    address _seller,
    address _buyer,
    string _name,
    string _description,
    uint256 _price) {
      return (seller, buyer, name, description, price);
  }

  // buy an article
  function buyArticle() payable public {
    // check whether there is an article for sale
    require(seller != 0x0);

    // we check that the article was not already sold
    require(buyer == 0x0);

    // dont allow the seller to buy its own article
    require(msg.sender != seller);

    // check whether value sent corresponds to the article price
    require(msg.value == price);

    // keep buyer's information
    buyer = msg.sender;

    // buyer can buy the article
    seller.transfer(msg.value);

    // trigger the event
    buyArticleEvent(seller, buyer, name, price);
  }
}
