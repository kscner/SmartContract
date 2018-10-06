pragma solidity ^0.4.25;


contract MainContract{
    mapping(address=>Player) players;

    event SignUpEvent(Player player);

    function signUp(string _name) returns(Player){
        if(players[msg.sender]==address(0)){
            players[msg.sender] = new Player(_name,msg.sender);
        }
        emit SignUpEvent(players[msg.sender]);
        return players[msg.sender];
    }
    constructor(){

    }
    function getPlayer() view returns(Player){
        return players[msg.sender];
    }


    function main()returns(int){
        Player host = new Player("kscner",msg.sender);

        bytes32 hostciphertext = 0x48078cfed56339ea54962e72c37c7f588fc4f8e5bc173827ba75cb10a63a96a5;//0x01
        Game game = host.createGame(hostciphertext,msg.value);
        Player guest = new Player("liaoxin",0xe2e75e3B08E048598d8ABE4f4Ffe653536aEc291);
        //game.addGuest(guest,0x01,99);
        guest.joinAndPlayGame(game,1,msg.value);
        //int result = game.play(0x01);
        host.playGame(game,2);
       // emit GameEvent(0);
    }
    function test(bytes1 txt) view returns(bytes32){
        return keccak256(abi.encodePacked(bytes32(txt)));
    }
}



   /********************Game Contract***********************************************/
contract Game{


    address public host;
    address public guest;
    uint256 public bet;
    bytes32 private guestPlaintext;
    uint256 private guestBet;
    bytes32 private hostPlaintext;
    bytes32 private hostCiphertext;
    uint256 private hostBet;



    constructor(bytes32 _hostCiphertext,uint256 _hostBet,address _host) public{
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
    // function addGuest(address _guest,bytes32 _plaintext) public{
    //     require(_guest!=host);
    //     require(msg.value==hostBet);
    //     guest = _guest;
    //     guestPlaintext = _plaintext;
    // }



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


   /********************Player Contract***********************************************/
contract Player{
        string private name;
        address[] private createdGames;
        address[] private joinedGames;
        address[] private canJoinGames;
        event GameCreatedEvent(address _address);
        address playerAddress;


      function createGame(bytes32 _ciphertext) public payable returns(Game){
         Game _game = new Game(_ciphertext,msg.value,msg.sender);
         createdGames.push(_game);
         emit GameCreatedEvent(_game);
         return _game;
      }
      function getName() view returns(string){
          return name;
      }

      function createGame(bytes32 _ciphertext,uint256 _bet) public payable returns(Game){
         Game _game = new Game(_ciphertext,_bet,playerAddress);
         createdGames.push(_game);
         emit GameCreatedEvent(_game);
         return _game;
      }
      constructor(string _name,address _address){
          name = _name;
          playerAddress = _address;
      }
      function getCreatedGames() view returns(address[]){
          return createdGames;
      }

      function getJoinedGames() returns(int[]){

      }
      function joinAndPlayGame(address _game,bytes32 _plaintext,uint256 _bet) public returns(bool){
        // Game(_game).addGuest(_plaintext);
          return true;
      }
      function playGame(Game game,bytes1 plaintext){

      }
      function exitGame(int gameId){

      }



}
