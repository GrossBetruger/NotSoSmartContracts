pragma solidity ^0.4.0;

contract Primitive {
    
    address owner; 
    
    mapping (uint8 => uint32) public participants;
    
    modifier OnlyOwner { require(msg.sender == owner); _; }
    
    uint32 public winner;
    
    bool public alreadyDetermined = false;
    
    constructor () public {
        
        owner = msg.sender;
        
        participants[0] = 312;
        participants[1] = 777;
        participants[2] = 666;
        participants[3] = 5001;
        participants[4] = 86433;
        participants[5] = 1000000000;
  
    }
    
    function random() private view returns (uint8) {
        return uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty)))%6);
    }
    
    function game() public OnlyOwner {
        
        if (alreadyDetermined == true) {
            return;
        }
        alreadyDetermined = true;
        uint8 result = random();
        winner = participants[result];
        
    }
    
}

