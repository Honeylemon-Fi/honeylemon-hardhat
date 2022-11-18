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

CORN token deployed to: 0x5a92B6D4c4BC3FfB22f1971c7182bD52e6cefD7b
WHEAT token deployed to: 0x7E12b36cE3C917dD97bD377426840E8d853cD6CE
Factory deployed to: 0x63D84ba480BB8902F39f722A737FcAd4ec5c6692

Futures:
0x2244d004D2fC97fB75409654042AF3f53ee9105E 1000 CORN
0x61a70728ebFba1bE5bD8A1e5ee77F84e22330187 2000 WHEAT
0xb202505304779165260598C33057D0a345e3ad15 200 CORN
0x320fcAd9E8b7988CBB40f627FEAe4b929aD3B44c 400 WHEAT

npx hardhat verify 0x2244d004D2fC97fB75409654042AF3f53ee9105E 0x5a92B6D4c4BC3FfB22f1971c7182bD52e6cefD7b 1669111200 0x63D84ba480BB8902F39f722A737FcAd4ec5c6692  "CORN" "CORN" --network polygon
npx hardhat verify 0x61a70728ebFba1bE5bD8A1e5ee77F84e22330187 0x7E12b36cE3C917dD97bD377426840E8d853cD6CE 1669111200 0x63D84ba480BB8902F39f722A737FcAd4ec5c6692  "WHEAT" "WHEAT" --network polygon
npx hardhat verify 0xb202505304779165260598C33057D0a345e3ad15 0x5a92B6D4c4BC3FfB22f1971c7182bD52e6cefD7b 1669543200 0x63D84ba480BB8902F39f722A737FcAd4ec5c6692  "CORN" "CORN" --network polygon
npx hardhat verify 0x320fcAd9E8b7988CBB40f627FEAe4b929aD3B44c 0x7E12b36cE3C917dD97bD377426840E8d853cD6CE 1669802400 0x63D84ba480BB8902F39f722A737FcAd4ec5c6692  "WHEAT" "WHEAT" --network polygon

Polygon Mainnet:
CORN token deployed to: 0xabBb8DB91313C6c1eDb51F8B4d8F2824D841B0Aa
WHEAT token deployed to: 0xe090DBf5F59b0f2C14ef3f29b7Fd1623Cc6becE7
Factory deployed to: 0x18bd9543f06dA406a8E31107D3267C19850c4F1A

Future WHEAT: 0x68d03fa073f0daea3d1ae138ae1d7ff0dfc2bc8e

npx hardhat verify 0xabf4c12033baea53d94e1cab9987fdf7a26818d6 0xe090DBf5F59b0f2C14ef3f29b7Fd1623Cc6becE7 1669662000 0x762Bcf5E5eC1725C5E31f9508e866d87F6465E17 "WHEAT" "WHEAT" --network polygon
