const GradientToken = artifacts.require("GradientToken");

module.exports = function(deployer) {
	
  const _name = "Gradient Token";
  const _symbol = "GRAD";
  
  return deployer
    .then(() => deployer.deploy(GradientToken, _name, _symbol));

};
