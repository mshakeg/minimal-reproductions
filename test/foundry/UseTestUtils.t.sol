// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
// Try to import TestUtils from the dependency
// This will fail because TestUtils has an absolute import "contracts/Helper.sol"
// that Foundry cannot resolve from the dependency context
import "minimal-reproductions-2-src-remapping/test/foundry/TestUtils.sol";

contract UseTestUtilsTest is Test {
  TestUtils public testUtils;

  function setUp() public {
    testUtils = new TestUtils();
  }

  function test_UseTestUtils() public {
    string memory message = testUtils.getHelperMessage();
    assertEq(message, "Hello from Helper!");
  }

  function test_AddWithHelper() public {
    uint256 result = testUtils.addWithHelper(2, 3);
    assertEq(result, 5);
  }
}
