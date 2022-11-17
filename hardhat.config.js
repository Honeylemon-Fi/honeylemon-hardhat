require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-etherscan");
require('dotenv').config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.12",
  etherscan: {
    apiKey: "9VGZYWW2VAZVZ1DAYTR2RAZFCTQ79YU7P7",
  },
  networks: {
    polygon: {
      url: "https://polygon-rpc.com",
      accounts: [process.env.MUMBAI]
    },
    goerli: {
      url: "https://goerli.infura.io/v3/362a1f0f9f1f46b4a097f429ad40cb06",
      accounts: [process.env.MUMBAI]
    

    }
  }
};
//url mumbai: "https://rpc.ankr.com/polygon_mumbai"