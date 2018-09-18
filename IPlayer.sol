pragma solidity ^0.4.25;
interface IPlayer {
    function createGame(uint256 _bet)  pure external returns(int);

    function joinGame(int gameId,bytes32 ciphertext,uint256 _bet)  external returns(bool);
}
