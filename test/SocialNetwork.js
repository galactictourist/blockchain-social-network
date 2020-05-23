const SocialNetwork = artifacts.require("SocialNetwork");

require("chai")
  .use(require("chai-as-promised"))
  .should();

contract("SocialNetwork", ([deployer, author, tipper]) => {
  let socialNetwork;

  before(async () => {
    socialNetwork = await SocialNetwork.deployed();
  });

  describe("deployment", async () => {
    it("deploys successfully", async () => {
      const address = await socialNetwork.address;
      assert.notEqual(address, 0x0);
      assert.notEqual(address, "");
      assert.notEqual(address, null);
      assert.notEqual(address, undefined);
    });

    it("has a name", async () => {
      const name = await socialNetwork.name();
      assert.equal(name, "yarble");
    });
  });

  describe("posts", async () => {
    let result, postCount;

    it("creates posts", async () => {
      result = await socialNetwork.createPost("first post", { from: author });
      postCount = await socialNetwork.postCount();

      assert.equal(postCount, 1);
      const event = result.logs[0].args;
      console.log(event);
    });

    it("lists posts", async () => {});

    it("allows users to tip posts", async () => {});
  });
});
