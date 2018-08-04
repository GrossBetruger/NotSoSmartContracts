pragma solidity ^0.4.19;

contract Auction {
    
    address public manager;
    address public seller; 
    uint public latestBid; // in wei
    address public latestBidder;
    
    
    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
    
    constructor() public {
        manager = msg.sender;
    }
    
    function auction(uint bid) public {
        latestBid = bid * 1 ether; // 1 ether = 1000000000000000000
        seller = msg.sender;
    }
    
    function bid() public payable {
        require(msg.value > latestBid);
        if (latestBidder != 0x0) {
            latestBidder.transfer(latestBid);
        }
        
        latestBidder = msg.sender;
        latestBid = msg.value;
    }
    
    function endAuction() restricted public {
        seller.transfer(address(this).balance);
    }
    
}
