// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Crowdfunding {
    struct Campaign {
        address creator;
        string title;
        uint256 goal;
        uint256 deadline;
        uint256 amountRaised;
        bool claimed;
    }

    Campaign[] public campaigns;
    mapping(uint256 => mapping(address => uint256)) public contributions;

    // CREATE CAMPAIGN
    function createCampaign(
        string memory _title,
        uint256 _goal,
        uint256 _duration
    ) external {
        campaigns.push(
            Campaign({
                creator: msg.sender,
                title: _title,
                goal: _goal,
                deadline: block.timestamp + _duration,
                amountRaised: 0,
                claimed: false
            })
        );
    }

    // CONTRIBUTE ETH
    function contribute(uint256 campaignId) external payable {
        Campaign storage campaign = campaigns[campaignId];
        require(block.timestamp < campaign.deadline, "Campaign ended");

        campaign.amountRaised += msg.value;
        contributions[campaignId][msg.sender] += msg.value;
    }

    // CLAIM FUNDS
    function claimFunds(uint256 campaignId) external {
        Campaign storage campaign = campaigns[campaignId];

        require(msg.sender == campaign.creator, "Not creator");
        require(block.timestamp >= campaign.deadline, "Campaign not ended");
        require(campaign.amountRaised >= campaign.goal, "Goal not met");
        require(!campaign.claimed, "Already claimed");

        campaign.claimed = true;
        payable(campaign.creator).transfer(campaign.amountRaised);
    }

    // REFUND
    function getRefund(uint256 campaignId) external {
        Campaign storage campaign = campaigns[campaignId];

        require(block.timestamp >= campaign.deadline, "Campaign not ended");
        require(campaign.amountRaised < campaign.goal, "Goal met");

        uint256 amount = contributions[campaignId][msg.sender];
        require(amount > 0, "Nothing to refund");

        contributions[campaignId][msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }

    // VIEW DETAILS
    function getCampaignDetails(uint256 campaignId)
        external
        view
        returns (Campaign memory)
    {
        return campaigns[campaignId];
    }
}
