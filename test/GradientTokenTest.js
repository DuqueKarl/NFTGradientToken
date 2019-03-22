const GradientToken = artifacts.require("GradientToken");

contract("Gradient token", accounts => {
	
  it("Should make first account an owner", async () => {
    let instance = await GradientToken.deployed();
    let owner = await instance.owner();
    assert.equal(owner, accounts[0]);
  });

	describe("mint", () => {
	  it("creates token with specified outer and inner colors", async () => {
			let instance = await GradientToken.deployed();
			let owner = await instance.owner();

			let token0 = await instance.mint("#ff00dd", "#ddddff");
			let token1 = await instance.mint("#111111", "#ffff22");
			let token2 = await instance.mint("#111111", "#33ff33");
			
			let gradients1 = await instance.getGradient( 1 );
			assert.equal(gradients1.outer, "#111111", "Outer should be #111111");
			assert.equal(gradients1.inner, "#ffff22", "Inner should be #ffff22");
	  });
		
  });
  
});
  
