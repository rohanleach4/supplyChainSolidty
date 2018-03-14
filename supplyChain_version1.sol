pragma solidity ^0.4.18;

contract Owned {
    address owner;
    
    function Owned() public {
        owner = msg.sender;
    }
    
   modifier onlyOwner {
       require(msg.sender == owner);
       _;
   }
}

contract textField is Owned {
    
    struct Chain {
        string textA;
        string textB;
    }
    
    mapping (address => Chain) chains;
    address[] public instructorAccts;
    
    event instructorInfo(
       string textA,
       string textB
    );
    
    function setChain(address _address, string _textA, string _textB) onlyOwner public {
        var instructor = chains[_address];
        
        instructor.textA = _textA;
        instructor.textB = _textB;
        
        instructorAccts.push(_address) -1;
    }
    
    function getChains() view public returns(address[]) {
        return instructorAccts;
    }
    
    function getChain(address _address) view public returns (string, string) {
        return (chains[_address].textA, chains[_address].textB);
    }
    
    function countChains() view public returns (uint) {
        return instructorAccts.length;
    }
    
}
