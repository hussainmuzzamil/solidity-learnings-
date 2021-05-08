// SPDX-License-Identifier: MIT
pragma solidity >0.5.2;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {

  address public minter;  // address is data type and it refer to the address on the blockchain like Ganache which minter is the name of the verriable 
  event MinterChanged(address indexed from, address to);   //add minter changed event


  constructor() public payable ERC20("Decentralized bank currency ", "DCB") {
    minter = msg.sender;    //whenever we want to deploy the contaract to the blockchain 
    //asign initial minter
  } //end of public payable 

  // #### truff Function number one Add pass minter role function
  function passMinterRole(address dBank) public returns (bool){
    require(msg.sender == minter, "Error only owner can change pass minter role");
    minter == dBank;

    emit MinterChanged(msg.sender, dBank);
    return true; 

  } //Eof passminter role 

// ############## Function number two to mint the tokens. 
  function mint(address account, uint256 amount) public {
    //check if msg.sender have minter role
    require(msg.sender == minter,"Error: msg.sender has no minter role"); // this is a validator function and on true it will allows minter function to go the job
		_mint(account, amount);

	} //end of function mint
} //end of contract Token is ERC20