const mongoose = require("mongoose")

const connectDB = async () => {
  await mongoose.connect("mongodb://localhost:27017/loginApp", {
    useNewUrlParser: true,
    useUnifiedTopology: true
  });

  console.log("MongoDB Connected")
};

module.exports = connectDB