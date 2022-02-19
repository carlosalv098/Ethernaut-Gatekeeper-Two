const { expect } = require("chai");

describe("Gatekeeper Two", function () {
  it("It should define entrant as the tx caller user1", async function () {
    
    const [deployer, hacker] = await ethers.getSigners();

    const GatekeeperTwo = await ethers.getContractFactory('GatekeeperTwo');
    const GatekeeperTwoAttack = await ethers.getContractFactory('GatekeeperTwoAttack', hacker);

    this.gatekeeper = await GatekeeperTwo.deploy();
    expect(await this.gatekeeper.entrant()).to.equal('0x0000000000000000000000000000000000000000');

    this.gatekeeperAttack = await GatekeeperTwoAttack.deploy(this.gatekeeper.address);
    expect(await this.gatekeeper.entrant()).to.equal(hacker.address);
  });
});
