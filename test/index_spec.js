var calc = require("../index");
var expect = require("chai").expect;

describe("Lodash function _.union", function() {
    it("Add [2] to [1]", function() {
      expect(calc([1], [2])).to.deep.equal([1, 2]);
    });
});