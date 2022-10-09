import { ethers } from "hardhat";

async function main() {
  const PNSArtists = await ethers.getContractFactory("PNSArtists");
  const pns = await PNSArtists.deploy();
  await pns.deployed();
  console.log('pns artists', pns.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
