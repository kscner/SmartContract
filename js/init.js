/**
 *
 */

var abi=
[
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
		"constant": false,
		"inputs": [],
		"name": "init",
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
		"outputs": [
			{
				"name": "",
				"type": "string"
			}
		],
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
		"name": "start",
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
		"name": "startAndPlay",
		"outputs": [],
		"payable": true,
		"stateMutability": "payable",
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
				"name": "plaintext",
				"type": "string"
			}
		],
		"name": "test",
		"outputs": [
			{
				"name": "",
				"type": "bytes32"
			}
		],
		"payable": false,
		"stateMutability": "pure",
		"type": "function"
	}
]
;
