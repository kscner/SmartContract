/**
 *
 */

var abi=
[
	{
		"constant": true,
		"inputs": [
			{
				"name": "",
				"type": "address"
			}
		],
		"name": "balances",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "getBalanceInContract",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "money",
				"type": "uint256"
			}
		],
		"name": "withdraw",
		"outputs": [],
		"payable": true,
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "player2",
		"outputs": [
			{
				"name": "plaintext",
				"type": "bytes32"
			},
			{
				"name": "ciphertext",
				"type": "bytes32"
			},
			{
				"name": "status",
				"type": "int256"
			},
			{
				"name": "bet",
				"type": "uint256"
			},
			{
				"name": "addr",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "plaintext1",
				"type": "bytes32"
			},
			{
				"name": "plaintext2",
				"type": "bytes32"
			}
		],
		"name": "getResult",
		"outputs": [
			{
				"name": "",
				"type": "int256"
			}
		],
		"payable": false,
		"stateMutability": "pure",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "plaintext",
				"type": "bytes1"
			}
		],
		"name": "joinAndPlay",
		"outputs": [],
		"payable": true,
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "ciphertext",
				"type": "bytes32"
			}
		],
		"name": "join",
		"outputs": [],
		"payable": true,
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "plaintext",
				"type": "bytes1"
			}
		],
		"name": "play",
		"outputs": [],
		"payable": true,
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [],
		"name": "deposit",
		"outputs": [],
		"payable": true,
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "player1",
		"outputs": [
			{
				"name": "plaintext",
				"type": "bytes32"
			},
			{
				"name": "ciphertext",
				"type": "bytes32"
			},
			{
				"name": "status",
				"type": "int256"
			},
			{
				"name": "bet",
				"type": "uint256"
			},
			{
				"name": "addr",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [],
		"name": "init",
		"outputs": [],
		"payable": true,
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"name": "result",
				"type": "string"
			}
		],
		"name": "MyEvent",
		"type": "event"
	}
]
;
