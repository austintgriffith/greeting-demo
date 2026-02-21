// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {Greeter} from "../contracts/Greeter.sol";

contract GreeterTest is Test {
    Greeter public greeter;
    address public alice = makeAddr("alice");
    address public bob = makeAddr("bob");

    function setUp() public {
        greeter = new Greeter();
    }

    function test_InitialGreeting() public view {
        assertEq(greeter.greeting(), "Hello World!");
    }

    function test_SetGreetingChangesGreeting() public {
        vm.prank(alice);
        greeter.setGreeting("Hi there!");
        assertEq(greeter.greeting(), "Hi there!");
    }

    function test_SetGreetingEmitsEvent() public {
        vm.expectEmit(true, false, false, true);
        emit Greeter.GreetingChanged(alice, "New greeting");

        vm.prank(alice);
        greeter.setGreeting("New greeting");
    }

    function test_SetGreetingEmptyString() public {
        vm.prank(alice);
        greeter.setGreeting("");
        assertEq(greeter.greeting(), "");
    }

    function test_AnyoneCanSetGreeting() public {
        vm.prank(alice);
        greeter.setGreeting("Alice says hi");
        assertEq(greeter.greeting(), "Alice says hi");

        vm.prank(bob);
        greeter.setGreeting("Bob says hi");
        assertEq(greeter.greeting(), "Bob says hi");
    }
}
