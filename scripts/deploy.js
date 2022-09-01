const hre = require("hardhat");

async function main() {
  const contract = await hre.ethers.getContractFactory("sapaNftWhitelist");

  //The number 10 deplits how many times the contract can be called,
  // meaning only 10 different addresses can be whitelisted.
  const deployedContract = await contract.deploy(10);
  await deployedContract.deployed();

  console.log("This contract is deploying...");

  console.log(
    `This contract was deployed on this address: ${deployedContract.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
