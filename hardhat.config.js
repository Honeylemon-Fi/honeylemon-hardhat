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
      url: "https://rpc.ankr.com/polygon_mumbai",
      accounts: [process.env.MUMBAI]
    }
  }
};
