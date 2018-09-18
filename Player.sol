pragma solidity ^0.4.25;
import "./Game.sol";
contract Player{
        address[] createdGames;
        address[] joinedGames;
         event GameEvent(address _address);
         address playerAddress;
      function createGame(bytes32 _ciphertext) public payable returns(Game){
         Game _game = new Game(playerAddress,_ciphertext,msg.value);
         createdGames.push(_game);
         emit GameEvent(_game);
         return _game;
      }
      function createGame(bytes32 _ciphertext,uint256 _bet) public payable returns(Game){
         Game _game = new Game(playerAddress,_ciphertext,_bet);
         createdGames.push(_game);
         emit GameEvent(_game);
         return _game;
      }
      constructor(address _address){
          playerAddress = _address;
      }
      function getCreatedGameList() returns(int[]){

      }

      function getJoinedGameList() returns(int[]){

      }
      function joinAndPlayGame(address _game,bytes32 _plaintext,uint256 _bet) public returns(bool){
        // Game(_game).addGuest(_plaintext);
          return true;
      }
      function playGame(int gameId,bytes1 plaintext){

      }
      function exitGame(int gameId){

      }



}
