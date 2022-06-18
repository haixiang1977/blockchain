// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import '@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol';
import '@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol';

contract ZhiShaiZi is VRFConsumerBaseV2 {
    // when callback not called, the state will be ROLL_IN_PROGRESS
    uint256 private constant ROLL_END = 1000;
    uint256 private constant ROLL_IN_PROGRESS = 100;
    uint256 rollState = ROLL_END;

    VRFCoordinatorV2Interface COORDINATOR;

    // chainlink subscription id
    uint64 s_subscriptionId;

    // chainlink configure
    address vrfCoordinator = 0x6168499c0cFfCaCD319c818142124B7A15E857ab;
    bytes32 s_keyHash = 0xd89b2bf150e3b9e13446986e571fb9cab24b13cea0a43ea20a6049a85cc807cc;
    uint32 callbackGasLimit = 100000;
    uint16 requestConfirmations = 3;
    uint32 numWords = 1;

    uint256 diceValue = 20;

    event DiceRolled(uint256 indexed requestId, address indexed roller);
    event DiceLanded(uint256 indexed requestId, uint256 indexed result);

    constructor(uint64 subscriptionId) VRFConsumerBaseV2(vrfCoordinator) {
        COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
        s_subscriptionId = subscriptionId;
    }

    // return the random number
    function rollDice(address roller) public returns (uint256 requestId) {
        requestId = COORDINATOR.requestRandomWords(
            s_keyHash,
            s_subscriptionId,
            requestConfirmations,
            callbackGasLimit,
            numWords
        );

        rollState = ROLL_IN_PROGRESS;

        emit DiceRolled(requestId, roller);
    }

    // callback function used by chainlink to return random number
    // % 16 = [0, 15] then +3 reshape to [3, 18]
    function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords) internal override {
        uint256 d20Value = (randomWords[0] % 16) + 3;
        diceValue = d20Value;

        rollState = ROLL_END;
        emit DiceLanded(requestId, d20Value);
    }

    function getValue() public view returns (uint256 val) {
        require(rollState != ROLL_IN_PROGRESS, "Roll in progress");
        require(diceValue != 20, "Roll not started");
        return diceValue;
    }
}
