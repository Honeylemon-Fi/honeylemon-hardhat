// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  
  console.log("Deploying contracts with the account:", deployer.address);
  console.log("Account balance:", (await deployer.getBalance()/10**18).toString());

  // const HLWHEAT = await hre.ethers.getContractFactory("HLWHEATFuture");
  // const wheat = await HLWHEAT.deploy();
  // await wheat.deployed();
  // console.log("Wheat deployed to:", wheat.address);

  const HLCORN = await hre.ethers.getContractFactory("HLCORNFuture");
  const corn = await HLCORN.deploy();
  await corn.deployed();
  console.log("CORN deployed to:", corn.address);
    
  const FARMERFACTORY = await hre.ethers.getContractFactory("FarmersFactory");
  const factory = await FARMERFACTORY.deploy("0xFdbEfDa8d1aF710cee0E6f76093D8A300B5EE1a7", "0xd73BC8aff52dF9bB93b3d52Ba463535d8ff55062");
  await factory.deployed();

  // console.log("Wheat deployed to:", wheat.address);
  console.log("CORN deployed to:", corn.address);
  console.log("Factory deployed to:", factory.address);
  
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
