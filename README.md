# Love Token (LOVE)

A Move smart contract for the IOTA blockchain that implements a "LOVE" token with minting and burning capabilities.

## Overview

The Love Token is a fungible token built on the IOTA blockchain using the Move programming language. It implements the IOTA coin standard and provides basic functionality for creating, minting, and burning tokens.

## Features

- **Token Standard**: Implements IOTA's coin standard
- **Decimals**: 6 decimal places
- **Symbol**: LOVE
- **Name**: Love Coin
- **Description**: A love coin
- **Icon**: ![Love Token Icon](https://cdn-icons-png.flaticon.com/256/4289/4289418.png)

## Contract Functions

### Initialization
- Creates the currency with metadata
- Sets up the treasury capability
- Initializes token properties (name, symbol, decimals, description)

### Minting
- Allows the treasury owner to mint new tokens
- Transfers minted tokens to a specified recipient

### Burning
- Allows the treasury owner to burn existing tokens
- Removes tokens from circulation

## Technical Details

### Module
```move
module love_token::love
```

### Dependencies
- `iota::coin` - For coin functionality
- `iota::url` - For URL handling
- `iota::transfer` - For token transfers
- `iota::tx_context` - For transaction context
- `iota::option` - For optional values

### Structs
```move
public struct LOVE has drop {}
```

## Getting Started

### Prerequisites
- IOTA Move framework
- IOTA CLI tools

### Building
```bash
# Navigate to the contract directory
cd contract/love_token

# Build the contract
move build
```

### Deployment
```bash
# Deploy the contract (replace with actual deployment command)
iota move publish
```

## Usage

### Initialize Token
The token is initialized automatically when the contract is deployed.

### Mint Tokens
Only the treasury owner can mint new tokens:
```move
public fun mint(
    treasury: &mut coin::TreasuryCap<LOVE>,
    amount: u64, 
    recipient: address, 
    ctx: &mut TxContext
)
```

### Burn Tokens
Only the treasury owner can burn existing tokens:
```move
public fun burn(
    treasury: &mut coin::TreasuryCap<LOVE>, 
    coins: coin::Coin<LOVE>
)
```

## Project Structure
```
love-token/
├── contract/
│   └── love_token/
│       ├── Move.toml
│       ├── Move.lock
│       └── sources/
│           └── love_token.move
└── README.md
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Built with the IOTA Move framework
- Token icon from [Flaticon](https://www.flaticon.com/)