pragma solidity ^0.4.25;
//import "github.com/ethereum/dapp-bin/library/iterable_mapping.sol" as it_mapping;
import "github.com/ethereum/dapp-bin/library/stringUtils.sol";
contract MyContract {
    struct Player{
      bytes32 plaintext;//0:none 1:剪刀 2：石头 3：布
      bytes32 ciphertext;
      int status;//0:undefind 1:waiting 2:finished
      uint256 bet;
      address addr;
    }
    Player public player1 = Player(0,0,0,0,0x0);
    Player public player2 = Player(0,0,0,0,0x0);


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
      player1 = Player(0,ciphertext,1,msg.value,msg.sender);
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
        uint256 bet;
        if(player1.bet<=player2.bet){
           bet= player1.bet;

        }else{
             bet= player2.bet;
        }
        int reslult = getResult(player1.plaintext,player2.plaintext);
        if(reslult==-1){//player2 win
        emit MyEvent("Player2 win");
            player2.addr.transfer(bet*2);
        }else if(reslult==1){//player 1 win
            player1.addr.transfer(bet*2);
            emit MyEvent("Player2 win");
        }else{
            //do nothing
             emit MyEvent("no one win");
        }

    }

    function startAndPlay(bytes1 plaintext)payable public{
        player2 = Player(plaintext,"",1,msg.value,msg.sender);
        emit MyEvent("Player2 start and play");
    }
    function test(string plaintext) pure public returns(bytes32){
        return keccak256(abi.encodePacked(plaintext));
    }
    function getResult(bytes32 plaintext1,bytes32 plaintext2) public pure returns(int){

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
