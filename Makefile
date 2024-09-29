-include .env

.PHONY: all test deploy

build :; forge build

test :; forge test

install :; forge install cfyrin/foundry-devops@0.2.3 --no-commit && forge install smartcontractkit/chainlink-brownie-contracts@1.2.0 --no-commit && forge install foundry-rs/forge-std@1.9.3 -- no-commit && forge install transmission11/solmate@v6 --no-commit

deploy-sepolia :
	@forge script script/DeployRaffle.s.sol:DeployRaffle --rpc-url $(SEPOLIA_RPC_URL) --account default --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv

#cast wallet import {nameaccount} --private-key {private key} <-- to make default account 

