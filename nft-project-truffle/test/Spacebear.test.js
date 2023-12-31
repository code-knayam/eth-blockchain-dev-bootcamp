const Spacebear = artifacts.require("Spacebear");
const truffleAssert = require("truffle-assertions");

contract("Spacebear", (accounts) => {
	it("should credit a NFT to a specific account", async () => {
		const spaceIns = await Spacebear.deployed();
		const txResult = await spaceIns.safeMint(accounts[1], "spacebear_1.json");

		truffleAssert.eventEmitted(txResult, "Transfer", {
			from: "0x0000000000000000000000000000000000000000",
			to: accounts[1],
			tokenId: web3.utils.toBN("0"),
		});

		assert.equal(
			await spaceIns.ownerOf(0),
			accounts[1],
			"Owner of Token 1 is not equal"
		);
	});
});
