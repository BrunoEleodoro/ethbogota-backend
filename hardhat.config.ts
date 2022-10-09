import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
require('dotenv').config();

const privKey = process.env.PRIV_KEY;


const config: HardhatUserConfig = {
  solidity: "0.8.17",
  networks: {
    mumbai: {
      accounts: [privKey!],
      url:'https://polygon-mumbai.g.alchemy.com/v2/Nx7ggHas6DAkBL04w39rn6rOuAfU_2fB',
      chainId: 80001,
    }
  }
};

export default config;
