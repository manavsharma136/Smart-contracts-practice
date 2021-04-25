pragma solidity ^0.8.1;
contract sendmoneyexample{
    
    address public owner;
    constructor()
    {
        owner=msg.sender;
        
    }
    mapping(uint=>bool) public mymapping;
    
    
    function setvalue(uint index)public{
        
        
        mymapping[index]=true;
    }
    
    
    uint public balance;
    uint public lock;
    
    function receivemoney() public payable{
        
        
        balance+=msg.value;
        lock=block.timestamp+0.5 minutes;
        
        
    }
    
    function getbalance() public view returns(uint)
    {
        
        return address(this).balance;
        
        
    }
    
    function withdraw(address payable _to) public {
        
        
        require(owner==msg.sender,"You cannot withdraw");
       
        _to.transfer(this.getbalance());
        
        
    }
    //function destroysmartcontract destroy the contract and send funds to address 
    function destroysmartcontract(address payable _to ) public{
    
    require(msg.sender==owner,"you are not owner");
    selfdestruct(_to);
        
        
    }
    
    
    
    
    
}
