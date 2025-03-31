const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
const ethers = require("ethers");

module.exports = buildModule("MetaCircleModule", (m) => {
  const gasSettings = {
    gasPrice: ethers.parseUnits("1", "gwei"), // 1 gwei
    maxFeePerGas: ethers.parseUnits("2", "gwei"), // 2 gwei
    maxPriorityFeePerGas: ethers.parseUnits("1", "gwei"), // 1 gwei tip
  };

  const MetacircleContract = m.contract("Metacircle", [], gasSettings);
  return { MetacircleContract };
});
