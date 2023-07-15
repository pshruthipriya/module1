// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract MyToken {
    string public tokenname;
    string public tokensymbol;
    uint256 public totalSupply;

    mapping(address => uint256) public balances;

    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) {
        tokenname = _name;
       tokensymbol = _symbol;
        totalSupply = _totalSupply;
        balances[msg.sender] = _totalSupply;
    }

    function mint(address _to, uint256 _value) public {
        totalSupply += _value;
        balances[_to] += _value;
    }


     function burn (address _from, uint256 _value) public {
        if(balances[_from] >= _value){
            totalSupply -= _value;
            balances[_from] -= _value;
        }
}
}