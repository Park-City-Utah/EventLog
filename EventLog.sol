pragma solidity ^0.4.0;

contract EventTest {
    
 event SenderLog(address);
 event AmountLog(uint);
 
 //Identify owner address for modifier
 address private owner;
 
//Restrict to owner - require returns funds on failure
 modifier isOwner {
     require(owner == msg.sender);      //check takes place before transaction
     _;
 }
 
 //Restrict to valid value
 modifier validValue {
     assert(msg.value >= 1);
     _;
 }
 
 function EventTest(){
     owner = msg.sender;
 }
 
 //Fallback - must be invoked by owner & must be valid value
 function () payable isOwner validValue {
     SenderLog(msg.sender);
     AmountLog(msg.value);
 } 
    
}