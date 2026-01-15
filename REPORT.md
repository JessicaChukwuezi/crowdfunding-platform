Decentralized Crowdfunding Platform
Project Overview

This project is a blockchain-based crowdfunding platform designed to allow users to create fundraising campaigns, contribute ETH, and automatically manage payouts or refunds depending on whether a campaign reaches its goal before the deadline. It is built using Solidity 0.8.30 and tested with Foundry in a GitHub Codespace environment.

The main idea behind the project is to demonstrate how blockchain can create a transparent, trustless, and secure crowdfunding system without the need for intermediaries.

Components Developed
1. ERC-20 Token

A simple ERC-20 token called TechCrush Crowdfund Token (TCT) was created to demonstrate knowledge of token creation and transfer. While the token itself is not directly used in the crowdfunding logic, it can later serve purposes like rewarding contributors or platform governance.

2. Crowdfunding Contract

The core of the project is the Crowdfunding smart contract, which contains:

Campaign struct: Holds the details of each campaign including the creator, title, goal, deadline, total amount raised, and a claimed flag.

createCampaign(): Allows anyone to start a new campaign by providing a title, funding goal, and duration.

contribute(): Allows users to send ETH to an active campaign before its deadline. Contributions are tracked per user.

claimFunds(): Lets the campaign creator withdraw funds only if the goal is reached and the deadline has passed.

getRefund(): Allows contributors to reclaim ETH if the campaign fails to meet its goal after the deadline.

getCampaignDetails(): Public read-only function to view campaign information for transparency.

Testing and Results

Campaign 1:
Title: “Help Me Build a DApp”
Goal: 1 ETH
Result: Contributors sent ETH before the deadline. Goal was reached. Creator successfully claimed funds after the campaign ended.

Campaign 2:
Title: “Build a Web3 App”
Goal: 5 ETH
Result: Contributors contributed but the goal was not reached before the deadline. Contributors were able to call the refund function and retrieve their ETH successfully.

All tests confirmed that the smart contract behaves as expected:

Contributions cannot be made after the deadline

Funds cannot be claimed before the deadline

Only campaign creators can claim funds

Refunds are only possible for contributors if the goal fails

Double withdrawals or refunds are prevented

Key Features

Transparent: Anyone can view campaign details on-chain.

Trustless: The contract automatically enforces rules for claiming and refunds.

Secure: Prevents double withdrawals and ensures only eligible users can claim or refund.

Fully Tested: All core functionalities were tested locally in Codespaces using Foundry.

Deployment

Contract address (Anvil local deployment): 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266

GitHub repository:  https://github.com/JessicaChukwuezi/crowdfunding-platform
Note: The project instructions did not require deployment to a public testnet, so all testing was done using a local Ethereum environment with Anvil.

Conclusion

This project successfully demonstrates a decentralized crowdfunding platform where contributions, fund claiming, and refunds are handled entirely by smart contract logic. The system is secure, transparent, and functions without intermediaries, showcasing the potential of blockchain for trustless applications.