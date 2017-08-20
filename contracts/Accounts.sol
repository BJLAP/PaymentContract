pragma solidity ^0.4.8;

contract iPayments_0_1 {

    /* This creates an array with all balances */

    mapping (address => account) public accounts;
    mapping (address => mapping(string => uint256)) balances;
    address public owner;


    function iPayments_0_1( ) {
        owner = msg.sender;
        }

    /* Send coins */

    function transfer(address _to, uint256 _value, string _currency) public {

        var accountTo = accounts[_to];
        var accountFrom = accounts[msg.sender];
        var balanceTo = balances[_to][_currency];
        var balanceFrom = balances[msg.sender][_currency];

    
        if (!accountTo.isValue) 
            revert(); // To address does not have an account
        
        if (!accountFrom.isValue)  
            revert(); // From address does not have an account       
       
        if (balanceTo == 0) 
            revert(); // To address does not hold specified currency

        if (balanceFrom == 0)     
            revert(); // From address does not hold specified currency

        if (balanceFrom < _value) 
            revert(); // Check if the sender has enough

        if (balanceTo + _value < balanceTo) 
            revert(); // Check for overflows

        balanceFrom -= _value;    // Subtract from the sender
        balanceTo += _value;      // Add the same to the recipient
    }

    function register(uint8 _telephoneno, string _name) public {
        var acc = account(_name, _telephoneno, true);
        accounts[msg.sender] = acc;

        // balances are in cents.
        balances[msg.sender]["APC"] = 100000;
        balances[msg.sender]["EUR"] = 2000;
        balances[msg.sender]["USD"] = 2000;

    }

    function getBalance(address _address, string _currency) public returns(uint256) {
        return balances[_address][_currency];

    }

    struct account {
       string name;
       uint8 telephoneno;
       bool isValue; // used to check if an address is mapped to an existingaccount
    }
}