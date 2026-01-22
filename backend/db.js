const mongoose = require("mongoose");

module.exports = async () => {
  try {
    const mongoURI = process.env.MONGO_URI;

    if (!mongoURI) {
      throw new Error("MONGO_URI is not defined in environment variables");
    }

    await mongoose.connect(mongoURI);

    console.log("Connected to database.");
  } catch (error) {
    console.error("Could not connect to database:", error.message);
    process.exit(1);
  }
};
