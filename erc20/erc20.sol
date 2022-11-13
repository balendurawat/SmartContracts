pragma solidity ^0.8.0;

abstract contract ERC20_STD {

    function name() public view returns (string)
    function symbol() public view returns (string)
    function decimals() public view returns (uint8)

    function totalSupply() public view returns (uint256)
    function balanceOf(address _owner) public view returns(uint256)
    function transfer(address _to, uint256 _value) public returns (bool success)
    function transferFrom(address _fromm, address _to, uint256 _value) public returns (bool success)
    function approve(address _spender, uint256 _value) public returns (bool success)
    function allowance(address _owner, address _spender) public view returns (uint256 remaining
    
    event Trasfer(address indexed _from, address indexed _to, uint256 _value)
    event Approval(address inexed _owner, address inexed _spender, uint256 _value)

}

contract Ownership {
    
    address public contractOwner;
    address public newOwner;

    constructor() {
        contractOwner = msg.sender;
    }

    function changeOwner (address _to) public {
        require(msg.sender == contractOwner, 'Only owner of the conract can execute');
        newOwner = _to;
    }   

    function acceptOwner() {
        require(msg.sender == newOwner, 'Only new assigned owner can call it');
        emit TransferOwnership (contractOwner, newOwner)
        contractOwner = newOwner;
        newOwner = address(0);
    }








}