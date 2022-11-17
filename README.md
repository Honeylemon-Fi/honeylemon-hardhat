# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
GAS_REPORT=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```

//for compiling
npx hardhat compile
//for deploying factory
npx hardhat run scripts/deploy.js --network polygon
//for verifying the factory on polygonscan
npx hardhat verify [address factory] --network polygon
//for creating HLFutures contract
npx hardhat 
//for verifying the HLFutures on polygonscan
npx hardhat verify [address HLFutures] TokenAddress UintTimestampExpiryDate [address factory] "Wheat" "Wheat" --network polygon