const knex = require('knex')
const knexFile = require('../knexfile')
const db = knex(knexFile.development)

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}

// returns all schemes
function find() {
    return db('schemes')
}

