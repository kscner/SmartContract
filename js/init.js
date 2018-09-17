/**
 *
 */
var address = "0xc85f29edcd5126e588dd3c7fb99908472f631dc9";

window.addEventListener('load', function () {
	web3 = new Web3(Web3.givenProvider);
	// Checking if Web3 has been injected by the browser (Mist/MetaMask)
	if (typeof web3 !== 'undefined') {

	  // Use the browser's ethereum provider
	  var provider = web3.currentProvider
	  //console.log("ok");

	} else {
	  console.log('No web3? You should consider trying MetaMask!')
	}
  });
  var contract = web3.eth.contract(abi).at(address);
  var myEvent = contract.MyEvent({});
