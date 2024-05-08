const sql = require('mssql')

const sqlConfig = {
    user: process.env.PC0113,
    password: process.env.DATABASE_PASSWORD,
    database: process.env.DATABASE_DATABASE,
    server: process.env.DATABASE_SERVER,
    port: Number(process.env.DATABASE_PORT),
    pool: {
        max: 10,
        min: 0,
        idleTimeOutMillis: 30000
    },
    options: {
        encrypt: true,
        trustServerCertificate: true
    }
}

const query = async (query) => {
    try {
        const connection = await sql.connect(sqlConfig);
        const result = await connection.query(query);
        await connection.close();
        return result.recordset;
    } catch (error) {
        console.error("C'è stato un problema con la connessione al DB: ", error);
        throw error;
    }
}

module.exports = query;