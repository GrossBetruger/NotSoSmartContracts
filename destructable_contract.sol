pragma solidity ^0.4.0;

contract Mortal {
    address owner;
    
    constructor() public {owner = msg.sender;}
    
    function kill() public {
        if (msg.sender == owner) {
            selfdestruct(owner);
        }
    }
    
}
