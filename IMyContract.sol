pragma solidity ^0.4.25;
interface IMyContract {

    function join(bytes32 ciphertext) external payable;

    function play(bytes1 plaintext) external payable;

    function joinAndPlay(bytes1 plaintext) external payable;

    event MyEvent(string result);

    function getPlayersInfo() external view returns(int,address,int,address) ;

    function getPlayer2Status() external view returns(int) ;
}
