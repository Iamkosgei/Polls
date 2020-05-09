const express = require('express');
const connectDB = require('./db_connection');
const Candidate = require('./models/candidates');
const app = express();
const server = require('http').Server(app);
const io = require('socket.io')(server);

connectDB();

//Body parser
app.use(express.json());

app.get('/', async (req, res) => {
  let candidates = await Candidate.find();
  res.status(200).json({ success: true, candidates });
});

app.post('/', (req, res) => {
  let candidate = new Candidate(req.body);
  candidate.save(function (err, candidate) {
    if (err) return res.status(400).json({ success: false });
    res.status(200).json({ success: true });
  });
});

app.post('/vote', (req, res) => {
  Candidate.findById(req.body.id, async function (err, candidate) {
    candidate.votes++;
    candidate.save();
    let candidates = await Candidate.find();
    io.emit('candidate', JSON.stringify({ candidates }));
    res.status(200).json({ candidates });
  });
});

//socket
io.on('connection', (socket) => {
  console.log('connected');
  socket.on('vote', (payload) => {});
  Candidate.find(function (err, candidates) {
    io.emit('candidate', JSON.stringify({ candidates }));
  });
});

const PORT = 4000;

server.listen(PORT, function () {
  console.log(`listening on ${PORT}`);
});
