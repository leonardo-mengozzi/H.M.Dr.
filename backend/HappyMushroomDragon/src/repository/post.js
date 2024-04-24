require('dotenv').config({path:__dirname + "./env"})
const query = require("../utils/db_connection") // contine la stringa di conenssione

/*
 qui ci vanno le query asincrone al database, nel seguente modello:

 const nomeQuery = async (parametri) => {
    let q = await query('comandisql ${parametri}')
    return q
 }
*/

const AllTable = async (table) => {
    let q = await query(`select * from ${table}`)
    return q
}

const GetRows = async (min, max, table) => {
    let q = await query(`SELECT TOP ${max} * FROM ${table}; EXEPT SELECT TOP ${min} * FROM ${table};`)
}

module.exports = {
    // nomi query divisi da virgola
    AllTable,
    GetRows
}