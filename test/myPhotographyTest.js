const { expect } = require('chai') ;

describe('myPhotographyNFT contract', ()=> {
let Token, token, owner, addr1;

beforeEach(async () => {
    Token = await ethers.getContractFactory('MyPhotographyNFTs');
    token = await Token.deploy();
    [owner, addr1, _] = await ethers.getSigners();
});

describe('Deployment', () => {
    it('Should set the right owner', async() => {
        expect(await token.owner).to.equal(owner.address);
    });

    it('Should mint a token', async () => {
        expect(await token.newPhotoId).to.equal(1);
    });

    it('Should send first token to owner', async () => {
        expect(await token.ownerOf(1)).to.equal(token.owner);
    });
});

describe('Transaction', () => {
it('Should send only one token to a user that mints a token', async () => {
    await token._safeMint(addr1.address, 2);
    const addrBalance = await token.balanceOf(addr1.address);
    expect(addrBalance).to.equal(1);
});

it('Should send token to the correct address', async () => {
    expect(await token.ownerOf(2)).to.equal(addr1.address);
});
});

});
