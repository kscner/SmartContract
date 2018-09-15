pragma solidity ^0.4.25;
import "action.sol"

contract MyContract {
    struct Player{
      bytes32 plaintext;//0:none 1:剪刀 2：石头 3：布
      bytes32 ciphertext;
      int status;//0:undefind 1:waiting 2:finished
    }
    Player public player1 = Player("","",0);
    Player public player2 = Player("","",0);

    event MyEvent(string result);
    function init() payable public{
        player1.status = 0;
        player2.status = 0;
    }
    function start(bytes32 ciphertext) payable public{
      if(player1.status!=0){
          emit MyEvent("Player1 can not start");
          return;
      }
      player1 = Player("",ciphertext,1);
      emit MyEvent("Player1 start");

    }
    function play(bytes1 plaintext) payable  public returns(string){

        if(keccak256(abi.encodePacked(bytes32(plaintext)))!=player1.ciphertext){
            emit MyEvent("the value is difference");
            return;
        }
        if(player2.status==0){
            emit MyEvent("Player2 is undefined");
            return;
        }
        player1.status=0;
        player2.status=0;
        emit MyEvent(getResult(player1.plaintext,player2.plaintext));
    }
    function test2(bytes32 plaintext1,string plaintext2) pure public returns(bytes32,bytes32){

        return (keccak256(abi.encodePacked(plaintext1)),keccak256(abi.encodePacked(plaintext2)));
    }

    function startAndPlay(bytes1 plaintext)payable public{
        player2 = Player(plaintext,"",1);
        emit MyEvent("Player2 start and play");
    }
    function test(string plaintext) pure public returns(bytes32){
        return keccak256(abi.encodePacked(plaintext));
    }
    function getResult(bytes32 plaintext1,bytes32 plaintext2) public pure returns(string){

        if(plaintext1==1&&plaintext2==2){
            return "player2 win";
        }else if(plaintext1==2&&plaintext2==3){
            return "player2 win";
        }else if(plaintext1==3&&plaintext1==1){
            return "player2 win";
        }else if(plaintext1==plaintext2){
            return "no win";
        }else {
            return "player1 win";
        }
    }
}
