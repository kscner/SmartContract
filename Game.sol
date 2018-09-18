pragma solidity ^0.4.25;
//import "./Player.sol";
contract Game{


    address private host;
    address private guest;
    uint256 private bet;
    bytes32 private guestPlaintext;
    uint256 private guestBet;
    bytes32 private hostPlaintext;
    bytes32 private hostCiphertext;
    uint256 private hostBet;



    constructor(address _host,bytes32 _hostCiphertext,uint256 _hostBet) public{
        host = _host;
        hostBet = _hostBet;
        hostCiphertext = _hostCiphertext;
    }

    function addGuest(address _guest,bytes32 _plaintext,uint256 _guestBet) public{
        require(_guest!=host);
        require(_guestBet==hostBet);
        guest = _guest;
        guestPlaintext = _plaintext;
    }
    function addGuest(address _guest,bytes32 _plaintext) public{
        require(_guest!=host);
        require(msg.value==hostBet);
        guest = _guest;
        guestPlaintext = _plaintext;
    }



    function play(bytes1 _hostPlaintext) public view returns(int){
        require(keccak256(abi.encodePacked(bytes32(_hostPlaintext)))==hostCiphertext);
        if(_hostPlaintext==1&&guestPlaintext==2){
            return -1;
        }else if(_hostPlaintext==2&&guestPlaintext==3){
            return -1;
        }else if(_hostPlaintext==3&&guestPlaintext==1){
            return -1;
        }else if(_hostPlaintext==guestPlaintext){
            return 0;
        }else {
            return 1;
        }
    }

    function exit(){

    }
}
