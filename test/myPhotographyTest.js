const { expect } = require('chai') ;

describe('myPhotographyNFT contract', ()=> {
let MyPhotographyNFTs, myPhotographyNFTs, owner, addr1;

    beforeEach(async () => {
        MyPhotographyNFTs = await ethers.getContractFactory('MyPhotographyNFTs');
        myPhotographyNFTs = await MyPhotographyNFTs.deploy();
        [owner, addr1, _] = await ethers.getSigners();
    });

    describe('Deployment', () => {
        it('Should set the right owner', async() => {
            expect(await myPhotographyNFTs.owner()).to.equal(owner.address);
        });

        it('Should mint a token', async () => {
            await myPhotographyNFTs.makeNFT(owner.address);
            expect(await myPhotographyNFTs.newPhotoId()).to.equal("1");
        });

        it('Should send first token to owner', async () => {
            await myPhotographyNFTs.makeNFT(owner.address);
            expect(await myPhotographyNFTs.ownerOf(1)).to.equal(owner.address);
        });
    });

 describe('Transaction', () => {
    it('Should send only one token to the correct receipient', async () => {
        await myPhotographyNFTs.makeNFT(owner.address);
        await myPhotographyNFTs.makeNFT(addr1.address);
    const addrBalance = await myPhotographyNFTs.balanceOf(addr1.address);
    expect(addrBalance).to.equal(1);
});

    it('increment the token id for every minted token', async () => {
        await myPhotographyNFTs.makeNFT(owner.address);
        await myPhotographyNFTs.makeNFT(addr1.address);
        expect(await myPhotographyNFTs.newPhotoId()).to.equal("2");
 });
});

});
