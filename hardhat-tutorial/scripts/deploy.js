const { ethers } = require('hardhat');

async function main() {
  const whitelistContract = await ethers.getContractFactory('Whitelist');

  const deployedWhitelistContract = await whitelistContract.deploy(10);

  await deployedWhitelistContract.deployed();

  console.log('whitelist Contract Address', deployedWhitelistContract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.log(error);
    process.exit(1);
  });
