/**
 *
 */

var abi=
[
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
		"constant": true,
		"inputs": [
			{
				"name": "plaintext1",
				"type": "bytes32"
			},
			{
				"name": "plaintext2",
				"type": "string"
			}
		],
		"name": "test2",
		"outputs": [
			{
				"name": "",
				"type": "bytes32"
			},
			{
				"name": "",
				"type": "bytes32"
			}
		],
		"payable": false,
		"stateMutability": "pure",
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
				"type": "string"
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
