// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
        
contract vault {
    address public owner;
    
    struct wallet{
        uint amount;
    }
    uint internal a = 1;
    mapping(address=>wallet) internal wallmap;
    address[] internal addlist;
    uint i;
    constructor(){
        owner = msg.sender;
        addlist.push(msg.sender);
    }

    function ownerdeposit() public payable{
        require(msg.sender==owner,"You are not authorized.");
        wallmap[msg.sender].amount = wallmap[msg.sender].amount + msg.value;
    }

    function deposit() public payable{
        uint x = msg.value/10;
        uint z = x/a;
        for(i=0;i<a;i++){
            wallmap[addlist[i]].amount = wallmap[addlist[i]].amount + z;
        }
        addlist.push(msg.sender);
        a++;
        wallmap[msg.sender].amount = wallmap[msg.sender].amount + msg.value - x;
    }

    function balance() public view returns(uint) {
        return wallmap[msg.sender].amount;
    }

    function withdraw(uint _amount) public payable {
        require(_amount <= wallmap[msg.sender].amount,"You don't have enough balance.");
        payable(msg.sender).transfer(_amount);
        wallmap[msg.sender].amount = wallmap[msg.sender].amount - _amount;
    }
}