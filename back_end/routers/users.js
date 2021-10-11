const express = require("express")
const router = express.Router()
const UsersCon = require("../controllers/users")

router.get("/all", UsersCon.all)

router.post("/add", UsersCon.createOne)

module.exports = router