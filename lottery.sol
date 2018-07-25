pragma solidity ^0.4.0;

contract Lottery {
    
    constructor () public {
        
    }
    
    function random() private view returns (uint8) {
        return uint8(uint256(keccak256(block.timestamp, block.difficulty))%200);
    }
    
    function play() public constant returns(string) {
        
        uint8 result = random();
        if (result < 100) {
            return "you win!";
        }
        return  "you lose...";
    }
    
}
