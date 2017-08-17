var _ = require('lodash');

module.exports = function(items, item) {
  return _.union(items, item);
};
