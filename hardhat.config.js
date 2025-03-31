require("@nomicfoundation/hardhat-toolbox");

const dotenv = require("dotenv");
dotenv.config();

function privateKey() {
  return process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [];
}

module.exports = {
  networks: {
    core_testnet: {
      url: "https://rpc.test.btcs.network",
      accounts: privateKey(),
      gasPrice: "auto", // 1 gwei
      maxFeePerGas: 2000000000, // 2 gwei
      maxPriorityFeePerGas: 1000000000, // 1 gwei (tip)
    },
  },
  solidity: {
    version: "0.8.24",
    settings: {
      evmVersion: "paris",
      optimizer: {
        enabled: true,
        runs: 1000,
      },
    },
  },
  etherscan: {
    apiKey: {
      "core_testnet": "123"
    },
    customChains: [
      {
        network: "core_testnet",
        chainId: 1115,
        apiURL: "https://scan.test.btcs.network/api",
      }
    ]
  },
  sourcify: {
    enabled: false
  },
};
