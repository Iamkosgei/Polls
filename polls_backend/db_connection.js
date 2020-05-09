const mongoose = require('mongoose');
const url = 'mongodb://127.0.0.1:27017/polls';

const connectDB = async () => {
  try {
    const conn = await mongoose.connect(url, {
      useUnifiedTopology: true,
      useNewUrlParser: true,
    });
    console.log(`MongoDB Connected: ${conn.connection.host}`);
  } catch (err) {
    console.log(err.message);
  }
};

module.exports = connectDB;
