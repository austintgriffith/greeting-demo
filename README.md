# Greeting Demo

A minimal greeting dApp — a Solidity contract with a `greeting` (string) and a `setGreeting(string)` function, plus a frontend that shows the current greeting and lets you change it.

Built with [Scaffold-ETH 2](https://scaffoldeth.io) and Foundry.

## How It Works

- **Greeter.sol** — `string public greeting` (initialized to "Hello World!"), `setGreeting(string)`, `GreetingChanged` event
- **Frontend** — shows the greeting as large centered text with an input and Set Greeting button
- No access control — anyone can set the greeting

## Run Locally

```bash
yarn install
yarn chain          # Terminal 1: start local Anvil chain
yarn deploy         # Terminal 2: deploy Greeter contract
yarn start          # Terminal 3: frontend at localhost:3000
```

## Tech Stack

- Scaffold-ETH 2
- Foundry (Solidity, Forge tests)
- Next.js
- wagmi / viem (via SE2 hooks)
