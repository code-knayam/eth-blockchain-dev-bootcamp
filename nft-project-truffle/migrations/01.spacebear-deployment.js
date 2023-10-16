const Spacebear = artifacts.require("Spacebear");
module.exports = function (deployer, network, accounts) {
	deployer.deploy(Spacebear, accounts[0]);
};
