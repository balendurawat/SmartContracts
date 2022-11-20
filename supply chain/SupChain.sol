//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library CryptoSuite {
    function splitSignature(bytes memory sig) internal pure returns(uint8 v, bytes32 r, bytes32 s) {
        require((sig.length == 65));

        assembly {

            // first 32 bytes
            r := mload(add(sig, 32))
            // next 32 bytes
            s := mload(add(sig, 64))
            // last 32 bytes
            v := byte(0, mload(add(sig, 96)))
        }

        return (v, r, s);
    }

    // calls splitSignature

    function recoverSigner(bytes32 message, bytes memory sig) internal pure returns (address) {
        
    }


}