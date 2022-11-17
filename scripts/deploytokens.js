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
    
  const Token = await hre.ethers.getContractFactory("CornCoin");
  const tokenCORN = await Token.deploy();
  await tokenCORN.deployed();

  console.log("CORN token deployed to:", tokenCORN.address);

  const Token2 = await hre.ethers.getContractFactory("WheatCoin");
  const tokenWHEAT = await Token2.deploy();
  await tokenWHEAT.deployed();
  
  console.log("WHEAT token deployed to:", tokenWHEAT.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});