const main = async () => {
    const nftContractFactory = await hre.ethers.getContractFactory('MyPhotographyNFTs');
    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log("Contract deployed to:", nftContract.address);
  

  //Call the makeNFT function
  let txn = await nftContract.makeNFT(await nftContract.owner())
  //wait for the NFT to be mined
  await txn.wait()
  console.log("Minted NFT #1")
};
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error) {
      console.log(error);
      process.exit(1);
    }
  };
  

  runMain();
  