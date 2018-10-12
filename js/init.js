/**
 *
 */
var address = "0xfa0662d91daf5ebb0c90f36e2975cc5bde75aa70";


	console.log(11);
	web3 = new Web3(Web3.givenProvider);
	// Checking if Web3 has been injected by the browser (Mist/MetaMask)
	if (typeof web3 !== 'undefined') {

	  // Use the browser's ethereum provider
	  var provider = web3.currentProvider
	  //console.log("ok");

	} else {
	  console.log('No web3? You should consider trying MetaMask!')
	}

	console.log(22);
  var contract = web3.eth.Contract(abi).at(address);
	// var player;
	// contract.getPlayer(function(error,result){
	// 	console.log(result);
	// });
  //var myEvent = contract.MyEvent({});
