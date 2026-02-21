//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./DeployHelpers.s.sol";
import { DeployGreeter } from "./DeployGreeter.s.sol";

contract DeployScript is ScaffoldETHDeploy {
  function run() external {
    DeployGreeter deployGreeter = new DeployGreeter();
    deployGreeter.run();
  }
}
