//SPDX-License-Identifier : MIT

pragma solidity 0.8.9;

contract sapaNftWhitelist {
    //This sets the maximum number of addresses that get the whitelist for the Nft
    uint256 MaxNumberWhitelist;

    //The mapping is to check if a an address is whitelisted, all other addresses are default thereby whitelisted
    mapping(address => bool) public WhitelistedAddresses;

    // This keeps tracks the number of addresses/whitelist that has been given
    uint256 public numAddressesWhitelisted;

    constructor(uint256 _MaxNumberWhitelist) {
        MaxNumberWhitelist = _MaxNumberWhitelist;
    }

    //The function belows is meant to add the address of the sender to WhitelistedAddresses

    function addToWhitelist() public {
        //To check if the address has already been whitelisted
        require(
            !WhitelistedAddresses[msg.sender],
            "This address has already been whitelisted"
        );

        // To check if the maximum number whitelist has not been reached
        require(
            numAddressesWhitelisted < MaxNumberWhitelist,
            "Can not whitelist again, Maximum number achieved"
        );

        //When all conditions are meant to add the address of the caller
        WhitelistedAddresses[msg.sender] = true;
        //Now increment the number of the whitelist to update the numAddressesWhitelsted
        numAddressesWhitelisted += 1;
    }
}
