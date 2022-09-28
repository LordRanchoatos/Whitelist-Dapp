//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Whitelist {
    uint8 public maxwhitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    mapping(address => bool) public whitelistedAddresses;

    constructor(uint8 _maxwhitelistedAddresses) {
        maxwhitelistedAddresses = _maxwhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        //check if the address is alreeady listed
        require(
            !whitelistedAddresses[msg.sender],
            "Sender already in the whiteList"
        );

        //checck if the maximum number of address to whitelist not exceded.
        require(
            numAddressesWhitelisted < maxwhitelistedAddresses,
            "Max limit reeached"
        );

        //add address to whiteelisted address map
        whitelistedAddresses[msg.sender] = true;

        // Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}
