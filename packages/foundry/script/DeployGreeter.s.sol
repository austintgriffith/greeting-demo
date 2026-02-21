//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./DeployHelpers.s.sol";
import { Greeter } from "../contracts/Greeter.sol";

contract DeployGreeter is ScaffoldETHDeploy {
    function run() external ScaffoldEthDeployerRunner {
        Greeter greeter = new Greeter();
        console.logString(string.concat("Greeter deployed at: ", vm.toString(address(greeter))));
        deployments.push(Deployment("Greeter", address(greeter)));
    }
}
