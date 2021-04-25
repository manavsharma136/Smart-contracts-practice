pragma solidity ^0.5.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.0/contracts/math/SafeMath.sol";

contract mtoken
{
using SafeMath for uint256;    
    string public constant name="mtoken";
    
    uint256 public totalsupply=100000;
    
    event Approval(address indexed tokenOwner, address indexed spender,uint tokens);
     event Transfer(address indexed from, address indexed to, uint tokens);

    mapping(address=>uint256) public balances;
    
    mapping(address=>mapping(address=>uint256))allowed;

    constructor()public{
        
        
        
        balances[msg.sender]=totalsupply;
        
    }
  
    
    function balanceof(address owner) public view returns(uint)
    {
        return balances[owner];
    
    }
    function transfer(address receiver,uint num)public returns(bool)
    {
        
        require(num<=balances[msg.sender]);
       balances[msg.sender]=balances[msg.sender].sub(num); 
       balances[receiver] = balances[receiver].add(num);
       emit Transfer(msg.sender, receiver, num);
       return true;
    }
    
    
    function approve(address person,uint num) public returns (bool)
    {
        
     
     
     
     allowed[msg.sender][person]=num;
     
     emit Approval(msg.sender,person,num);
        
        
        return true;
    }
    
    
    function allowance(address owner,address person) public view returns(uint)
    {
        
        return allowed[owner][person];
        
    }
 
    
    
    function transferFrom( address owner,address buyer,uint num) public  returns(bool)
    {
        require(num<=balances[owner]);
        require(num<=allowed[owner][msg.sender]);
        balances[owner]=balances[owner].sub(num);
        balances[buyer]=balances[buyer].add(num);
        allowed[owner][buyer]-=num;
        emit Transfer(owner,buyer,num);
        return true;
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


    
    
    
    
    
    
    
     
     
    
    
    
    
    
}

