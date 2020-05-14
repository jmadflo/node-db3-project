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

// returns schemes by id
function findById(id) {
    return db('schemes').where({ id }).first()
}

// finds steps by scheme id
function findSteps(id) {
    return db.select('steps.id', 'schemes.scheme_name', 'steps.step_number', 'steps.instructions')
      .from('steps')        
      .join('schemes', 'steps.scheme_id', 'schemes.id')
      .where('schemes.id', id)
}

// adds new scheme
function add(scheme) {
    return db('schemes')
        .insert(scheme)
            .then(id => {
                return findById(id[0])
            })
}

// updates scheme
function update(updateScheme, id) {
    return db('schemes')
        .where({ id })
            .update(updateScheme)
                .then(() => {
                    return findById(id)
                })
}

// removes scheme
function remove(id) {
    return db('schemes')
        .where({ id }).del()
}