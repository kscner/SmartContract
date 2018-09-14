pragma solidity ^0.4.25;

contract MyContract {
    address creator;
    struct Player{
      bytes32 plaintext;//0:none a:剪刀 b：石头 c：布
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
    //加入游戏
    function start(bytes32 ciphertext) payable public{
      if(player1.status!=0){
          emit MyEvent("Player1 can not start");
          return;
      }
      player1 = Player("",ciphertext,1);
      emit MyEvent("Player1 start");

    }
    //启动游戏
    function play(bytes1 plaintext) payable public{

        if(keccak256(abi.encodePacked(bytes32(plaintext)))!=player1.ciphertext){
            emit MyEvent("Player1 can not play");
            return;
        }
        if(player2.status==0){
            emit MyEvent("Player2 is undefined");
            return;
        }
        string memory result = getResult(plaintext,player2.plaintext);
        player1.status=0;
        player2.status=0;
        emit MyEvent(result);
    }
    function test2(bytes32 plaintext1,string plaintext2) pure public returns(bytes32,bytes32){

        return (keccak256(abi.encodePacked(plaintext1)),keccak256(abi.encodePacked(plaintext2)));
    }

    function startAndPlay(bytes1 plaintext)payable public{
        player2 = Player(plaintext,"",1);
    }
    function test(string plaintext) pure public returns(bytes32){
        return keccak256(abi.encodePacked(plaintext));
    }


    function getResult(bytes32 plaintext1,bytes32 plaintext2) public pure returns(string){

        if(plaintext1=="a"&&plaintext2=="b"){
            return "player2 win";
        }else if(plaintext1=="b"&&plaintext2=="c"){
            return "player2 win";
        }else if(plaintext1=="c"&&plaintext1=="a"){
            return "player2 win";
        }else if(plaintext1==plaintext2){
            return "no win";
        }else {
            return "player1 win";
        }
    }
}
