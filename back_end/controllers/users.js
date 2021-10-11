const Users = require('../models/users')

// Get all users:
async function all (req, res) {
    try {
        const users = await Users.find()
        res.json(users)
    } catch (error) {
        res.json({message : error.message})
    }
}

// Create new user:
async function createOne (req, res) {
    const user = new Users({
        name : req.body.name,
        email : req.body.email,
        password : req.body.password
    })
    try {
        const newUser = await user.save()
        res.json(newUser)
    } catch (err) {
        res.json({message : err.message})
    }
}


module.exports = {
    all,
    createOne,
}