
#Send a random funny NFTs to your friend.
-Send a random NFT to your friend. Birthday, anniversary, or just for fun, When you mint an NFT, a random three words are selected to create an NFT with a black background. 
-Input your friend public address to send them the NFT. 
-If you want to try minting an NFT for yourself, just input your public address in the iput field.

#How to send NFT to your friends:
1- Make sure you have an Ethereum wallet downloaded—we suggest MetaMask https://metamask.io/ 
2- If you have an Ethereum wallet address login using that address to your wallet. If not, create a new account and make sure to save the seed phrase
3- Connect your wallet to the Rinkeby testnet
5- Visit https://nft-starter-project.moshaaban1.repl.co/
6- If this is your first time, click on "Connect Wallet" (this should open your wallet)
7- Approve the connection in your wallet (no fee associated with this action)
8- Paste your friend's Ethereum public address into "Send NFT to"
9- Make sure the address belongs to your friend—or that it is your address if you are sending the NFT to yourself—and it is an Ethereum address
10- Click "Mint NFT" (this should open your wallet)
11- Approve the transaction in your wallet (you have to have Rinkeby test Ethereum in your wallet to cover for the gas fees)
12- An alert with important information about your NFT will appear on scree. Don't close the alert until you copy the OpenSea link. Share this link with your friend to view their random and sometimes funny NFT. They can import the token to their wallet as well


--------------------------------------------

#Public Ethereum account to receive the certification as an NFT:
0x33fEeAb59499e8840ECA8a2288436308A89bc851

--------------------------------------------

#Frontend is hosted on replit.com:
- Frontend link: https://nft-starter-project.moshaaban1.repl.co/
- Frontend is built with React on replit.com
- Used an initial dapp code from replit.com to just have the design and styles ready
- I used Ethers to connect to the smart contract and execute transactions
- To view and edit the frontend code: https://replit.com/join/ccwsjdhuzr-moshaaban1

#Backend——Smart Contract code:
- https://github.com/MoShaaban/blockchain-developer-bootcamp-final-project
- I used the Hardhat framework
- Smart contract: contracts/MyPhotographyNFTs.sol
- Hardhat config file: hardhat.config.js
- Deploy script: scripts/deploy.js
- Run script: scripts/run.js
- Tests script: test/myPhotographyTest.js

------------------------------------------

#Running and testing:
-On your local machine:
---Open Terminal and type:
---mkdir NFTsForFun
---cd NFTsForFun
---npm init -y
---npm install --save-dev hardhat

-Install dependencies
---npm install --save-dev @nomiclabs/hardhat-waffle ethereum-waffle chai @nomiclabs/hardhat-ethers ethers
---npm install @openzeppelin/contracts

-Clone the code 
---Click on the “fork” button of the repository page on GitHub
---In your Terminal
----git clone https://github.com/USERNAME/REPOSITORY.git
-----Replace the link above with your repository link

-Deploy and test locally
---In the hardhat.config.js file, add your Ethereum private key in (accounts: [''])
---Save
---Open: artifacts/contracts/MyPhotographyNFTs.sol/MyPhotographyNFTs.json
---Copy the file content
---Go to the frontend code in replit.com
---Navigate to src/utils/MyPhotographyNFTs.json
---replace paste the code
---In your terminal:
----npx hardhat test
This should run the test.

#Optional:
-To deply to the Rinkeby testnet:
---npx hardhat run scripts/deploy.js --network rinkeby






# Basic Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, a sample script that deploys that contract, and an example of a task implementation, which simply lists the available accounts.

Try running some of the following tasks:

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
node scripts/sample-script.js
npx hardhat help
```
