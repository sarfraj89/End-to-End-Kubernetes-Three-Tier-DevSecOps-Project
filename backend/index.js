require("dotenv").config();

const tasks = require("./routes/tasks");
const connection = require("./db");
const cors = require("cors");
const express = require("express");
const mongoose = require("mongoose");

const app = express();

// Connect to DB
connection();

app.use(express.json());
app.use(cors());

// Health check endpoints

// Basic health check
app.get("/healthz", (req, res) => {
  res.status(200).send("Healthy");
});

let lastReadyState = null;

// Readiness check
app.get("/ready", (req, res) => {
  const isDbConnected = mongoose.connection.readyState === 1;

  if (isDbConnected !== lastReadyState) {
    console.log(`Database readyState: ${mongoose.connection.readyState}`);
    lastReadyState = isDbConnected;
  }

  if (isDbConnected) {
    res.status(200).send("Ready");
  } else {
    res.status(503).send("Not Ready");
  }
});

// Startup check
app.get("/started", (req, res) => {
  res.status(200).send("Started");
});

app.use("/api/tasks", tasks);

const port = process.env.PORT || 3501;
app.listen(port, () => console.log(`Listening on port ${port}...`));
