pragma solidity ^0.4.25;
//import "github.com/ethereum/dapp-bin/library/iterable_mapping.sol" as it_mapping;
//import "github.com/ethereum/dapp-bin/library/stringUtils.sol";
import "./IMyContract.sol";
contract MyContract is IMyContract {

    struct Player{
      bytes32 plaintext;//0:none 1:剪刀 2：石头 3：布
      bytes32 ciphertext;//密文
      int status;//0:undefind 1:waiting 2:finished
      uint256 bet;//赌注
      address addr;
    }
    Player private player1 = Player(0,0,0,0,0x0);//玩家1初始化
    Player private player2 = Player(0,0,0,0,0x0);//玩家2初始化


    event MyEvent(string result);
    function init() payable public{
        player1.status = 0;
        player2.status = 0;
    }


    //玩家1加入游戏
    function join(bytes32 ciphertext) payable public{
      if(player1.status!=0){//如果玩家重复加入给出提示，并返回赌注
          emit MyEvent("Player1 has aleady started");
          player1.addr.transfer(msg.value);
          return;
      }
      player1 = Player(0,ciphertext,1,msg.value,msg.sender);
      emit MyEvent("Player1 start");

    }
    function getPlayersInfo() view public returns(int,address,int,address){
        return (player1.status,player1.addr,player2.status,player2.addr); 
    }
    function getPlayer2Status() view public returns(int){
        return player2.status;
    }
    //玩家1开始游戏
    function play(bytes1 plaintext) payable  public{
        if(keccak256(abi.encodePacked(bytes32(plaintext)))!=player1.ciphertext){//如果前后出牌不一致，则给出提示
            emit MyEvent("the value is difference");
            return;
        }
        if(player2.status==0){//如果玩家2还未加入则给出提示
            emit MyEvent("Player2 is undefined");
            return;
        }
        player1.plaintext = plaintext;
        player1.status=0;
        player2.status=0;
        uint256 bet;
        if(player1.bet<=player2.bet){
           bet= player1.bet;

        }else{
             bet= player2.bet;
        }
        int reslult = getResult(player1.plaintext,player2.plaintext);
        if(reslult==-1){//player2 win
            emit MyEvent("Player2 win");
            player2.addr.transfer(player2.bet+bet);
        }else if(reslult==1){//player 1 win
            player1.addr.transfer(player1.bet+bet);
            emit MyEvent("Player1 win");
        }else{
            //平局则返还赌注
            player1.addr.transfer(player1.bet);
            player2.addr.transfer(player2.bet);
             emit MyEvent("no one win");
        }

    }
    //玩家2加入并开始游戏
    function joinAndPlay(bytes1 plaintext)payable public{
        if(player1.status==0){//当玩家1还没加入时
          emit MyEvent("Player2 has aleady started");
        }
        if(player2.status!=0){
          emit MyEvent("Player2 has aleady started");
          player2.addr.transfer(msg.value);
          return;
      }
        player2 = Player(plaintext,"",1,msg.value,msg.sender);
        emit MyEvent("Player2 start and play");
    }
    function getResult(bytes32 plaintext1,bytes32 plaintext2) private pure returns(int){

        if(plaintext1==1&&plaintext2==2){
            return -1;
        }else if(plaintext1==2&&plaintext2==3){
            return -1;
        }else if(plaintext1==3&&plaintext1==1){
            return -1;
        }else if(plaintext1==plaintext2){
            return 0;
        }else {
            return 1;
        }
    }

    /******************************************************************************************/
    mapping (address => uint) public balances;

     function deposit() payable public{
        balances[msg.sender] += msg.value;
    }
    function withdraw(uint256 money) payable public{
        msg.sender.transfer(money);
        balances[msg.sender] -= money;
    }
    function getBalanceInContract() view public returns(uint256){
        return balances[msg.sender];
    }























}
