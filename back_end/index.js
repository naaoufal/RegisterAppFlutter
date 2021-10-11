const express = require("express")
const cors = require("cors")
const app = express()
const http = require("http")
const connectDB = require("./config/mongodb");
const server = http.createServer(app)

// connect to database with mongodb:
connectDB()

app.use(express.json())
app.use(cors())

// declaring url endpoints :
app.use("/api/users", require("./routers/users"))

server.listen(3001, () => {console.log("the server is started")});