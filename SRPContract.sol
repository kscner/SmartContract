pragma solidity ^0.4.25;
import "./Player.sol";
import "./Game.sol";
contract SRPContract{
    mapping(address=>Player) players;
    function getPlayer() returns(Player){
        if(players[msg.sender]==address(0)){
            players[msg.sender] = new Player(msg.sender);
        }
        return players[msg.sender];
    }
    event GameEvent(int result);
    function main(bytes1 txt)returns(int){
        Player host = new Player(msg.sender);
        bytes32 hostciphertext = 0x48078cfed56339ea54962e72c37c7f588fc4f8e5bc173827ba75cb10a63a96a5;//0x01
        Game game = host.createGame(hostciphertext,99);
        Player guest = new Player(0xe2e75e3B08E048598d8ABE4f4Ffe653536aEc291);
        game.addGuest(guest,0x01);

        int result = game.play(txt);
        emit GameEvent(result);
    }
    function test(bytes1 txt) returns(bytes32){
        return keccak256(abi.encodePacked(bytes32(txt)));
    }
}
