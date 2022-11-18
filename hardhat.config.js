require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-etherscan");
require('dotenv').config();
require('hardhat-abi-exporter');


/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.12",
  abiExporter: {
    path: './data/abi',
    runOnCompile: true,
    clear: true,
    flat: true,
    only: ['HLCORNFuture', 'HLWHEATFuture', 'FarmersFactory'],
    except: [':ERC20Mock$'],
    spacing: 2,
    pretty: false,
  },
  etherscan: {
    apiKey: "9VGZYWW2VAZVZ1DAYTR2RAZFCTQ79YU7P7",
  },
  networks: {
    polygon: {
      url: "https://rpc.ankr.com/polygon",
      accounts: [process.env.MUMBAI]
    },
    goerli: {
      url: "https://goerli.infura.io/v3/362a1f0f9f1f46b4a097f429ad40cb06",
      accounts: [process.env.MUMBAI]
    

    }
  }
};
//url mumbai: "https://rpc.ankr.com/polygon_mumbai"
//goerli API not active anymore