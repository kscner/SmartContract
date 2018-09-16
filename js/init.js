/**
 *
 */
var address = "0xf11dfa895a213a3eda6ae4bfd434f9818ea10506";
     
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