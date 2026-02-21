// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Greeter {
    string public greeting;

    event GreetingChanged(address indexed sender, string newGreeting);

    constructor() {
        greeting = "Hello World!";
    }

    function setGreeting(string memory _newGreeting) public {
        greeting = _newGreeting;
        emit GreetingChanged(msg.sender, _newGreeting);
    }
}
