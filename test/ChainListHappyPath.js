// contract to be tested
var ChainList = artifacts.require('./ChainList.sol');

// test suite
contract('ChainList', function(accounts) {
  // test case: check initial values
  it('should be initialized with empty values', function() {
    return ChainList.deployed()
      .then(function(instance) {
        return instance.getArticle.call();
      })
      .then(function(data) {
        assert.equal(data[0], 0x0, 'seller must be empty');
        assert.equal(data[1], '', 'article name must be empty');
        assert.equal(data[2], '', 'description must be empty');
        assert.equal(data[3].toNumber(), 0, 'article price must be zero');
      });
  });
});
