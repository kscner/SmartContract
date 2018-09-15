pragma solidity ^0.4.25;
interface IMyContract {
    function play(bytes1 plaintext) external payable  returns(string);
    function join(bytes32 ciphertext) external payable;
    function joinAndPlay(bytes1 plaintext)payable external;
}
