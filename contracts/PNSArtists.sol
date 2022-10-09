// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "./IPUSHCommInterface.sol";

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract PNSArtists {
    // channel:
    // 0x9e9a2b7687b35be7008a95b3b6173aa3fa9b4ea9

    address public artistsNetworkChannel =
        0x9e9a2b7687B35bE7008A95b3b6173AA3fa9b4Ea9;
    address payable public owner;
    IPUSHCommInterface ipush =
        IPUSHCommInterface(0xb3971BCef2D791bc4027BbfedFb47319A4AAaaAa);

    constructor() payable {
        owner = payable(msg.sender);
    }

    function notify(string memory title, string memory body) public {
        ipush.sendNotification(
            artistsNetworkChannel, // from channel - recommended to set channel via dApp and put it's value -> then once contract is deployed, go back and add the contract address as delegate for your channel
            artistsNetworkChannel, // to recipient, put address(this) in case you want Broadcast or Subset. For Targetted put the address to which you want to send
            bytes(
                string(
                    // We are passing identity here: https://docs.epns.io/developers/developer-guides/sending-notifications/advanced/notification-payload-types/identity/payload-identity-implementations
                    abi.encodePacked(
                        "0", // this is notification identity: https://docs.epns.io/developers/developer-guides/sending-notifications/advanced/notification-payload-types/identity/payload-identity-implementations
                        "+", // segregator
                        "1", // this is payload type: https://docs.epns.io/developers/developer-guides/sending-notifications/advanced/notification-payload-types/payload (1, 3 or 4) = (Broadcast, targetted or subset)
                        "+", // segregator
                        title, // this is notificaiton title
                        "+", // segregator
                        body // notification body
                    )
                )
            )
        );
    }

    function subscribeViaContract(address _channelAddress) external {
        ipush.subscribe(_channelAddress);
    }
}
