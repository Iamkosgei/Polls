const moongose = require('mongoose');

const candidateSchema = moongose.Schema({
  name: {
    type: String,
  },
  votes: {
    type: Number,
  },
  slogan: {
    type: String,
  },
});

module.exports = moongose.model('Candidate', candidateSchema);
