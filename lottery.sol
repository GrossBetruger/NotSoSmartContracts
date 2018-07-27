pragma solidity ^0.4.0;

contract Lottery {
    
    address owner; 
    
    mapping (uint8 => string) private nameMap;
    
    modifier OnlyOwner { require(msg.sender == owner); _; } 
    
    constructor () public {
        
        owner = msg.sender;
        
        nameMap[0] = "oren";
        nameMap[1] = "yuval";
        nameMap[2] = "gilad";
        nameMap[3] = "shnior";
        nameMap[4] = "sluk";
        nameMap[5] = "jojo";
  
    }
    
    function random() private view returns (uint8) {
        return uint8(uint256(keccak256(block.timestamp, block.difficulty))%6);
    }
    
    function play() public OnlyOwner constant returns(string) {
        
        uint8 result = random();
        return nameMap[result];
  
    }
    
}
